`include "constants.h"
`timescale 1ns/1ps

// Small ALU. Inputs: inA, inB. Output: out. 
// Operations: bitwise and (op = 0)
//             bitwise or  (op = 1)
//             addition (op = 2)
//             subtraction (op = 6)
//             slt  (op = 7)
//             nor (op = 12)
module ALU #(parameter N = 32) (out, zero, inA, inB, op, sllhelp);
  output [N-1:0] out;
  output zero;
  input  [N-1:0] inA, inB;
  input  [3:0] op;
  input [4:0] sllhelp;

  assign out = 
			(op == 4'b0000) ? inA & inB :
			(op == 4'b0001) ? inA | inB :
			(op == 4'b0010) ? inA + inB : 
			(op == 4'b0110) ? inA - inB : 
			(op == 4'b0111) ? ((inA < inB)?1:0) : 
			(op == 4'b1100) ? ~(inA | inB) :
            (op == 4'b0011) ? inB << sllhelp :
            (op == 4'b0100) ? inB << inA :
			'bx;

  assign zero = (out == 0);
endmodule


// Memory (active 1024 words, from 10 address lsbs).
// Read : disable wen, enable ren, address addr, data dout
// Write: enable wen, disable ren, address addr, data din.
module Memory (clock, reset, ren, wen, addr, din, dout);
    input clock, reset;
    input ren, wen;
    input  [31:0] addr, din;
    output [31:0] dout;

    reg [31:0] data[4095:0];
    wire [31:0] dout;

    /*always @(ren or wen)   // It does not correspond to hardware. Just for error detection
        if (ren & wen)
        $display ("\nMemory ERROR (time %0d): ren and wen both active!\n", $time);

    always @(posedge ren or posedge wen) begin // It does not correspond to hardware. Just for error detection
        if (addr[31:14] != 0)
        $display("Memory WARNING (time %0d): address msbs are not zero\n", $time);
    end*/ 

    assign dout = ((wen==1'b0) && (ren==1'b1) && (reset==1'b1)) ? data[addr[13:0]>>2] : 32'bx;  
    
    always @(negedge clock)
    begin
        if ((wen == 1'b1) && (ren==1'b0) && (reset==1'b1))
            data[addr[13:0]>>2] = din;
    end

endmodule


// Register File. Read ports: address raA, data rdA
//                            address raB, data rdB
//                Write port: address wa, data wd, enable wen.
module RegFile (clock, reset, raA, raB, wa, wen, wd, rdA, rdB);
    input [4:0] raA, raB, wa;
    input clock, reset, wen;
    input [31:0] wd;
    output [31:0] rdA, rdB;
    integer i;
    
    //register files are signed in order to get printed correctly
    reg signed [31:0] data [31:0];

    //rdA and rdB always hold the register value shown by raA and raB
    assign  rdA = data[raA];
    assign  rdB = data[raB]; 

    //Reset the regfiles if reset is 0 and write data if wen is 1
    always @(negedge clock, negedge reset)
    begin
        if(reset == 0) begin
            for(i = 0; i < 32; i = i + 1) 
                data[i] = 32'b0;
        end
        else if(wen == 1) 
        begin
            data[wa] <= wd; 
        end
    end

endmodule

