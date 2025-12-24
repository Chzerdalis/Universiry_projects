`timescale 1ns / 1ps

module test();
    reg clk, reset;
    wire db_sig, sig_change, sign_sync;


     sync_button ena(reset, clk, sign_sync, sig_change);
     debounce_2 dio(sign_sync, sig_change, db_sig, clk);

     initial begin
        clk = 1;
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
        #1000 reset = 0;
        #500 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
        #1000 reset = 0;
     end

    always #5 clk = ~clk;
        
endmodule