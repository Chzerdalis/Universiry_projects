`include "library.v"
`include "control.v"
`timescale 1ns/1ps

module cpu (clock, reset);
    input clock, reset;
    reg  [31:0] PC;
    wire [4:0] RegWriteAddr;
    wire [31:0] instr, NewPC, ALUInB_1, ALUInB_2, ALUInA, wRegData, signExtend, rdB, rdA, DMemOut, ALUout, Jump_Dest;
    wire [3:0] ALUOp;
    wire RegDst, EqBranch, NeqBranch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, zero, Jump;
    wire [1:0] ForwardA, ForwardB, ALUcntrl;
    wire PC_Write, IFID_Write, NOP;
    reg  [31:0] IFID_instr, IFID_NewPC;
    reg  [31:0] IDEX_rdA, IDEX_rdB, IDEX_signExtend, IDEX_NewPC, IDEX_Jump_Dest;
    reg  [4:0]  IDEX_instr_rt, IDEX_instr_rs, IDEX_instr_rd;
    reg  [5:0]  IDEX_func;                            
    reg  IDEX_RegDst, IDEX_ALUSrc;
    reg  [1:0]  IDEX_ALUcntrl;
    reg  IDEX_EqBranch, IDEX_MemRead, IDEX_MemWrite, IDEX_NeqBranch, IDEX_Jump; 
    reg  IDEX_MemToReg, IDEX_RegWrite;
    reg  [4:0]  EXMEM_RegWriteAddr, EXMEM_instr_rd; 
    reg  [31:0] EXMEM_ALUOut, EXMEM_NewPC, EXMEM_Jump_Dest;
    reg  EXMEM_Zero;
    reg  [31:0] EXMEM_MemWriteData;
    reg  EXMEM_EqBranch, EXMEM_MemRead, EXMEM_MemWrite, EXMEM_RegWrite, EXMEM_MemToReg, EXMEM_NeqBranch, EXMEM_Jump;
    reg  [31:0] MEMWB_DMemOut;
    reg  [4:0]  MEMWB_RegWriteAddr, MEMWB_instr_rd; 
    reg  [31:0] MEMWB_ALUOut;
    reg  MEMWB_MemToReg, MEMWB_RegWrite;

    //instr memory is the memory module with some constant values
    Memory cpu_IMem(1'b1, reset, 1'b1, 1'b0, PC, 0, instr);

    //IFID pipeline
    always @(posedge clock, negedge reset)
    begin
        if(reset == 1'b0)
        begin
            IFID_instr <= 0;
            IFID_NewPC <= 0;
        end
        else if(IFID_Write) 
        begin
            IFID_instr <= instr;
            IFID_NewPC <= PC + 4;
        end
    end
//**************************

    //Control Unit receives the opcode and creates the signals needed
    control_main control_main(IFID_instr[31:26], RegDst, EqBranch, NeqBranch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUcntrl);

    //Regfile
    RegFile cpu_regs(clock, reset, IFID_instr[25:21], IFID_instr[20:16], MEMWB_RegWriteAddr, MEMWB_RegWrite, wRegData, rdA, rdB);
    
    //Function that extends the bits of the offset given
    assign signExtend = {{16{IFID_instr[15]}}, IFID_instr[15:0]};
    assign Jump_Dest = {{6{IFID_instr[25]}}, IFID_instr[25:0]};

    always @(posedge clock or negedge reset)
    begin 
        if (reset == 1'b0)
        begin
            IDEX_NewPC <= 32'b0;
            IDEX_rdA <= 32'b0;    
            IDEX_rdB <= 32'b0;
            IDEX_signExtend <= 32'b0;
            IDEX_Jump_Dest <= 32'b0;
            IDEX_instr_rd <= 5'b0;
            IDEX_instr_rs <= 5'b0;
            IDEX_instr_rt <= 5'b0;
            IDEX_RegDst <= 1'b0;
            IDEX_ALUcntrl <= 2'b0;
            IDEX_ALUSrc <= 1'b0;
            IDEX_EqBranch <= 1'b0;
            IDEX_NeqBranch <= 1'b0;
            IDEX_Jump <= 1'b0;
            IDEX_MemRead <= 1'b0;
            IDEX_MemWrite <= 1'b0;
            IDEX_MemToReg <= 1'b0;                  
            IDEX_RegWrite <= 1'b0;
        end
        else if(NOP)
        begin
            IDEX_NewPC <= IFID_NewPC;
            IDEX_rdA <= rdA;
            IDEX_rdB <= rdB;
            IDEX_signExtend <= signExtend;
            IDEX_Jump_Dest <= Jump_Dest
            IDEX_instr_rd <= IFID_instr[15:11];
            IDEX_instr_rs <= IFID_instr[25:21];
            IDEX_instr_rt <= IFID_instr[20:16];
            IDEX_RegDst <= RegDst;
            IDEX_ALUcntrl <= ALUcntrl;
            IDEX_ALUSrc <= ALUSrc;
            IDEX_EqBranch <= EqBranch;
            IDEX_NeqBranch <= NeqBranch;
            IDEX_Jump <= Jump;
            IDEX_MemRead <= MemRead;
            IDEX_MemWrite <= MemWrite;
            IDEX_MemToReg <= MemToReg;                  
            IDEX_RegWrite <= RegWrite;
        end
        else begin
            IDEX_rdA <= rdA;
            IDEX_rdB <= rdB; 
            IDEX_signExtend <= signExtend;
            IDEX_Jump_Dest <= Jump_Dest;
            IDEX_instr_rd <= IFID_instr[15:11];
            IDEX_instr_rs <= IFID_instr[25:21];
            IDEX_instr_rt <= IFID_instr[20:16];
            IDEX_RegDst <= 1'b0;
            IDEX_ALUcntrl <= 1'b0;
            IDEX_ALUSrc <= 1'b0;
            IDEX_EqBranch <= 1'b0;
            IDEX_NeqBranch <= 1'b0;
            IDEX_Jump <= 1'b0;
            IDEX_MemRead <= 1'b0;
            IDEX_MemWrite <= 1'b0;
            IDEX_MemToReg <= 1'b0;
            IDEX_RegWrite <= 1'b0;
        end
  end
  
    //Multiplexer that chooses the correct register address to write
    assign RegWriteAddr = (IDEX_RegDst) ? IDEX_instr_rd : IDEX_instr_rt;
    
    assign ALUInB_1 = (ForwardB == 2'b0) ? (IDEX_rdB) : ((ForwardB == 2'b1) ? (wRegData) : (EXMEM_ALUOut));

    //Multiplexer that chooses between register or extended offset data
    assign ALUInB_2 = (IDEX_ALUSrc) ? IDEX_signExtend : ALUInB_1;

    assign ALUInA = (ForwardA == 2'b0) ? (IDEX_rdA) : ((ForwardA == 2'b1) ? (wRegData) : (EXMEM_ALUOut));

    ALU cpu_alu(ALUout, zero, ALUInA, ALUInB_2 , ALUOp, IDEX_signExtend[10:6]);

    control_alu control_alu(IDEX_ALUcntrl, IDEX_signExtend[5:0], ALUOp);
    
    always @(posedge clock or negedge reset)
    begin 
        if (reset == 1'b0)     
        begin
            EXMEM_NewPC <= 32'b0;
            EXMEM_Jump_Dest <= 32'b0;
            EXMEM_ALUOut <= 32'b0;    
            EXMEM_RegWriteAddr <= 5'b0;
            EXMEM_MemWriteData <= 32'b0;
            EXMEM_Zero <= 1'b0;
            EXMEM_instr_rd <= 5'b0;
            EXMEM_EqBranch <= 1'b0;
            EXMEM_NeqBranch <= 1'b0;
            EXMEM_Jump <= 1'b0;
            EXMEM_MemRead <= 1'b0;
            EXMEM_MemWrite <= 1'b0;
            EXMEM_MemToReg <= 1'b0;                  
            EXMEM_RegWrite <= 1'b0;
        end 
        else 
        begin
            EXMEM_NewPC <= IDEX_NewPC + IDEX_signExtend;
            EXMEM_Jump_Dest <= IDEX_Jump_Dest;
            EXMEM_ALUOut <= ALUout;    
            EXMEM_RegWriteAddr <= RegWriteAddr;
            EXMEM_MemWriteData <= ALUInB_1;
            EXMEM_Zero <= zero;
            EXMEM_instr_rd <= IDEX_instr_rd;
            EXMEM_EqBranch <= IDEX_EqBranch;
            EXMEM_NeqBranch <= IDEX_NeqBranch;
            EXMEM_Jump <= IDEX_Jump
            EXMEM_MemRead <= IDEX_MemRead;
            EXMEM_MemWrite <= IDEX_MemWrite;
            EXMEM_MemToReg <= IDEX_MemToReg;                  
            EXMEM_RegWrite <= IDEX_RegWrite;
        end
    end

    //*********
    assign NewPC = ((EXMEM_Zero == 1'b1 && EXMEM_EqBranch == 1'b1) || (EXMEM_Zero == 1'b0 && EXMEM_NeqBranch == 1'b1)) ? (EXMEM_NewPC) : ((EXMEM_Jump) ? (EXMEM_Jump_Dest) : (PC + 4));

    //Data Memory
    Memory cpu_DMem(clock, reset, EXMEM_MemRead, EXMEM_MemWrite, EXMEM_ALUOut, EXMEM_MemWriteData, DMemOut);

    always @(posedge clock or negedge reset)
    begin 
        if (reset == 1'b0)     
        begin
            MEMWB_DMemOut <= 32'b0;    
            MEMWB_ALUOut <= 32'b0;
            MEMWB_RegWriteAddr <= 5'b0;
            MEMWB_instr_rd <= 5'b0;
            MEMWB_MemToReg <= 1'b0;                  
            MEMWB_RegWrite <= 1'b0;
        end 
        else 
        begin
            MEMWB_DMemOut <= DMemOut;
            MEMWB_ALUOut <= EXMEM_ALUOut;
            MEMWB_RegWriteAddr <= EXMEM_RegWriteAddr;
            MEMWB_instr_rd <= EXMEM_instr_rd;
            MEMWB_MemToReg <= EXMEM_MemToReg;                  
            MEMWB_RegWrite <= EXMEM_RegWrite;
        end
    end
    //Multiplexer that chooses between memory data and ALU result
    assign wRegData = (MEMWB_MemToReg) ? MEMWB_DMemOut : MEMWB_ALUOut;
        
    
    always @(posedge clock , negedge reset) 
    begin
        if (reset == 1'b0)
            PC <= -4;
        else if (PC == -4)
            PC <= 0;
        else if(PC_Write)
            PC <= NewPC;
    end

    Forwarding_Unit Forwarding_Unit(IDEX_instr_rs, IDEX_instr_rt, EXMEM_RegWrite, EXMEM_RegWriteAddr, MEMWB_RegWrite, MEMWB_RegWriteAddr, ForwardA, ForwardB);
    Hazard_Unit Hazard_Unit (IFID_instr[25:21], IFID_instr[20:16], IDEX_MemRead, IDEX_instr_rt, NOP, PC_Write, IFID_Write);
endmodule