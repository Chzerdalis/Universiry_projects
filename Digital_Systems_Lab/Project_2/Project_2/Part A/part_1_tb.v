`timescale 1ns/1ps

module baud_tb();
    reg clk, reset, enable;
    reg [2:0] baud_select;
    wire sample_ENABLE;

    baud_controller baud(clk, reset, baud_select, sample_ENABLE, enable);

    initial begin
        $monitor("TIME = %t || ENABLE = %b || %b" , $time, sample_ENABLE, baud_select);
        enable = 1;
        clk = 1;
        #20 reset = 1;
        #20 reset = 0;
        #5 baud_select = 0;
        #300000 
        #20 reset = 1;
        #20 reset = 0;
        baud_select = 1;
        #55000 
        #20 reset = 1;
        #20 reset = 0;
        baud_select = 2;
        #14000
        #20 reset = 1;
        #20 reset = 0; 
        baud_select = 3;
        #7000
        #20 reset = 1;
        #20 reset = 0; 
        baud_select = 4;
        #4000
        #20 reset = 1;
        #20 reset = 0; 
        baud_select = 5;
        #2000
        #20 reset = 1;
        #20 reset = 0; 
        baud_select = 6;
        #1100
        #20 reset = 1;
        #20 reset = 0; 
        baud_select = 7;
        #540 $finish;
    end

    always #5 clk =~ clk;
endmodule