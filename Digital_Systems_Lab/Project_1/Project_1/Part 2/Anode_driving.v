`timescale 1ns / 1ps

/*This module receives a counter that indicates the state and gives the character 
to be displayed and 0 to the anode that is to show this char, the digits that can be shown are
fixed (0 ,1 ,2 ,3) to each anode*/

module Anode_driver(counter, an0, an1, an2, an3, char);
    input [3:0] counter;
    output reg an0, an1, an2, an3;
    output reg [3:0] char;

    always@(counter) begin
        case(counter)
            //First digit
            4'b0000: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0011;
            end
            4'b0001: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0011;
            end
            4'b0010: begin
            {an3, an2, an1, an0} = 4'b1110; //Anode enabled
            char = 4'b0011;
            end
            4'b0011: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0011;
            end

            //Second digit
            4'b0100: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0010;
            end
            4'b0101: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0010;
            end
            4'b0110: begin
            {an3, an2, an1, an0} = 4'b1101; //Anode enabled
            char = 4'b0010;
            end
            4'b0111: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0010;
            end

            //Thrird digit
            4'b1000: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0001;
            end
            4'b1001: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0001;
            end
            4'b1010: begin
            {an3, an2, an1, an0} = 4'b1011; //Anode enabled
            char = 4'b0001;
            end
            4'b1011: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0001;
            end

            //Fourth digit
            4'b1100: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0000;
            end
            4'b1101: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0000;
            end
            4'b1110: begin
            {an3, an2, an1, an0} = 4'b0111; //Anode enabled
            char = 4'b0000;
            end
            4'b1111: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0000;
            end
            default: begin
            {an3, an2, an1, an0} = 4'b1111;
            char = 4'b0000;
            end
        endcase
    end
endmodule