`timescale 1ns / 1ps
//This module takes the change variable from the sychonization module and initiazes the state of the counter

module debounce_part_1(clk, reset, sig_change, state, count_finished);
    input clk, reset, sig_change, count_finished;
    output reg state;

    always@(posedge clk or posedge reset) begin
        if(reset || count_finished) begin
            state <= 0;
        end else begin
            if(sig_change == 1'b1 && state == 0) begin
                state <= 1'b1;
            end else begin
                state <= state;
            end 
        end
    end
endmodule