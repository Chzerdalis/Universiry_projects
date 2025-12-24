`timescale 1ns/1ps

module v_pixel_count(reset, clk, Vpixel, count, H_counter);
    input reset, clk;
    input [2:0] count;
    output reg [6:0] Vpixel;
    input [11:0] H_counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            Vpixel <= 7'b0000000;
        end else begin 
            if(count == 4 && H_counter == 3199) begin
                if(Vpixel == 95) Vpixel <= 0;
                else Vpixel <= Vpixel + 1'b1;
            end else begin
                Vpixel <= Vpixel;
            end
        end
    end
endmodule