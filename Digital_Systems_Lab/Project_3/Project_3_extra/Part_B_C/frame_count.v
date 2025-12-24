`timescale 1ns/1ps

module frame_counter(reset, clk, V_counter, frame_count, H_counter);
    input clk, reset;
    input [9:0] V_counter;
    input [11:0] H_counter;
    output reg [1:0] frame_count;
    reg [3:0] counter;
 
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            frame_count <= 0;
            counter <= 0;
        end else begin
            if(V_counter == 520 && H_counter == 3199) begin
                counter <= counter + 1;
                if(counter == 4'b1111) begin
                    frame_count <= frame_count + 1;
                end else begin 
                    frame_count <= frame_count;
                end 
            end else begin 
                frame_count <= frame_count;
                counter <= counter;
            end
        end
    end
endmodule