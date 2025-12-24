`timescale 1ns / 1ps

module Part_3_tb(); 
    reg reset, clk, button;
    wire an0, an1, an2, an3;
    wire a, b, c, d, e, f, g, dp;
    integer i;

    Top_module_3 test(reset, button, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);

    initial begin
        clk = 0;
        reset = 1;
        button = 0;
        #20 reset = 0;
        button = 0;

        #2000
        for(i = 0; i < 16; i = i + 1) begin
            #30000 button = 1;
            #300 button = 0;
            #300 button = 1;
            #300 button = 0;
            #300 button = 1;
            #300 button = 0;
            #300 button = 1;
            #30000 button = 0;
            #300 button = 1;
            #300 button = 0;
            #300 button = 1;
            #300 button = 0;
            #300 button = 1;
            #300 button = 0;
        end
        
        #16000 $finish;
    end

    always #5 clk =~ clk;
endmodule