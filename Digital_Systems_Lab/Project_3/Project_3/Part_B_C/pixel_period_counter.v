`timescale 1ns/1ps
//Count 20 clock cycles because for 5 pixels we need 5*4 cycles as one pixel 
//has to de shown for 4 clocl cycles
module pixel_period_counter(reset, clk, H_pixel_disp, count);
    input reset, clk, H_pixel_disp;
    output reg [4:0] count;


    always@(posedge clk or posedge reset) begin
        if(reset) begin
            count <= 0;
        end else begin  
            if(H_pixel_disp == 0 || count == 19) begin
                count <= 0;
            end else begin
                count <= count + 1'b1;
            end
        end
    end
endmodule