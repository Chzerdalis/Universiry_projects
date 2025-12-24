`timescale 1ns / 1ps

module Four_bit_counter(clk, reset, counter);
    input clk, reset;
    output reg [3:0] counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            counter <= 4'b0000;
        end else begin
            counter <= counter + 'b1;
        end
    end
endmodule