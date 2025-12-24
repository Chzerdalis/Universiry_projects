`timescale 1ns/1ps
//Counts the position in the memory where the appropriate Hpixel is
module H_pixel_count(reset, clk, Hpixel, count);
    input reset, clk;
    input [4:0] count;
    output reg [6:0] Hpixel;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            Hpixel <= 7'b0000000;
        end else begin 
            if(count == 19) begin
                Hpixel <= Hpixel + 1'b1;
            end else begin
                Hpixel <= Hpixel;
            end
        end
    end
endmodule