`timescale 1ns / 1ps

//This module syncs the sign_in signal
module sync_button(sign_in, clk, sign_sync, sig_change);
    input sign_in, clk;
    output sign_sync, sig_change;
    wire Q1, Q2;

    D_Flip_Flop DFF_1(clk, sign_in, Q1);
    D_Flip_Flop DFF_2(clk, Q1, Q2);

    assign sign_sync = Q1;
    assign sig_change = Q1 ^ Q2;
endmodule

