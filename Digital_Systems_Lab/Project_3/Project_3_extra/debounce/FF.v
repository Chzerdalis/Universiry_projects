`timescale 1ns / 1ps

module D_Flip_Flop(clk, D, Q);
    input clk, D;
    output reg Q;

    always@(posedge clk) begin
            Q <= D;
    end
endmodule