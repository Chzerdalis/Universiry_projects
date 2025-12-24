`timescale 1ns/1ps
//This module counts the Rx_sample_enables so that we can synchronize
//the receiver with the transmiter
module receive_timing(clk, reset, count_ENABLE, sample_ENABLE, receive_counter);
    input clk, reset, count_ENABLE, sample_ENABLE;
    output reg [7:0] receive_counter;

    always @(posedge clk or posedge reset) begin
        if(count_ENABLE) begin //starts when the state machine starts
            if(reset) begin
                receive_counter <= 0;
            end else begin
                if(sample_ENABLE == 1'b1) begin
                    receive_counter <= receive_counter + 1'b1;
                end else begin
                    receive_counter <= receive_counter;
                end
            end
        end else begin
            receive_counter <= 0;
        end
    end
endmodule