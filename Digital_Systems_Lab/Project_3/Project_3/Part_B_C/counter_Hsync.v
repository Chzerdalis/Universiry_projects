`timescale 1ns/1ps
//This counter counts the clock cycles that respresent one Linescan or a duration of an Hsync signal
module counter_Hsync(reset, clk, H_counter);
    input clk, reset;
    output reg [11:0] H_counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            H_counter <= 0;
        end else begin
            if(H_counter == 3199) begin
                H_counter <= 0;
            end else begin
                H_counter <= H_counter + 1;
            end
        end
    end
endmodule