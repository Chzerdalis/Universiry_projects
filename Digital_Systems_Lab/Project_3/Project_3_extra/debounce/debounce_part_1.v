`timescale 1ns / 1ps
//This module takes the change variable from the sychonization module and initiazes the state of the counter

module debounce_part_1(clk, sig_change, state, count_finished);
    input clk, sig_change, count_finished;
    output reg state;

    always@(posedge clk) begin
        if(count_finished) begin
            state <= 0;
        end else begin
            if(sig_change == 1'b1) begin
                state <= 1'b1;
            end else begin
                state <= state;
            end 
        end
    end
endmodule