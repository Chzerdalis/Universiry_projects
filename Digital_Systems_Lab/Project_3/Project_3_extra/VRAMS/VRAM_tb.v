`timescale 1ns/1ps

module vram_tb();
    reg clk, reset;
    reg [13:0] address;
    wire red, green, blue;

    vram test_ram(reset, clk, address, red, green, blue);

    initial begin
        reset = 0;
        clk = 1;
        #20
        reset = 1;
        #20
        reset = 0;
        #70 address = 14'b00000000000001;
        #60 address = 14'b00000000001000;
        #53 address = 14'b00000010000000;
        #50 address = 14'b00000100000000;
        #53 address = 14'b00010001000100;
        #50 address = 14'b10001111111111;
        #53 address = 14'b10010000000000;
        #50 address = 14'b10010000000001;
        #50 address = 14'b10010000000010;
        #50 address = 14'b10111100000000;
        #50 address = 14'b01000000000000;
        #50 address = 14'b10010000000100;
        #50 address = 14'b10010000001000;
        #50 address = 14'b10111100000000;
        #50 address = 14'b10111100000000 + 'b11;
        #50 address = 14'b10111100000000 + 'b11;
    end

    always #5 clk = ~clk;
endmodule