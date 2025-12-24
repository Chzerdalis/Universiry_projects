`timescale 1ns / 1ps

/*this is a counter that counts only when the button is pressed*/

module Four_bit_counter_button(clk, reset, counter, button);
    input clk, reset, button;
    output reg [3:0] counter;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            counter <= 4'b0000;
        end else begin
            if(button) 
                counter <= counter + 'b1;
            else
                counter <= counter;
        end
    end
endmodule