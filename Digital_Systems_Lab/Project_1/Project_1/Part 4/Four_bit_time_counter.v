`timescale 1ns / 1ps

/*this is a counter that counts only when the time_counter overflows is pressed*/

module Four_bit_time_counter(clk, reset, counter, time_counter);
    input clk, reset;
    input [22:0] time_counter;
    output reg [3:0] counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            counter <= 4'b0000;
        end else begin
            if(time_counter == 23'h7FFFFF) 
                counter <= counter + 'b1;
            else
                counter <= counter;
        end
    end
endmodule