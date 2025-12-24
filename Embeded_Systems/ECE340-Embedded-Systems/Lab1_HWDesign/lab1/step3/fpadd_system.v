`timescale 1ns / 1ps
/*
 -----------------------------------------------------------------------------
 -- File           : fpadd_system.v
 -----------------------------------------------------------------------------
 */ 
 module fpadd_system (input clk,
                      input rst,
                      output [7:0] leds, 
                      output an0, output a0, output b0, output c0, output d0, output e0, output f0, output g0,
                      output an1, output a1, output b1, output c1, output d1, output e1, output f1, output g1);

   wire [31:0] fp_out;

   // Try this addition of FP numbers 
   // 6b64b235 + 6ac49214 = 6ba37d9f 

   fpadd_pipeline ADDER(.clk(clk), .reset(rst), .reg_A(32'h6b64b235), .reg_B(32'h6ac49214), .out(fp_out));

   assign leds = fp_out[7:0];

   // Instantiate the 7segment display output 0 
   SevenSegDisplay SegDISPLAY_0(.clk(clk), .reset(rst), .DataIn(fp_out[31:24]), .an(an0), .signals({a0, b0, c0, d0, e0, f0, g0}));

   // Instantiate the 7segment display output 1
   SevenSegDisplay SegDISPLAY_1(.clk(clk), .reset(rst), .DataIn(fp_out[23:16]), .an(an1), .signals({a1, b1, c1, d1, e1, f1, g1}));
endmodule
