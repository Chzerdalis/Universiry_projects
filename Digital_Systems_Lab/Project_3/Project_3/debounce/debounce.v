`timescale 1ns / 1ps

//This module takes a bouncing signal and stabilazes it for onlly one period
module debounce(sig_in, sig_change, db_sig, clk);
    input sig_in, sig_change, clk;
    output db_sig;
    wire state, c_f;
    wire [5:0] t_c;

    debounce_part_1 part_1(.clk(clk), .sig_change(sig_change),
    .state(state), .count_finished(c_f));

    debounce_part_2 part_2(.clk(clk), .state(state),
    .time_counter(t_c), .count_finished(c_f), .sig_change(sig_change));

    debounce_part_3 part_3(.clk(clk), .count_finished(c_f),
    .signal_in(sig_in), .time_counter(t_c), .db_signal(db_sig), .sig_change(sig_change));


endmodule