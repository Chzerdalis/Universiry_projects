`timescale 1ns / 1ps

module Part_4_tb(); 
    reg reset, clk;
    wire an0, an1, an2, an3;
    wire a, b, c, d, e, f, g, dp;

    Top_module_4 test(reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
        
        #81000 $finish;
    end

    always #5 clk =~ clk;
endmodule