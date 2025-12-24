`timescale 1ns / 1ps
/*
 -----------------------------------------------------------------------------
 -- File           : fpadd_system.v
 -----------------------------------------------------------------------------
 */ 
 module fpadd_system (input clk,
                      input rst, 
                      input noisy_level, 
                      output [7:0] leds, 
                      output an0, output a0, output b0, output c0, output d0, output e0, output f0, output g0,
                      output an1, output a1, output b1, output c1, output d1, output e1, output f1, output g1);

   wire [31:0] fp_out;
   wire [31:0] A, B;
   wire reset_db, noisy_db;

   //Debounce the reset button
   Debounce_L2P DB_reset(.clk(clk), .signal_in(rst), .signal_out(reset_db));
   //Debounce the button that changes the memory output
   Debounce_L2P DB_noisy_signal(.clk(clk), .signal_in(noisy_level), .signal_out(noisy_db));
   //Memory instantiation
   Data_mem MEM(.clk(clk), .reset(reset_db), .button(noisy_db), .A(A), .B(B));
   //FP ADDER
   fpadd_pipeline ADDER(.clk(clk), .reset(reset_db), .reg_A(A), .reg_B(B), .out(fp_out));
   //led outputs     
   assign leds = fp_out[7:0];

   // Instantiate the 7segment display output 0 
   SevenSegDisplay SegDISPLAY_0(.clk(clk), .reset(rst), .DataIn(fp_out[31:24]), .an(an0), .signals({a0, b0, c0, d0, e0, f0, g0}));

   // Instantiate the 7segment display output 1
   SevenSegDisplay SegDISPLAY_1(.clk(clk), .reset(rst), .DataIn(fp_out[23:16]), .an(an1), .signals({a1, b1, c1, d1, e1, f1, g1}));
endmodule
