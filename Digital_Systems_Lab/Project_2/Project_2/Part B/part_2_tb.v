`timescale 1ns/1ps

module trans_tb();
    reg clk, reset, Tx_WR;
    reg Tx_EN;
    wire [2:0] baud_select;
    wire [7:0] Tx_DATA;
    wire TxD, Tx_BUSY;

    uart_transmitter uart_tr(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);

    assign baud_select = 3'b111;
    assign Tx_DATA = 8'b10011010;
    
    initial begin
        Tx_EN = 0;
        reset = 0;
        Tx_WR = 0;
        clk = 1;
        #20 reset = 1;
        #20 reset = 0;
        #20 Tx_EN = 1;
        #10005 Tx_WR = 1;
        #10 Tx_WR = 0;
        #100000 Tx_WR = 1;
        #10 Tx_WR = 0;

        #200000 $finish;
    end

    always #5 clk =~ clk;
endmodule