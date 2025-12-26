`timescale 1ns / 1ps

module SevenSegDisplay(clk, reset, DataIn, an, signals);
    input clk, reset;
    input [7:0] DataIn;

    output reg an;
    output reg [6:0] signals;

    reg [4:0] counter;
    reg [3:0] out;

    //counter from 0 to 31 to mimic the 320ns pulse
    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            counter <= 0;
        end else begin
            // if(counter == 31) begin
            //     counter <= 0;
            // end else begin
            //     counter <= counter + 1;
            // end
            counter <= counter + 1;
        end
    end

    always @ (*) begin
        if(counter < 16) begin //Depending on the counter the anode is zero or one and the data to be displayed changes
            an = 0;
            out = DataIn[3:0];
        end else begin
            an = 1;
            out = DataIn[7:4];
        end

        //Led decoder
        case(out)
            4'b0000: signals = 7'b1111110; //0.
            4'b0001: signals = 7'b0110000; //1.
            4'b0010: signals = 7'b1101101; //2.
            4'b0011: signals = 7'b1111001; //3.
            4'b0100: signals = 7'b0110011; //4.
            4'b0101: signals = 7'b1011011; //5.
            4'b0110: signals = 7'b1011111; //6.
            4'b0111: signals = 7'b1110000; //7.
            4'b1000: signals = 7'b1111111; //8.
            4'b1001: signals = 7'b1111011; //9.
            4'b1010: signals = 7'b1110111; //a.
            4'b1011: signals = 7'b0011111; //b.
            4'b1100: signals = 7'b0001101; //c
            4'b1101: signals = 7'b0111101; //d
            4'b1110: signals = 7'b1001111; //e
            4'b1111: signals = 7'b1000111; //F
            default: signals = 7'b1000000; //-
        endcase
    end
endmodule