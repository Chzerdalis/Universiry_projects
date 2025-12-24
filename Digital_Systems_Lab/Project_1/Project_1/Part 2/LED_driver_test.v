`timescale 1ns/1ps

module LED_driver_test();
    reg reset, clk;
    wire an0, an1, an2, an3;
    wire a, b, c, d, e, f, g, dp;

    FourDigitLEDdriver test(reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
        #10000 $finish;
    end

    always #5 clk =~ clk;
endmodule