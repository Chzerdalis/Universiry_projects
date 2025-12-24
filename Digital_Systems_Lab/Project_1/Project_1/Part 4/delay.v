`timescale 1ns / 1ps

/*This modules counts up to 2^23 which with the current slow_clock speed takes 1,6777214 seconds 
and every time it does it enables the message to spin*/

module delay(clk, reset, time_counter);
    input clk, reset;
    output reg [22:0] time_counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            time_counter <= 0;
        end else begin
            time_counter <= time_counter + 1;
        end
    end
endmodule