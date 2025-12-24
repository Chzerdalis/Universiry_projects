`include "library.v"
`timescale 1ns/1ps
`define clock_period 10
//macro to pring the value of all registers 
`define print_regs \
    $display; \
    for(i = 0; i<32; i=i+1) begin \
        $display("regs[%1d]: %2d", i, N1.data[i]); \
    end

module cpu_tb;
    wire zero;
    reg [3:0] op;
    reg [4:0] raA, raB, wa;
    reg clock, reset, wen;
    wire signed [31:0] rdA, rdB;
    wire signed [31:0] out;
    integer i, j;

    RegFile N1(clock, reset, raA, raB, wa, wen, out, rdA, rdB);
    ALU N2(out, zero, rdA, rdB, op);

initial begin
    $dumpfile("cpu_tb.vcd");
    $dumpvars(0,cpu_tb);

    clock = 1'b0;
    //reset
    $display("RESET");
    reset = 1'b0;
   
    //check if all regs are 0
    #(2*`clock_period)
    `print_regs;
    #(4.25*`clock_period) 
    reset = 1'b1;
   
   //initialize registers
    for (i = 0; i < 32; i = i+1)
        N1.data[i] = i;    
        #(2*`clock_period)
   
    //test_1
    //in this test we test all operations between 1 and 2 registers 
    //and write the results in regs 3 to 9
    $display("\nTEST 1");
    raA = 1; raB = 2;
    #(2*`clock_period)
    j = 3;
    for(i = 0; i < 14; i = i + 1) begin
        #(2*`clock_period)
        op = i;
        if(op == 2)
        i = 5;
        if(op == 7)
        i = 11;
        wa = j;
        #(`clock_period)
        wen = 1;
        #(`clock_period)
        wen = 0;
        j = j + 1;
        $display("op: %3d rdA: %3d rdB: %3d out: %3d time: %3d",op, rdA, rdB, out, $time);
    end

    `print_regs;

    //test 2
    //This test operates on raA and raB and writes the result in raA
    $display("\nTEST 2");
    #(2*`clock_period)
    raA = 2; raB = 7;
    $display("rdA: %3d rdB: %3d time: %3d", rdA, rdB, $time);
    for(i = 0; i < 5; i=i+1) begin
        #(2*`clock_period)
        //change operation
        op = 2;
        //
        wa = 2;
        #(`clock_period)
        wen = 1;
        #(`clock_period)
        wen = 0;
        $display("rdA: %3d rdB: %3d time: %3d", rdA, rdB, $time);
    end

    `print_regs;

    //test 3
    //this test does an operation with raA and raB, puts the result in 
    //raB and then changes the registers and does it again
    $display("\nTEST 3");
    #(2*`clock_period)
    for(i = 0; i < 31; i=i+1) begin
        raA = i;
        raB = i + 1;
        #(2*`clock_period)
        //change oparation
        op = 2;
        //
        #(2*`clock_period)
        $display("rdA: %3d rdB: %3d out: %3d time: %3d", rdA, rdB, out, $time);
        wa = i + 1;
        #(`clock_period)
        wen = 1;
        #(`clock_period)
        wen = 0;
    end

    `print_regs;
    //TEST 4

    //initialize registers
    for (i = 0; i < 32; i = i+1)
        N1.data[i] = i;    
        #(2*`clock_period)

    $display("\nTEST 44");
    j = 0;
    wa = 31;
    for (i = 1; i < 32; i = i + 1)
    begin
        raA = i - 1;
        raB = i;
        #(`clock_period);
        op = 0;
        j = i & (i - 1);
        #(`clock_period);
        $display("AND   [rdA: %3d rdB: %3d out: %3d expected out: %3d time: %3d]", rdA, rdB, out, j, $time);
        op = 1;
        j = i | (i - 1);
        #(`clock_period);
        $display("OR    [rdA: %3d rdB: %3d out: %3d expected out: %3d time: %3d]", rdA, rdB, out, j, $time);
         op = 2;
        j = i + i - 1;
        #(`clock_period);
        $display("ADD   [rdA: %3d rdB: %3d out: %3d expected out: %3d time: %3d]", rdA, rdB, out, j, $time);
         op = 6;
        j = (i - 1) - i;
        #(`clock_period);
        $display("MINUS [rdA: %3d rdB: %3d out: %3d expected out: %3d time: %3d]", rdA, rdB, out, j, $time);
         op = 7;
        j = (i < (i - 1)) ? 32'b1 : 32'b0;
        #(`clock_period);
        $display("SLT   [rdA: %3d rdB: %3d out: %3d expected out: %3d time: %3d]", rdA, rdB, out, j, $time);
         op = 12;
        j = ~(i | (i - 1));
        #(`clock_period);
        $display("NOR   [rdA: %3d rdB: %3d out: %3d expected out: %3d time: %3d]", rdA, rdB, out, j, $time);
    end
    
    `print_regs;

    #2000 $finish;
end 

always 
   #(`clock_period / 2) clock = ~clock;  
   
endmodule
