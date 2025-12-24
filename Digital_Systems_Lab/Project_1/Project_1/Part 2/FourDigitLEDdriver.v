`timescale 1ns / 1ps

/*This module drives the anodes and the signals of the 7_seg_disp and divides the clock (slows it down)*/

module FourDigitLEDdriver(reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
    input clk, reset;
    output an3, an2, an1, an0;
    output a, b, c, d, e, f, g, dp;
    wire [3:0] counter;
    wire [3:0] char;
    wire clk_new;
    //divides the clock to the wanted speed
    Clock_div Clock_div(.clk(clk), .clk_new(clk_new));
    //disables point in the display
    assign dp = 'b1;
    //Dtrives the anodes that illuminate the digits on the screen
    Anode_driver anodes(.counter(counter), .an0(an0), .an1(an1), .an2(an2), .an3(an3), .char(char));
    //Counter that drives the state of the Anode driver
    Four_bit_counter count(.clk(clk_new), .reset(reset), .counter(counter));
    //Decodes the 4 bit of the characters to the 7 signals for the display
    LEDdecoder led_dec(.char(char), .LED({a, b, c, d, e, f, g}));
    
endmodule