`timescale 1ns / 1ps
//This module increases the counter when state is 1(means that counter should be active)

module debounce_part_2(clk, reset, state, time_counter, count_finished);
    input clk, reset, state, count_finished;
    output reg [5:0] time_counter;

    always@(posedge clk or posedge reset) begin
        if(reset || count_finished) begin
            time_counter <= 0;
        end else begin
            if(state == 1) begin
                time_counter <= time_counter + 1'b1;
            end else begin
                time_counter <= time_counter;
            end
        end
    end
endmodule