module vram(reset, clk, address, red, green, blue, frame_count);
   input clk, reset;
   input [13:0] address;
   input [1:0] frame_count;
   wire red1, green1, blue1, red2, green2, blue2, red3, green3, blue3, red4, green4, blue4;
   output reg red, green, blue;

   always@(posedge clk or posedge reset) begin
      if(reset || address == 14'b11111111111111) begin //This value 14'b11111111111111v is not used ion our design
         red <= 0;
         blue <= 0;
         green <= 0;
      end else begin
         case(frame_count)
            2'b00:begin
               red <= red1;
               green <= green1;
               blue <= blue1;
            end
            2'b01:begin
               red <= red2;
               green <= green2;
               blue <= blue2;
            end
            2'b10:begin
               red <= red3;
               green <= green3;
               blue <= blue3;
            end
            2'b11:begin
               red <= red4;
               green <= green4;
               blue <= blue4;
            end
            default begin
               red <= red1;
               green <= green1;
               blue <= blue1;
            end
         endcase
      end
   end


   vram_red v_red(reset, clk, address, red1);
   vram_blue v_blue(reset, clk, address, blue1);
   vram_green v_green(reset, clk, address, green1);

   vram_red_1 v_red1(reset, clk, address, red2);
   vram_blue_1 v_blue1(reset, clk, address, blue2);
   vram_green_1 v_green1(reset, clk, address, green2);

   vram_red_2 v_red2(reset, clk, address, red3);
   vram_blue_2 v_blue2(reset, clk, address, blue3);
   vram_green_2 v_green2(reset, clk, address, green3);

   vram_red_3 v_red3(reset, clk, address, red4);
   vram_blue_3 v_blue3(reset, clk, address, blue4);
   vram_green_3 v_green3(reset, clk, address, green4);
   
endmodule