`timescale 1ns/1ps

module Hsync(reset, clk, H_counter, Hsync, H_pixel_disp);
    input reset, clk;
    input [11:0] H_counter;
    output reg Hsync, H_pixel_disp;

    localparam [1:0] 
        PULSE        = 2'b00,
        BACK_PORCH   = 2'b01,
        DISPLAY_TIME = 2'b11,
        FRONT_PORCH  = 2'b10;

    reg [1:0] currentstate, nextstate;

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            currentstate <= PULSE;
        end else begin
            currentstate <= nextstate;
        end
    end

    always@(currentstate or H_counter) begin
        case(currentstate)

            PULSE:begin
                Hsync = 0;
                H_pixel_disp = 0;
                if(H_counter == 383) begin
                    nextstate = BACK_PORCH;
                end else begin
                    nextstate = currentstate;
                end
            end

            BACK_PORCH:begin
                Hsync = 1;
                H_pixel_disp = 0;
                if(H_counter == 574) begin
                    nextstate = DISPLAY_TIME;
                end else begin
                    nextstate = currentstate;
                end
            end

            DISPLAY_TIME:begin
                Hsync = 1;
                H_pixel_disp = 1;
                if(H_counter == 3134) begin
                    nextstate = FRONT_PORCH;
                end else begin
                    nextstate = currentstate;
                end
            end

            FRONT_PORCH:begin
                Hsync = 1;
                H_pixel_disp = 0;
                if(H_counter == 3199) begin
                    nextstate = PULSE;
                end else begin
                    nextstate = currentstate;
                end
            end

            default: begin
                Hsync = 0;
                nextstate = currentstate;
            end

        endcase
    end
endmodule