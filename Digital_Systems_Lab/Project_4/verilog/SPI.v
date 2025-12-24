`timescale 1ns/1ps

module SPI(reset, clk, Enable, MISO, DATA_IN, DATA_OUT, complete, CS, n_MOSI, SCLK);
    input       reset, clk, Enable, MISO;
    input       [7:0] DATA_IN;
    output reg  CS, complete, n_MOSI;
    output reg  [7:0] DATA_OUT;
    output      SCLK;

    wire    pos_EDGE;
    reg     clk_delayed, c_MOSI, setup_counter_enable, total_counter_enable; //Setup counter counts the CS set up time 
    reg     [4:0] edge_counter, setup_counter; //edge counter the number of pos edges
    reg     [3:0] c_state_SPI, n_state_SPI;
    reg     [7:0] n_SPI_REG, c_SPI_REG;
    reg     [7:0] total_counter; //counter than is used to know when the 8 bits have been transfered
    
    localparam [2:0] 
        IDLE            = 3'b000,
        CS_SETUP        = 3'b001,
        START_TRANS     = 3'b010,
        SET_MOSI        = 3'b011,
        SAMPLE_MISO     = 3'b100,
        WAIT_NEXT_BIT   = 3'b101,
        TRANS_COMPLETE  = 3'b110,
        STOP_OR_NOT     = 3'b111;
    //Clock divider to 200ns from 10ns
    MMCM clock_div(.reset(reset), .clk(clk), .clk_new(SCLK));
    //Creates a signal that ebables for one clock cycle every time we have a pos edge of the SCLK
    assign pos_EDGE = SCLK & ~clk_delayed;
    //edge counter
    always@(posedge clk or posedge reset) begin
        if(reset) edge_counter <= 0;
        else if(pos_EDGE) edge_counter <= 1'b1;
        else edge_counter <= edge_counter + 1'b1;
    end
    //Setup counter
    always@(posedge clk or posedge reset) begin
        if(reset) setup_counter <= 0;
        else if(setup_counter_enable) setup_counter <= setup_counter + 1'b1;
        else setup_counter <= 0;
    end
    //Total counter
    always@(posedge clk or posedge reset) begin
        if(reset) total_counter <= 0;
        else if(total_counter_enable) total_counter <= total_counter + 1'b1;
        else total_counter <= 0;
    end

    always@(posedge clk or posedge reset) begin
        if(reset) c_state_SPI <= IDLE;
        else c_state_SPI <= n_state_SPI;
    end

    //Creates a copy og the SCLK but delayed for one cycle
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            clk_delayed <= 0;
            c_MOSI <= 0;
            c_SPI_REG <= 0;
        end else begin
            clk_delayed <= SCLK;
            c_MOSI <= n_MOSI;
            c_SPI_REG <= n_SPI_REG;
        end
    end

    always@(c_state_SPI or edge_counter or Enable or setup_counter or total_counter or c_MOSI or c_SPI_REG or DATA_IN or MISO) begin
        n_MOSI = 0;
        CS = 0;
        setup_counter_enable = 0;
        total_counter_enable = 0;
        n_SPI_REG = 0;
        complete = 0;
        DATA_OUT = 0;
        n_state_SPI = c_state_SPI;
        case(c_state_SPI) 
            IDLE:begin
                CS = 1;
                if(Enable) begin
                    n_state_SPI = CS_SETUP;
                end else begin
                    n_state_SPI = IDLE;
                end
            end
            CS_SETUP:begin //Waits 100ns and aligns the drop of the CS with a neg edge
                CS = 1;
                setup_counter_enable = 1'b1;
                if(setup_counter > 'd9 && edge_counter == 'd9) begin
                    n_state_SPI = START_TRANS;
                end else begin 
                    n_state_SPI = c_state_SPI;
                end
            end
            START_TRANS:begin //Inserts the data we want to trans in the SPI shift reg
                CS = 0;
                n_SPI_REG = DATA_IN;
                total_counter_enable = 1'b1; //Starts the total counter
                n_state_SPI = SET_MOSI;
            end
            SET_MOSI:begin //10ns after CS drop and 90ns before the MOSI collestion from the slave MOSI is initialized
                total_counter_enable = 1'b1;
                n_MOSI = c_SPI_REG[7];
                n_SPI_REG = c_SPI_REG;
                if(edge_counter == 'd19) begin //1 cycle before MISO collection go to the next state
                    n_state_SPI = SAMPLE_MISO;
                end else begin
                    n_state_SPI = c_state_SPI;
                end
            end
            SAMPLE_MISO:begin //This is at posedge where we sample the MISO
                n_MOSI = c_MOSI;
                total_counter_enable = 1'b1;
                n_SPI_REG = (c_SPI_REG << 1) + MISO; //MISO is shifted in the shift register
                n_state_SPI = WAIT_NEXT_BIT;
            end
            WAIT_NEXT_BIT:begin
                n_MOSI = c_MOSI;
                n_SPI_REG = c_SPI_REG;
                total_counter_enable = 1'b1;
                if(total_counter < 'd145 && edge_counter == 'd9) begin // < 145 means that there are bits to transfer //  == 9 beacause at 10(negedge )
                    n_state_SPI = SET_MOSI;                            // the MOSI should be initialized
                end else if(total_counter >= 'd145 && edge_counter == 'd9) begin // if > 145 8 bits have been already transfered and goes to trans_complete
                    n_state_SPI = TRANS_COMPLETE;
                end else begin
                    n_state_SPI = c_state_SPI;
                end
            end
            TRANS_COMPLETE:begin //This state gives a complete signal
                DATA_OUT = c_SPI_REG;
                n_SPI_REG = c_SPI_REG;
                complete = 1'b1;
                n_state_SPI = STOP_OR_NOT; 
            end
            STOP_OR_NOT:begin                   //Enables counter, waits for 1 cycle plus the one before to finish the trans
                setup_counter_enable = 1'b1;    //and on this window (20ns) the SPI_controller must decide if to stop or continiue
                DATA_OUT = c_SPI_REG;
                n_SPI_REG = c_SPI_REG;
                if(Enable && setup_counter == 1'b1) begin
                    n_state_SPI = START_TRANS;
                end else if(setup_counter == 1'b1) begin
                    n_state_SPI = IDLE; 
                end else begin
                    n_state_SPI = c_state_SPI;
                end  
            end
            default: begin
                n_state_SPI = IDLE;
            end
        endcase
    end

endmodule