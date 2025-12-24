//This is the complete Vram module
module vram(reset, clk, address, red, green, blue);
   input clk, reset;
   input [13:0] address;
   output red, green, blue;

   vram_red v_red(reset, clk, address, red);
   vram_blue v_blue(reset, clk, address, blue);
   vram_green v_green(reset, clk, address, green);

endmodule