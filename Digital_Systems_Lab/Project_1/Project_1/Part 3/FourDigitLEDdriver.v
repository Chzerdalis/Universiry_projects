`timescale 1ns / 1ps

/*This module drives the anodes and the signals of the 7_seg_disp and divides the clock (slows it down),
and it drives the button that circles the message*/

module FourDigitLEDdriver(reset, button, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
    input clk, reset, button;
    output an3, an2, an1, an0;
    output a, b, c, d, e, f, g, dp;
    wire [3:0] counter_1, counter_2;
    wire [3:0] char, c0, c1, c2, c3;
    wire clk_new;
    wire button_out, button_synced, change;
    wire [63:0] message;
    
    //Divides clock
    Clock_div Clock_div(.clk(clk), .clk_new(clk_new));
    //Assigns dp (dot) to 1 thus deactivates it
    assign dp = 'b1;
    //initializes the reg memory of the message
    Message_init message_init(.clk(clk_new), .reset(reset), .message(message));
    //Syncs input signal to the clock
    sync_button sync(.sign_in(button), .clk(clk_new), .sign_sync(button_synced), .sig_change(change), .reset(reset));
    //Debounces it and enables it for only one period
    debounce_2 debounce(.sig_in(button_synced), .sig_change(change), .db_sig(button_out), .clk(clk_new), .reset(reset));
    //The counter_2 changes only when button_out is activated
    Four_bit_counter_button counter_button(.clk(clk_new), .reset(reset), .counter(counter_2), .button(button_out));
    //counter that controls when the anodes light up
    Four_bit_counter counter_anodes(.clk(clk_new), .reset(reset), .counter(counter_1));
    //Scrolls the text every time the counter_2 is raised
    Text_scroll Text_scroll(.counter(counter_2), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .message(message));
    //State of anodes depending on the count
    Anode_driver_2 anodes(.counter(counter_1), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .an0(an0), .an1(an1), .an2(an2), .an3(an3), .char_out(char));
    //decodes the character to the right signals
    LEDdecoder led_dec(.char(char), .LED({a, b, c, d, e, f, g}));
    
endmodule