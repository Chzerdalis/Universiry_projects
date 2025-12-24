`timescale 1ns / 1ps

module debounce_sync(clk, sign_in, sig_out);
    input clk, sign_in;
    output sig_out;
    wire sign_sync, sig_change;

    sync_button sb(sign_in, clk, sign_sync, sig_change);
    debounce db(sign_sync, sig_change, sig_out, clk);
endmodule