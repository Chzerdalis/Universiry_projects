`timescale 1ns / 1ps

module test();
    reg [3:0] char;
    wire [6:0] LED;
    integer i = 0;

    LEDdecoder LEDtest(char, LED);

    initial begin
        #5 char = 4'b0000;
        
        $monitor("Char = %h || LED = %b", char, LED);

        for(i = 0; i < 15; i = i + 1) begin
            #20 char = char + 1;
        end

        $finish;
    end
endmodule