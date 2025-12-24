`timescale 1ns / 1ps

/*This module drives the anodes and the signals of the 7_seg_disp, divides the clock (slows it down),
and cirles the message every 1.67 seconds*/

module Top_module_4(reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
    input clk, reset;
    output an3, an2, an1, an0;
    output a, b, c, d, e, f, g, dp;
    wire [3:0] counter_1, counter_2;
    wire [3:0] char, c0, c1, c2, c3;
    wire clk_new;
    wire [63:0] message;
    wire [22:0] time_counter;
    
    //divides clock
    Clock_div Clock_div(.clk(clk), .clk_new(clk_new));
    //assigns the dot in the dispay to 1 so it is inactive
    assign dp = 'b1;
    //initializes the reg memory of the message
    Message_init message_init(.clk(clk_new), .reset(reset), .message(message));
    //Has the counter that takes 1,67 secs to overflow
    delay delay(.clk(clk_new), .reset(reset), .time_counter(time_counter));
    //Counts how many times the previous counter overflows and the count corresponds to the state of the message 
    Four_bit_time_counter Text_scroll_counter(.clk(clk_new), .reset(reset), .counter(counter_2), .time_counter(time_counter));
    //counter that controls when the anodes light up
    Four_bit_counter counter_anodes(.clk(clk_new), .reset(reset), .counter(counter_1));
    //State of message depending on the count
    Text_scroll Text_scroll(.counter(counter_2), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .message(message));
    //State of anodes depending on the count
    Anode_driver_2 anodes(.counter(counter_1), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .an0(an0), .an1(an1), .an2(an2), .an3(an3), .char_out(char));
    //decodes the character to the right signals
    LEDdecoder led_dec(.char(char), .LED({a, b, c, d, e, f, g}));
    
endmodule