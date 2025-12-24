`timescale 1ns/1ps

module line_period_counter(reset, clk, V_pixel_disp, count, H_counter);
    input reset, clk, V_pixel_disp;
    output reg [2:0] count;
    input [11:0] H_counter;


    always@(posedge clk or posedge reset) begin
        if(reset) begin
            count <= 0;
        end else begin 
            if(V_pixel_disp == 0 || (H_counter == 3199 && count == 4)) begin
                count <= 0;
            end else if(H_counter == 3199) begin
                count <= count + 1;
            end else begin
                count <= count;
            end
        end
    end

endmodule