    
`timescale 1ns/1ps
// ALU Module. Inputs: inA, inB. Output: out. 
// Operations: bitwise and (op = 0)
//             bitwise or  (op = 1)
//             addition (op = 2)
//             subtraction (op = 6)
//             slt  (op = 7)
//             nor (op = 12)

module ALU (out, zero, inA, inB, op);
    parameter N = 32;
    output reg[N-1:0] out;
    output zero;
    input signed [N-1:0] inA, inB;
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

// Register File Module. Read ports: address raA, data rdA
//                                   address raB, data rdB
//                       Write port: address wa, data wd, enable wen.
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
                data[i] = 32'h0;
        end
        else if(wen == 1) 
        begin
            data[wa] <= wd; 
        end
    end
endmodule

