`timescale 1ns/1ps

module receive_tb();
    reg clk, reset, Tx_WR;
    wire Tx_EN, Rx_EN;
    wire [2:0] baud_select_1, baud_select_2;
    wire [7:0] Tx_DATA;
    wire [7:0] Rx_DATA;
    wire [7:0] Rx_DATA_p;
    wire [7:0] Rx_DATA_f;
    wire bit_data; 
    wire Tx_BUSY, Rx_FERROR, Rx_PERROR, Rx_VALID;
    wire Rx_FERROR_p, Rx_PERROR_p, Rx_VALID_p;
    wire Rx_FERROR_f, Rx_PERROR_f, Rx_VALID_f;

    uart_transmitter uart_tr(reset, clk, Tx_DATA, baud_select_1, Tx_WR, Tx_EN, bit_data, Tx_BUSY);

    uart_receiver uart_re(reset, clk, Rx_DATA, baud_select_1, Rx_EN, bit_data, Rx_FERROR, Rx_PERROR, Rx_VALID);

    uart_receiver_perror uart_receiver_perror(reset, clk, Rx_DATA_p, baud_select_1, Rx_EN, bit_data, Rx_FERROR_p, Rx_PERROR_p, Rx_VALID_p);

    uart_receiver uart_re_ferror(reset, clk, Rx_DATA_f, baud_select_2, Rx_EN, bit_data, Rx_FERROR_f, Rx_PERROR_f, Rx_VALID_f);

    assign Tx_EN = 1'b1;
    assign Rx_EN = 1'b1;
    assign baud_select_1 = 3'b111;
    assign baud_select_2 = 3'b110;
    assign Tx_DATA = 8'b11111111;
    
    initial begin
        reset = 0;
        Tx_WR = 0;
        clk = 1;
        #20 reset = 1;
        #20 reset = 0;
        #10005 Tx_WR = 1;
        #10 Tx_WR = 0;
        #96676 Tx_WR = 1;
        #10 Tx_WR = 0;

        #200000 $finish;
    end

    always #5 clk =~ clk;
endmodule