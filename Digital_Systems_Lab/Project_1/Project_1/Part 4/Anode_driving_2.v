`timescale 1ns / 1ps

/*This module receives a counter that indicates the state and 4 characters
and gives the character to be displayed and 0 to the anode that is to show this char*/

module Anode_driver_2(counter, c0, c1, c2, c3, an0, an1, an2, an3, char_out);
    input [3:0] counter;
    input [3:0] c0, c1, c2, c3;
    output reg an0, an1, an2, an3;
    output reg [3:0] char_out;

    always@(counter or c0 or c1 or c2 or c3) begin
        case(counter)
            //First digit
            4'b0000: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c0;
            end
            4'b0001: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c0;
            end
            4'b0010: begin
            {an3, an2, an1, an0} = 4'b1110; //Anode enabled
            char_out = c0;
            end
            4'b0011: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c0;
            end

            //Second digit
            4'b0100: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c1;
            end
            4'b0101: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c1;
            end
            4'b0110: begin
            {an3, an2, an1, an0} = 4'b1101; //Anode enabled
            char_out = c1;
            end
            4'b0111: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c1;
            end

            //Thrird digit
            4'b1000: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c2;
            end
            4'b1001: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c2;
            end
            4'b1010: begin
            {an3, an2, an1, an0} = 4'b1011; //Anode enabled
            char_out = c2;
            end
            4'b1011: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c2;
            end

            //Fourth digit
            4'b1100: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c3;
            end
            4'b1101: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c3;
            end
            4'b1110: begin
            {an3, an2, an1, an0} = 4'b0111; //Anode enabled
            char_out = c3;
            end
            4'b1111: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c3;
            end
            default: begin
            {an3, an2, an1, an0} = 4'b1111;
            char_out = c0;
            end
        endcase
    end
endmodule