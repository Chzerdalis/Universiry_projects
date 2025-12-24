`timescale 1ns/1ps

module counter_Vsync(reset, clk, H_counter, V_counter);
    input clk, reset;
    output reg [9:0] V_counter;
    input [11:0] H_counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            V_counter <= 0;
        end else if(H_counter == 3199) begin
            if(V_counter == 520) V_counter <= 0;
            else V_counter <= V_counter + 1;           
        end else begin
            V_counter <= V_counter;
        end
    end
endmodule