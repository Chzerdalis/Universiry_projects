`timescale 1ns/1ps

module uart_tb_FSM();
    reg reset, clk, Tx_WR;
    reg [7:0] Tx_DATA, n_Tx_DATA;
    reg Tx_EN, Rx_EN;  //input but assign
    reg [2:0] baud_select;  //input but assign
    wire [7:0] Rx_DATA;
    wire Tx_BUSY, Rx_FERROR, Rx_PERROR, Rx_VALID;
    reg [2:0] state, next_state;
    reg [7:0] DATA [0:3];
    integer i, ni;

    localparam [1:0] 
        IDLE      = 2'b00,
        INIT      = 2'b01,
        TRANFER   = 2'b10,
        FINISHED  = 2'b11;

    uart uart (
        .reset(reset),
        .clk(clk),
        .baud_select(baud_select),
        .Tx_EN(Tx_EN),
        .Tx_WR(Tx_WR),
        .Tx_DATA(Tx_DATA),
        .Rx_EN(Rx_EN),
        .Tx_BUSY(Tx_BUSY),
        .Rx_PERROR(Rx_PERROR),
        .Rx_FERROR(Rx_FERROR),
        .Rx_VALID(Rx_VALID),
        .Rx_DATA(Rx_DATA)
    );

    always #5 clk =~ clk;

    always@(posedge clk) begin
        state <= next_state;
        i <= ni;
        Tx_DATA <= n_Tx_DATA;
    end

    initial begin
        state = IDLE;
        baud_select = 3'b111;
        i = 0;
        DATA[0] = 'hAA;
        DATA[1] = 'h55;
        DATA[2] = 'hCC;
        DATA[3] = 'h89;
        reset = 0;
        clk = 1;
        Tx_EN = 0;
        Rx_EN = 0;
        #10 reset = 1;
        #30 reset = 0;
        Rx_EN = 1;
        Tx_EN = 1;
        #400000
        Tx_EN = 0;
        Rx_EN = 0;
    end

    always@(*) begin
    n_Tx_DATA = Tx_DATA;
    Tx_WR = 0;
        case(state)
            IDLE:begin
                if(Tx_EN && Rx_EN) begin 
                    next_state = INIT;
                    ni = i;
                end else begin
                    ni = i;
                    next_state = state;
                end
            end
            INIT:begin
                if(i == 4) next_state = FINISHED;

                else if(Tx_BUSY == 0) begin
                    n_Tx_DATA = DATA[i];
                    #15
                    Tx_WR = 1;
                    #10
                    Tx_WR = 0;
                    next_state = TRANFER;
                    ni = i;
                end else begin
                    next_state = state;
                    ni = i;
                end
            end
            TRANFER:begin
                if(Rx_VALID == 1) begin
                    $display("DATA %h", Rx_DATA);
                    next_state = INIT;
                    ni = i + 1;
                end else if(Rx_FERROR || Rx_PERROR) begin
                    $display("ERROR");
                    next_state = FINISHED;
                    ni = i + 1;
                end else begin
                    next_state = state;
                    ni = i;
                end
            end
            FINISHED:begin
                next_state = state;
                ni = i;
            end
            default:begin
                next_state = FINISHED;
                ni = i;
            end
        endcase
    end

endmodule