`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UTH
// 
// Design Name: 
// Module Name:   fpadd_single 
// Project Name: 32 bit Floating Point Unit - Add
// Target Devices: Zedboard
// Tool versions: Vivado 2020.2
//
// Description: 32-bit FP adder with a single pipeline stage (everything happens in one cycle)
//  The module does not check the input for subnormal and NaN numbers, 
//  and assumes that the two inputs are normal FP32 numbers with 0<exp<255.
//  We also assume that the output does not overflow or undeflow, so there is no need to check for these conditions.
//  An FP32 number has 1 sign bit, 8 exponent bits(biased by 127), and 23 mantissa bits.
//////////////////////////////////////////////////////////////////////////////////
module fpadd_single (input clk,
                     input reset,
                     input [31:0]reg_A, 
                     input [31:0]reg_B,  
		     output reg[31:0] out);

	reg[31:0] A, B;
	reg[31:0] result;

	reg[31:0] bigger, smaller;
	reg[7:0] diffexp, final_exponent;
	reg[23:0] shifted_mantissa, mantissa_sum, final_mantissa;
	reg carry;
	reg[4:0] shift_value;

	wire[7:0] exponent_bigger = bigger[30:23];
	wire[7:0] exponent_smaller = smaller[30:23];
	wire[23:0] mantissa_bigger = {1'b1, bigger[22:0]};
	wire[23:0] mantissa_smaller = {1'b1, smaller[22:0]};
	wire bigger_sign = bigger[31];
	wire smaller_sign = smaller[31];

	// Register the two inputs, and use A and B in the combinational logic. 
	always @ (posedge clk or posedge reset) begin
		if (reset == 1'b1) begin
			out <= 32'b0;
			A <= 32'b0;
			B <= 32'b0;
		end else begin
			A <= reg_A;
			B <= reg_B;
			out <= result;
		end
	end
		
	//Combinational Logic to (a) compare and adjust the exponents, 
	//                       (b) shift appropriately the mantissa if necessary, 
	//                       (c) add the two mantissas, and
	//                       (d) perform post-normalization. 
	//                           Make sure to check explicitly for zero output. 
	always@ (*) begin
		//find bigger exponent or bigger mantissa
		if(A[30:0] > B[30:0]) begin
			bigger = A;
			smaller = B;
		end else begin
			bigger = B;
			smaller = A;
		end
		
		//Find the difference of the exponents
		diffexp = exponent_bigger - exponent_smaller;
		
		if(|diffexp[7:5] == 1 || |exponent_smaller == 0) begin
			shifted_mantissa = 0; //if diff > 24 then the mantissa goes automatically to zero
		end else begin
			shifted_mantissa = (mantissa_smaller >> diffexp[4:0]); //Else we shift with the appropriate amount
		end

		//adding the two mantissas, based on their sign
		{carry,mantissa_sum} = (bigger_sign ~^ smaller_sign) ? mantissa_bigger + shifted_mantissa : mantissa_bigger - shifted_mantissa;
		final_exponent = exponent_bigger;

		//Post normalization
		if(carry) begin	//If the addition has a carry then we just need to shift by 1, and add 1 to the exponent
			final_mantissa = mantissa_sum >> 1;
			if(final_exponent != 8'h00) begin //if the exponent is 0 we dont add as that means that the value is zero
				final_exponent = final_exponent + 1;
			end else begin
				final_exponent = 8'h00;
			end
		end else if(|mantissa_sum != 1) begin //If mantissa is zero, after we know that there is no carry, then the number is zero
			final_exponent = 0;
			final_mantissa = 0;
		end else begin
			//Leading zero counter 
			casex (mantissa_sum)
				24'b1xxxxxxxxxxxxxxxxxxxxxxx: shift_value = 5'd0;
				24'b01xxxxxxxxxxxxxxxxxxxxxx: shift_value = 5'd1;
				24'b001xxxxxxxxxxxxxxxxxxxxx: shift_value = 5'd2;
				24'b0001xxxxxxxxxxxxxxxxxxxx: shift_value = 5'd3;
				24'b00001xxxxxxxxxxxxxxxxxxx: shift_value = 5'd4;
				24'b000001xxxxxxxxxxxxxxxxxx: shift_value = 5'd5;
				24'b0000001xxxxxxxxxxxxxxxxx: shift_value = 5'd6;
				24'b00000001xxxxxxxxxxxxxxxx: shift_value = 5'd7;
				24'b000000001xxxxxxxxxxxxxxx: shift_value = 5'd8;
				24'b0000000001xxxxxxxxxxxxxx: shift_value = 5'd9;
				24'b00000000001xxxxxxxxxxxxx: shift_value = 5'd10;
				24'b000000000001xxxxxxxxxxxx: shift_value = 5'd11;
				24'b0000000000001xxxxxxxxxxx: shift_value = 5'd12;
				24'b00000000000001xxxxxxxxxx: shift_value = 5'd13;
				24'b000000000000001xxxxxxxxx: shift_value = 5'd14;
				24'b0000000000000001xxxxxxxx: shift_value = 5'd15;
				24'b00000000000000001xxxxxxx: shift_value = 5'd16;
				24'b000000000000000001xxxxxx: shift_value = 5'd17;
				24'b0000000000000000001xxxxx: shift_value = 5'd18;
				24'b00000000000000000001xxxx: shift_value = 5'd19;
				24'b000000000000000000001xxx: shift_value = 5'd20;
				24'b0000000000000000000001xx: shift_value = 5'd21;
				24'b00000000000000000000001x: shift_value = 5'd22;
				24'b000000000000000000000001: shift_value = 5'd23;
				default: shift_value = 5'd24;
			endcase
			final_mantissa = mantissa_sum << shift_value;
			final_exponent = (shift_value <= final_exponent) ? (final_exponent - shift_value) : 8'b0;
		end

		result = {bigger_sign, final_exponent, final_mantissa[22:0]};
	end
endmodule
