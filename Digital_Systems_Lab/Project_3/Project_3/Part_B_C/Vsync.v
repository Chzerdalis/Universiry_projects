`timescale 1ns/1ps
//This FSM controls the Vsync signal and the Vetrical video on
module Vsync(reset, clk, V_counter, Vsync, V_pixel_disp, H_counter);
    input reset, clk;
    input [9:0] V_counter;
    input [11:0] H_counter;
    output reg Vsync, V_pixel_disp;

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
    //&& H_counter == 3199 is used to know that the state changes in line with the state changes of the H_FSM 
    always@(currentstate or V_counter or H_counter) begin
        case(currentstate)

            PULSE:begin
                Vsync = 0;
                V_pixel_disp = 0;//Variable that enables the Video for the Vsync
                if(V_counter == 1 && H_counter == 3199) begin
                    nextstate = BACK_PORCH;
                end else begin
                    nextstate = currentstate;
                end
            end

            BACK_PORCH:begin
                Vsync = 1;
                V_pixel_disp = 0;
                if(V_counter == 30 && H_counter == 3199) begin 
                    nextstate = DISPLAY_TIME;
                end else begin
                    nextstate = currentstate;
                end
            end

            DISPLAY_TIME:begin
                Vsync = 1;
                V_pixel_disp = 1;
                if(V_counter == 510 && H_counter == 3199) begin
                    nextstate = FRONT_PORCH;
                end else begin
                    nextstate = currentstate;
                end
            end

            FRONT_PORCH:begin
                Vsync = 1;
                V_pixel_disp = 0;
                if(V_counter == 520 && H_counter == 3199) begin
                    nextstate = PULSE;
                end else begin
                    nextstate = currentstate;
                end
            end

            default: begin
                Vsync = 0;
                nextstate = currentstate;
            end

        endcase
    end
endmodule