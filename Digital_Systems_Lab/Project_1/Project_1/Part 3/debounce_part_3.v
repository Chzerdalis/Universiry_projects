`timescale 1ns / 1ps
//This module checks when the counter completes and then sends a 'reset' signal to the part 1-2

module debounce_part_3(clk, reset, time_counter, signal_in, count_finished, db_signal);
    input clk, reset, signal_in;
    input [5:0] time_counter;
    output reg count_finished, db_signal;

    always@(posedge clk or posedge reset) begin
        if(reset || count_finished) begin
            db_signal <= 0;
            count_finished <= 0;
        end else begin
            if(time_counter == 6'b111111) begin
                db_signal <= signal_in;
                count_finished <= 1;
            end else begin
                db_signal <= 0;
            end
        end
    end
endmodule