`timescale 1ns/1ps

//This module selects the number of clock cyrcles that 
//equal to the sampling time that we want.
module baud_rate_select(baud_select, counter_max);
    input [2:0] baud_select;
    output reg [15:0] counter_max;

    always @(baud_select) begin
        case(baud_select)
            3'b000: counter_max = 16'b0101000101100001;
            3'b001: counter_max = 16'b0001010001011000;
            3'b010: counter_max = 16'b0000010100010110;
            3'b011: counter_max = 16'b0000001010001011;
            3'b100: counter_max = 16'b0000000101000110;
            3'b101: counter_max = 16'b0000000010100011;
            3'b110: counter_max = 16'b0000000001101101;
            3'b111: counter_max = 16'b0000000000110110;
        endcase
    end
endmodule