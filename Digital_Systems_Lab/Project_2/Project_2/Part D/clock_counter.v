`timescale 1ns/1ps
//This module counts the clock cycles until they have
//reached the value that was selected in baud rate sel
//Its basically the module that creates the wanted delay
module clock_counter(clk, reset, counter_max, counter_val, enable);
    input [15:0] counter_max;
    input clk, reset, enable;
    output reg [15:0] counter_val;

    always @(posedge clk or posedge reset) begin
        if(enable) begin //enable so that it only works when the top module is enabled
            if(reset) begin
                counter_val <= 0;
            end else begin 
                if(counter_val == counter_max) begin
                    counter_val <= 0; //value goes to zero when we have reached our target number
                end else begin
                    counter_val <= counter_val + 1'b1;
                end
            end
        end else begin
            counter_val <= 0;
        end
    end
endmodule