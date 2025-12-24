`timescale 1ns / 1ps

//This module takes a bouncing signal and stabilazes it for onlly one period
module debounce_2(sig_in, sig_change, db_sig, clk, reset);
    input sig_in, sig_change, clk, reset;
    output db_sig;
    wire state, c_f;
    wire [5:0] t_c;

    debounce_part_1 part_1(.clk(clk), .reset(reset), .sig_change(sig_change),
    .state(state), .count_finished(c_f));

    debounce_part_2 part_2(.clk(clk), .reset(reset), .state(state),
    .time_counter(t_c), .count_finished(c_f));

    debounce_part_3 part_3(.clk(clk), .reset(reset), .count_finished(c_f),
    .signal_in(sig_in), .time_counter(t_c), .db_signal(db_sig));


endmodule