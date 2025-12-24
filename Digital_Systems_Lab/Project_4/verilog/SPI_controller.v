`timescale 1ns/1ps

module SPI_controller(reset, clk, CS, MISO, MOSI, SCLK, ADXL_OUT_ready, c_ADXL_OUT, start_command, COMMAND);
    input   clk, reset, MISO, start_command;
    input   [23:0] COMMAND;
    output  CS, MOSI, SCLK, ADXL_OUT_ready;
    output  [23:0] c_ADXL_OUT;

    reg     [23:0] n_ADXL_OUT, c_ADXL_OUT; //This variable combines thge 3 output bytes that the SPI gives us while inputing a command
    reg     ADXL_OUT_ready; //This tells us when the abive is ready

    reg     Enable;
    reg     [7:0] DATA_IN_SPI;
    wire    [7:0] DATA_OUT_SPI;
    wire    complete, CS; //complete means that the byte given has been sent and a byte has been recieved

    reg     [2:0] n_state_SPI_con, c_state_SPI_con;

    localparam [2:0] 
        IDLE        = 3'b000,
        FIRST       = 3'b001,
        COLLECT_1   = 3'b010,
        SECOND      = 3'b011,
        COLLECT_2   = 3'b100,
        THIRD       = 3'b101,
        DISABLE     = 3'b110,
        DATA_SAVED  = 3'b111;

    always@(c_state_SPI_con or complete or COMMAND or DATA_OUT_SPI or c_ADXL_OUT or start_command) begin
        case(c_state_SPI_con)
            IDLE:begin
                ADXL_OUT_ready = 0;
                Enable = 0;
                DATA_IN_SPI = 0;
                n_ADXL_OUT = c_ADXL_OUT;
                if(start_command) n_state_SPI_con = FIRST; //When the command driver start the command this moves to the first state
                else n_state_SPI_con = c_state_SPI_con;
            end
            FIRST:begin //Gives the first byte of the command and waits to be sent
                ADXL_OUT_ready = 0;
                Enable = 1'b1;
                DATA_IN_SPI = COMMAND[23:16];
                n_ADXL_OUT = c_ADXL_OUT;
                if(complete) n_state_SPI_con = COLLECT_1;
                else n_state_SPI_con = c_state_SPI_con;
            end
            COLLECT_1:begin //Collects the output of the SPI
                ADXL_OUT_ready = 0;
                Enable = 1'b1;
                DATA_IN_SPI = COMMAND[15:8];               
                n_ADXL_OUT = {DATA_OUT_SPI, c_ADXL_OUT[15:0]};
                n_state_SPI_con = SECOND;
            end
            SECOND:begin //Second byte
                ADXL_OUT_ready = 0;
                Enable = 1'b1;
                DATA_IN_SPI = COMMAND[15:8];
                n_ADXL_OUT = c_ADXL_OUT;
                if(complete) n_state_SPI_con = COLLECT_2;
                else n_state_SPI_con = c_state_SPI_con;
            end
            COLLECT_2:begin //Collects output
                ADXL_OUT_ready = 0;
                Enable = 1'b1;
                DATA_IN_SPI = COMMAND[15:8];
                n_ADXL_OUT = {c_ADXL_OUT[23:16], DATA_OUT_SPI, c_ADXL_OUT[7:0]};
                n_state_SPI_con = THIRD;
            end
            THIRD:begin //Thrird byte
                ADXL_OUT_ready = 0;
                Enable = 1'b1;
                DATA_IN_SPI = COMMAND[7:0];
                n_ADXL_OUT = c_ADXL_OUT;
                if(complete) n_state_SPI_con = DISABLE;
                else n_state_SPI_con = c_state_SPI_con;
            end
            DISABLE:begin //Collects last byte and disables the SPI
                ADXL_OUT_ready = 0;
                Enable = 0;
                DATA_IN_SPI = 0;
                n_ADXL_OUT = {c_ADXL_OUT[23:8], DATA_OUT_SPI};
                n_state_SPI_con = DATA_SAVED;
            end
            DATA_SAVED: begin //Data is now in the c_ADXL_OUT reg and is ready to be used from the command driver
                ADXL_OUT_ready = 1'b1;
                Enable = 0;
                DATA_IN_SPI = 0;
                n_ADXL_OUT = c_ADXL_OUT;
                n_state_SPI_con = IDLE;
            end
            default:begin
                ADXL_OUT_ready = 0;
                Enable = 0;
                DATA_IN_SPI = 0;
                n_state_SPI_con = IDLE;
            end
        endcase
    end

    always@(posedge clk or posedge reset) begin
        if(reset)  c_state_SPI_con <= IDLE;
        else c_state_SPI_con <= n_state_SPI_con;
    end

    always@(posedge clk or posedge reset) begin
        if(reset)  c_ADXL_OUT <= 0;
        else c_ADXL_OUT <= n_ADXL_OUT;
    end
    //SPI module
   SPI SPI(.reset(reset), .clk(clk), .Enable(Enable), .MISO(MISO), .DATA_IN(DATA_IN_SPI), 
   .DATA_OUT(DATA_OUT_SPI), .complete(complete), .CS(CS), .n_MOSI(MOSI), .SCLK(SCLK));
endmodule