`timescale 1ns / 1ps

module D_Flip_Flop(clk, D, Q, reset);
    input clk, D, reset;
    output reg Q;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            Q <= 0;
        end else begin
            Q <= D;
        end
    end
endmodule