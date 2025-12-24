`timescale 1ns/1ps
//Top module that combines everything and is The vgacontroller
module vgacontroller(reset, clk, VGA_HSYNC, VGA_VSYNC, VGA_RED, VGA_GREEN, VGA_BLUE);
    input reset, clk;
    wire [6:0] Hpixel, Vpixel;
    wire [11:0] H_counter;
    wire [9:0] V_counter;
    wire [4:0] count_1;
    wire [2:0] count_2;
    wire H_pixel_disp, V_pixel_disp;
    wire [13:0] address;
    output VGA_HSYNC, VGA_VSYNC, VGA_RED, VGA_GREEN, VGA_BLUE;
    wire reset_db;
    //debounce
    debounce_sync debounce(clk, reset, reset_db);
    //Main H_counter
    counter_Hsync counter_1(reset_db, clk, H_counter);

    //modules for Hsync
    Hsync FSM_H(reset_db, clk, H_counter, VGA_HSYNC, H_pixel_disp);
    pixel_period_counter counter_2(reset_db, clk, H_pixel_disp, count_1);
    H_pixel_count counter_3(reset_db, clk, Hpixel, count_1);

    //V_counter
    counter_Vsync counter_6(reset_db, clk, H_counter, V_counter);

    //modules for Vsync
    Vsync FSM_V(reset_db, clk, V_counter, VGA_VSYNC, V_pixel_disp, H_counter);
    line_period_counter counter_4(reset_db, clk, V_pixel_disp, count_2, H_counter);
    v_pixel_count counter_5(reset_db, clk, Vpixel, count_2, H_counter);

    //Address controling module
    address_control address_control(H_pixel_disp, V_pixel_disp, Hpixel, Vpixel, address);

    //Memory that stores the image to be depicted
    vram vram(reset_db, clk, address, VGA_RED, VGA_GREEN, VGA_BLUE);


endmodule