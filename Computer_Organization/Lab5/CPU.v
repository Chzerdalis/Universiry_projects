`include "lab4_library_input.v"

module CPU (clock, reset);
    input clock, reset;
    reg  [31:0] PC;
    wire [4:0] WriteAddress;
    wire [31:0] Instruction, NewPC, AluInA, AluInB, WriteData, ExtOffset, rdB, MemData, ALUout;
    wire [3:0] ALUOp;
    wire [1:0] ALUcntrl;
    wire RegDst, EqBranch, NeqBranch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, zero;

    //Instruction memory is the memory module with some constant values
    Memory cpu_IMem(1'b1, reset, 1'b1, 1'b0, PC, 0, Instruction);

    //Control Unit receives the opcode and creates the signals needed
    control_unit CONTROL(Instruction[31:26], RegDst, EqBranch, NeqBranch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUcntrl);
    
    //Multiplexer that chooses the correct register address to write
    assign WriteAddress = (RegDst) ? Instruction[15:11] : Instruction[20:16];

    //Regfile
    RegFile cpu_regs(clock, reset, Instruction[25:21], Instruction[20:16], WriteAddress, RegWrite , WriteData, AluInA, rdB);
    
    //Function that extends the bits of the offset given
    assign ExtOffset = {{16{Instruction[15]}}, Instruction[15:0]};
    
    //Multiplexer that chooses between register or extended offset data
    assign AluInB = (ALUSrc) ? ExtOffset : rdB;

    //Mini-module that receives a signal and creates the correct code for the ALU
    ALU_control ALU_CONTROL(ALUcntrl, Instruction[5:0], ALUOp);

    ALU ALU(ALUout, zero, AluInA, AluInB, ALUOp);
    
    //Multiplexer that chooses between memory data and ALU result
    assign WriteData = (MemToReg) ? MemData : ALUout;

    //Data Memory
    Memory DATA_MEMORY(clock, reset, MemRead, MemWrite, ALUout, rdB, MemData);
    
    //Function that increases PC counter and jumps if the right signals are given
    assign NewPC = (PC == -4) ? (0) : (((EqBranch == 1'b1 && zero == 1'b1) || (NeqBranch == 1'b1 && zero == 1'b0)) ? (PC + 4 + (ExtOffset<<2)) : (PC + 4));    
    
    always @(posedge clock , negedge reset) 
    begin
        if (reset == 1'b0)
            PC = -4;
        else
            PC <= NewPC;
    end
endmodule