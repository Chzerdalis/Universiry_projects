// This file contains library modules to be used in your design. 
`include "constants.h"
`timescale 1ns/1ps

// Small ALU. 
//     Inputs: inA, inB, op. 
//     Output: out, zero
// Operations: bitwise and (op = 0)
//             bitwise or  (op = 1)
//             addition (op = 2)
//             subtraction (op = 6)
//             slt  (op = 7)
//             nor (op = 12)
module ALU (out, zero, inA, inB, op);

    output reg[31:0] out;
    output zero;
    input signed [31:0] inA, inB;
    input [3:0] op;

    always @(inA, inB, op)
    begin
        case(op)
            0: out = inA & inB;
            1: out = inA | inB;
            2: out = inA + inB;
            6: out = inA - inB;
            7: out = (inA < inB) ? 32'b1 : 32'b0;
            12: out = ~(inA | inB);
            default: out = 'bx; 
        endcase
    end
    assign zero = (out == 0);
endmodule  

/* Memory (active 1024 words, from 10 address ).
module Instruction_Memory (PCin, dout);
    input  [31:0] PCin;
    output [31:0] dout;
    reg [31:0] data[4095:0];

    assign dout = data[PCin<<2];

endmodule
*/

// Memory (active 1024 bytes, from 10 address ).
// Read : enable ren, address addr, data dout
// Write: enable wen, address addr, data din.
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


// Register File. Input ports: address raA, data rdA
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


// Module to control the data path. 
//                          Input: op, func of the inpstruction
//                          Output: all the control signals needed 
module control_unit (opcode, RegDst, EqBranch, NeqBranch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUcntrl);
    input [5:0] opcode;
    output reg RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, NeqBranch, EqBranch;
    output reg [1:0]ALUcntrl;

    always @(opcode) 
    begin
        case  (opcode)
            `R_FORMAT:
            begin
                NeqBranch = 1'b0;
                RegDst = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b1;
                EqBranch = 1'b0;
                ALUcntrl = 2'b10;
            end
            `LW:
            begin
                NeqBranch = 1'b0;
                RegWrite = 1'b1;
                RegDst = 1'b0;
                MemRead = 1'b1;
                MemToReg = 1'b1;
                EqBranch = 1'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ALUcntrl = 2'b00;
            end
            `SW:
            begin
                NeqBranch = 1'b0;
                RegWrite = 1'b0;
                RegDst = 1'bx;
                MemRead = 1'b0;
                MemToReg = 1'bx;
                EqBranch = 1'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ALUcntrl = 2'b00;
            end
            `BEQ:
            begin
                NeqBranch = 1'b0;
                RegWrite = 1'b0;
                RegDst = 1'b0;
                MemRead = 1'b0;
                MemToReg = 1'b0;
                EqBranch = 1'b1;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ALUcntrl = 2'b01;
            end
            `BNE:
            begin
                NeqBranch = 1'b1;
                RegWrite = 1'b0;
                RegDst = 1'b0;
                MemRead = 1'b0;
                MemToReg = 1'b0;
                EqBranch = 1'b0; 
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ALUcntrl = 2'b01;
            end
            `ADDI:
            begin
                NeqBranch = 1'b0;
                RegWrite = 1'b1;
                RegDst = 1'b0;
                MemRead = 1'b0;
                MemToReg = 1'b0;
                EqBranch = 1'b0; 
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ALUcntrl = 2'b00;
            end
            `NOP:
            begin
                NeqBranch = 1'b0;
                RegWrite = 1'b0;
                RegDst = 1'b0;
                MemRead = 1'b0;
                MemToReg = 1'b0;
                EqBranch = 1'b0; 
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ALUcntrl = 'bx;
            end
        endcase
    end
endmodule

module ALU_control(ALUcntrl, func, ALUOp);
    input [1:0]ALUcntrl;
    input [5:0] func;
    output reg [3:0] ALUOp;


    always @(*)
    begin
        case (ALUcntrl)
            2'b10: 
            begin
                case (func)
                    `AND : ALUOp = 4'b0000; 
                    `OR  : ALUOp = 4'b0001; 
                    `ADD : ALUOp  = 4'b0010; 
                    `SUB : ALUOp = 4'b0110; 
                    `SLT : ALUOp = 4'b0111; 
                    `NOR : ALUOp = 4'b1100; 
                    default: ALUOp = 4'b0000;       
                endcase 
            end   
            2'b00: 
                ALUOp  = 4'b0010; 
            2'b01: 
                ALUOp = 4'b0110; 
            default:
                ALUOp = 4'b0000;
        endcase
    end
endmodule
