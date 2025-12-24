`include "constants.h"
`timescale 1ns/1ps

/************** Main control in ID pipe stage  *************/
module control_main (opcode, RegDst, EqBranch, NeqBranch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUcntrl, Jump);
		input [5:0] opcode;
		output reg RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, NeqBranch, EqBranch, Jump;
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
								Jump = 1'b0;
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
								Jump = 1'b0;
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
								Jump = 1'b0;
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
								Jump = 1'b0;
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
								Jump = 1'b0;
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
								Jump = 1'b0;
						end
						`J:
						begin
								NeqBranch = 1'b0;
								RegWrite = 1'b0;
								RegDst = 1'b0;
								MemRead = 1'b0;
								MemToReg = 1'b0;
								EqBranch = 1'b0; 
								ALUSrc = 1'b0;
								MemWrite = 1'b0;
								ALUcntrl = 2'b00;
								Jump = 1'b1;
						end
						default/*nop*/:
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
								Jump = 1'b0;
						end
				endcase
		end
endmodule


/**************** Module for Bypass Detection in EX pipe stage goes here  *********/
// TO FILL IN: Module details 
module Forwarding_Unit (IDEX_instr_rs, IDEX_instr_rt, EXMEM_RegWrite, EXMEM_instr_rd, MEMWB_RegWrite, MEMWB_instr_rd, ForwardA, ForwardB);
    input [4:0]IDEX_instr_rs, IDEX_instr_rt, EXMEM_instr_rd, MEMWB_instr_rd;
    input EXMEM_RegWrite, MEMWB_RegWrite;
    output reg [1:0] ForwardA, ForwardB;

    always@ (*) begin
        ForwardA = 0;
        ForwardB = 0;

        if (MEMWB_RegWrite && MEMWB_instr_rd != 0 && MEMWB_instr_rd == IDEX_instr_rs && ((EXMEM_instr_rd != IDEX_instr_rs) || (EXMEM_RegWrite != 1)))
            ForwardA = 1;
        if (MEMWB_RegWrite && MEMWB_instr_rd != 0 && MEMWB_instr_rd == IDEX_instr_rt && ((EXMEM_instr_rd != IDEX_instr_rt) || (EXMEM_RegWrite != 1)))
            ForwardB = 1;
        if (EXMEM_RegWrite && EXMEM_instr_rd != 0 && EXMEM_instr_rd == IDEX_instr_rs)
            ForwardA = 2;
        if (EXMEM_RegWrite && EXMEM_instr_rd != 0 && EXMEM_instr_rd == IDEX_instr_rt)
            ForwardB = 2;
    end
endmodule          
											 

/**************** Module for Stall Detection in ID pipe stage goes here  *********/
// TO FILL IN: Module details 
module Hazard_Unit (IFID_instr_rs, IFID_instr_rt, IDEX_MemRead, IDEX_instr_rt, Bubble_IDEX, Bubble_IFID, Bubble_EXMEM, PC_Write, IFID_Write, PCsrc, Neq, Eq, zero, Jump, Jump_decide);
    input [4:0] IFID_instr_rs, IFID_instr_rt, IDEX_instr_rt;
    input IDEX_MemRead;
	input PCsrc, Neq, Eq, zero, Jump;
    output reg PC_Write, Bubble_IDEX, IFID_Write, Bubble_IFID, Bubble_EXMEM, Jump_decide;

    always @(*) begin
        if (IDEX_MemRead == 1 && (IDEX_instr_rt == IFID_instr_rs || IDEX_instr_rt == IFID_instr_rt))
        begin
            Bubble_IDEX = 1'b1;
            PC_Write = 1'b0;
            IFID_Write = 1'b0;
        end
        else begin
            Bubble_IDEX = 1'b0;
            PC_Write = 1'b1;
            IFID_Write = 1'b1;
        end
    end

	always @(*) begin
		if(PCsrc == 1'b1)
		begin
			Bubble_IDEX = 1'b1;
			Bubble_EXMEM = 1'b1;
		end else
		begin
			Bubble_IDEX = 1'b0;
			Bubble_EXMEM = 1'b0;
		end
	end

	always @(*) begin
		Jump_decide = 1'b0;
		if(((Jump == 1) && (PCsrc == 1'b0) && !((zero == 1'b1 && Eq == 1'b1) || (zero == 1'b0 && Neq == 1'b1))) || (PCsrc == 1'b1))
		begin
			Bubble_IFID = 1'b1;
		end else 
		begin
			Bubble_IFID = 1'b0;
		end
		if((Jump == 1) && (PCsrc == 1'b0) && !((zero == 1'b1 && Eq == 1'b1) || (zero == 1'b0 && Neq == 1'b1)))
			Jump_decide = 1'b1;
	end
endmodule
											 
/************** control for ALU control in EX pipe stage  *************/
module control_alu(ALUcntrl, func, ALUOp);
		input [1:0]ALUcntrl;
		input [5:0] func;
		output reg [3:0] ALUOp;


		always @(*)
		begin
				case (ALUcntrl)
						2'b10: 
						begin
								case (func)
										6'b100110: ALUOp = 4'b0101;//xor
										6'b000000: ALUOp = 4'b0011;//sll
										6'b000100: ALUOp = 4'b0100;//sllv
										6'b100000: ALUOp  = 4'b0010; // add
										6'b100010: ALUOp = 4'b0110; // sub
										6'b100100: ALUOp = 4'b0000; // and
										6'b100101: ALUOp = 4'b0001; // or
										6'b100111: ALUOp = 4'b1100; // nor
										6'b101010: ALUOp = 4'b0111; // slt
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
