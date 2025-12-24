`timescale 1ns / 1ps

/*This modules changes the part of the message that is to be displayed every time the counter changes*/

module  Text_scroll(counter, message, c3, c2, c1, c0);
    input [63:0] message;
    input [3:0] counter;
    output reg [3:0] c3, c2, c1, c0;

    always@(counter or message)
    begin
        case(counter)
        4'b0000: begin
            c3 = message[3:0];
            c2 = message[7:4];
            c1 = message[11:8];
            c0 = message[15:12];
        end 4'b0001: begin
            c3 = message[7:4];
            c2 = message[11:8];
            c1 = message[15:12];
            c0 = message[19:16];
        end 4'b0010: begin
            c3 = message[11:8];
            c2 = message[15:12];
            c1 = message[19:16];
            c0 = message[23:20];
        end 4'b0011: begin
            c3 = message[15:12];
            c2 = message[19:16];
            c1 = message[23:20];
            c0 = message[27:24];
        end 4'b0100: begin
            c3 = message[19:16];
            c2 = message[23:20];
            c1 = message[27:24];
            c0 = message[31:28];
        end 4'b0101: begin
            c3 = message[23:20];
            c2 = message[27:24];
            c1 = message[31:28];
            c0 = message[35:32];
        end 4'b0110: begin
            c3 = message[27:24];
            c2 = message[31:28];
            c1 = message[35:32];
            c0 = message[39:36];
        end 4'b0111: begin
            c3 = message[31:28];
            c2 = message[35:32];
            c1 = message[39:36];
            c0 = message[43:40];
        end 4'b1000: begin
            c3 = message[35:32];
            c2 = message[39:36];
            c1 = message[43:40];
            c0 = message[47:44];
        end 4'b1001: begin
            c3 = message[39:36];
            c2 = message[43:40];
            c1 = message[47:44];
            c0 = message[51:48];
        end 4'b1010: begin
            c3 = message[43:40];
            c2 = message[47:44];
            c1 = message[51:48];
            c0 = message[55:52];
        end 4'b1011: begin
            c3 = message[47:44];
            c2 = message[51:48];
            c1 = message[55:52];
            c0 = message[59:56];
        end 4'b1100: begin
            c3 = message[51:48];
            c2 = message[55:52];
            c1 = message[59:56];
            c0 = message[63:60];
        end 4'b1101: begin
            c3 = message[55:52];
            c2 = message[59:56];
            c1 = message[63:60];
            c0 = message[3:0];
        end 4'b1110: begin
            c3 = message[59:56];
            c2 = message[63:60];
            c1 = message[3:0];
            c0 = message[7:4];
        end 4'b1111: begin
            c3 = message[63:60];
            c2 = message[3:0];
            c1 = message[7:4];
            c0 = message[11:8];
        end default: begin
            c3 = message[63:60];
            c2 = message[63:60];
            c1 = message[63:60];
            c0 = message[63:60];
        end                     
        endcase
    end
    
endmodule