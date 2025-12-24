`timescale 1ns/1ps

module test();
    reg clk, reset;
    wire Hsync, Vsync;
    wire VGA_BLUE, VGA_GREEN, VGA_RED;

    vga_optional BB(reset, clk, Hsync ,Vsync, VGA_RED, VGA_GREEN, VGA_BLUE);

    initial begin
        clk = 0;
        reset = 1;
        #1000
        reset = 0;
    end

    always #5 clk = ~clk;

endmodule