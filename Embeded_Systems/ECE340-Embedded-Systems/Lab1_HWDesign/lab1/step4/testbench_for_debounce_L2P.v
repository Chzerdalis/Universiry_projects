`timescale 1ns/1ps

module tb_Debounce_L2P;
  reg clk;
  reg signal_in;
  wire signal_out;

  Debounce_L2P dut (
    .clk(clk),
    .signal_in(signal_in),
    .signal_out(signal_out)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 1;
    signal_in = 0;
    #100    signal_in = 1;
    #10     signal_in = 0;
    #10     signal_in = 1;
    #10     signal_in = 1;
    #10     signal_in = 0;
    #10     signal_in = 1;
    #10     signal_in = 1;
    #1000   signal_in = 0;
    #500    signal_in = 1;
    #999    signal_in = 0;
    #20     signal_in = 1;
    #2000   signal_in = 0;
    #20;

    $finish;
  end

endmodule
