`timescale 1ns/1ps
//module that manages the sampling time
module baud_controller(clk, reset, baud_select, sample_ENABLE, enable);
    input reset, clk, enable;
    input [2:0] baud_select;
    output sample_ENABLE;  
    wire [15:0] counter_max, counter_val;
    
    //module that gives us the the right num of cycles to wait
    baud_rate_select select_timer(.baud_select(baud_select), .counter_max(counter_max));
    //module that creates the delay by counting every time the clock changes 
    clock_counter counter(.clk(clk), .reset(reset), .counter_max(counter_max), .counter_val(counter_val), .enable(enable));
    //if the counter is equal to the cycles that we have to wait that means that sample_enable should activate 
    assign sample_ENABLE = (counter_val == counter_max);
endmodule