`timescale 1ns/1ps
//Thios module controls the address given to the Vram if the Video is not on a black pixel is 
//displayed
module address_control(H_pixel_disp, V_pixel_disp, Hpixel, Vpixel, address);
    input H_pixel_disp, V_pixel_disp;
    input [6:0] Vpixel, Hpixel;
    output reg [13:0] address;

    always@(H_pixel_disp or V_pixel_disp or Vpixel or Hpixel) begin
        if(H_pixel_disp && V_pixel_disp) begin
            address = {Vpixel, Hpixel};
        end else begin
            address = 14'b10010011110110;
        end
    end
endmodule