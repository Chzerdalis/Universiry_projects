`timescale 1ns / 1ps

/*This module initializes the memory of the message*/

module Message_init(clk, reset, message);
    input clk, reset;
    output reg [63:0] message;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            message[3:0] = 4'b0000; //0
            message[7:4] = 4'b0001; //1
            message[11:8] = 4'b0010; //2
            message[15:12] = 4'b0011; //3
            message[19:16] = 4'b0100; //4
            message[23:20] = 4'b0101; //5
            message[27:24] = 4'b0110; //6
            message[31:28] = 4'b0111; //7
            message[35:32] = 4'b1000; //8
            message[39:36] = 4'b1001; //9
            message[43:40] = 4'b1010; //a
            message[47:44] = 4'b1011; //b
            message[51:48] = 4'b1100; //c
            message[55:52] = 4'b1101; //d
            message[59:56] = 4'b1110; //e
            message[63:60] = 4'b1111; //f
        end 
        else begin
            message[3:0] = 4'b0000;
            message[7:4] = 4'b0001;
            message[11:8] = 4'b0010;
            message[15:12] = 4'b0011;
            message[19:16] = 4'b0100;
            message[23:20] = 4'b0101;
            message[27:24] = 4'b0110;
            message[31:28] = 4'b0111;
            message[35:32] = 4'b1000;
            message[39:36] = 4'b1001;
            message[43:40] = 4'b1010;
            message[47:44] = 4'b1011;
            message[51:48] = 4'b1100;
            message[55:52] = 4'b1101;
            message[59:56] = 4'b1110;
            message[63:60] = 4'b1111;
        end
    end
endmodule