`timescale 1ns/1ps

module test_tb_butterfly;
    // Parameters
    parameter WIDTH = 32;
    parameter NUM_TESTS = 512;
    parameter CLK_PERIOD = 10;
    parameter WAIT_CYCLES = 6;

    // Clock / reset / stimulus
    reg clock = 0;
    reg resetn = 0;
    reg input_en = 0;

    // Inputs (signed)
    reg signed [WIDTH-1:0] a_real;
    reg signed [WIDTH-1:0] a_imag;
    reg signed [WIDTH-1:0] b_real;
    reg signed [WIDTH-1:0] b_imag;
    reg signed [WIDTH-1:0] c_real;
    reg signed [WIDTH-1:0] c_imag;
    reg signed [WIDTH-1:0] d_real;
    reg signed [WIDTH-1:0] d_imag;

    reg signed [WIDTH/2-1:0] tw_real_0;
    reg signed [WIDTH/2-1:0] tw_imag_0;
    reg signed [WIDTH/2-1:0] tw_real_1;
    reg signed [WIDTH/2-1:0] tw_imag_1;
    reg signed [WIDTH/2-1:0] tw_real_2;
    reg signed [WIDTH/2-1:0] tw_imag_2;

    // Outputs from new butterfly
    wire out_en_new;
    wire signed [WIDTH-1:0] outr_0;
    wire signed [WIDTH-1:0] outi_0;
    wire signed [WIDTH-1:0] outr_1;
    wire signed [WIDTH-1:0] outi_1;
    wire signed [WIDTH-1:0] outr_2;
    wire signed [WIDTH-1:0] outi_2;
    wire signed [WIDTH-1:0] outr_3;
    wire signed [WIDTH-1:0] outi_3;

    // Outputs from old butterfly
    wire signed [WIDTH-1:0] outr_0_old;
    wire signed [WIDTH-1:0] outi_0_old;
    wire signed [WIDTH-1:0] outr_1_old;
    wire signed [WIDTH-1:0] outi_1_old;
    wire signed [WIDTH-1:0] outr_2_old;
    wire signed [WIDTH-1:0] outi_2_old;
    wire signed [WIDTH-1:0] outr_3_old;
    wire signed [WIDTH-1:0] outi_3_old;

    integer i;
    integer seed;

    // Clock
    always #(CLK_PERIOD/2) clock = ~clock;

    // Instantiate DUTs
    // Adjust port names if your modules use different signal names.
    butterfly_radix4 butterfly_new (
        .clock(clock),
        .reset(~resetn),
        .start(input_en),
        .ar(a_real),
        .ai(a_imag),
        .br(b_real),
        .bi(b_imag),
        .cr(c_real),
        .ci(c_imag),
        .dr(d_real),
        .di(d_imag),
        .w0r(tw_real_0),
        .w0i(tw_imag_0),
        .w1r(tw_real_1),
        .w1i(tw_imag_1),
        .w2r(tw_real_2),
        .w2i(tw_imag_2),
        .done(out_en_new),
        .out1r(outr_0),
        .out1i(outi_0),
        .out2r(outr_1),
        .out2i(outi_1),
        .out3r(outr_2),
        .out3i(outi_2),
        .out4r(outr_3),
        .out4i(outi_3)
    );

    butterfly_radix4_old butterfly_old_inst (
        .ar(a_real),
        .ai(a_imag),
        .br(b_real),
        .bi(b_imag),
        .cr(c_real),
        .ci(c_imag),
        .dr(d_real),
        .di(d_imag),
        .w0r(tw_real_0),
        .w0i(tw_imag_0),
        .w1r(tw_real_1),
        .w1i(tw_imag_1),
        .w2r(tw_real_2),
        .w2i(tw_imag_2),
        .out0r(outr_0_old),
        .out0i(outi_0_old),
        .out1r(outr_1_old),
        .out1i(outi_1_old),
        .out2r(outr_2_old),
        .out2i(outi_2_old),
        .out3r(outr_3_old),
        .out3i(outi_3_old)
    );

    // Test sequence
    initial begin
        seed = 32'hDEADBEEF;
        // Reset pulse
        resetn = 0;
        input_en = 0;
        a_real = 0; a_imag = 0;
        b_real = 0; b_imag = 0;
        c_real = 0; c_imag = 0;
        d_real = 0; d_imag = 0;
        tw_real_0 = 0; tw_imag_0 = 0;
        tw_real_1 = 0; tw_imag_1 = 0;
        tw_real_2 = 0; tw_imag_2 = 0;
        #(CLK_PERIOD * 4);
        resetn = 1;
        #(CLK_PERIOD * 2);


        a_real = $random(seed);
        a_imag = $random(seed);
        b_real = $random(seed);
        b_imag = $random(seed);
        c_real = $random(seed);
        c_imag = $random(seed);
        d_real = $random(seed);
        d_imag = $random(seed);
        tw_real_0 = $random(seed)% 65536;
        tw_imag_0 = $random(seed)% 65536;
        tw_real_1 = $random(seed)% 65536;
        tw_imag_1 = $random(seed)% 65536;
        tw_real_2 = $random(seed)% 65536;
        tw_imag_2 = $random(seed)% 65536;

        // Apply inputs one cycle
        input_en = 1;
        @(posedge clock);

        // Wait a few cycles for outputs to settle
        repeat (WAIT_CYCLES) @(posedge clock);

        if (out_en_new) begin
            if (outr_0 !== outr_0_old ||
                outi_0 !== outi_0_old ||
                outr_1 !== outr_1_old ||
                outi_1 !== outi_1_old) begin
                $display("OUTPUT MISMATCH at test %0d time %0t", i, $time);
                $display(" New: a_out=(%0d,%0d) b_out=(%0d,%0d)", outr_0, outi_0, outr_1, outi_1);
                $display(" Old: a_out=(%0d,%0d) b_out=(%0d,%0d)", outr_0_old, outi_0_old, outr_1_old, outi_1_old);
            end
        end

        $display("test passed: butterfly and butterfly_old outputs match.");
        $finish;
    end

    // Timeout safety
    initial begin
        #(CLK_PERIOD * (NUM_TESTS * (WAIT_CYCLES + 2) + 1000));
        $display("ERROR: Testbench timeout at time %0t", $time);
        $fatal(1);
    end

    initial begin
        $dumpfile("tb_butterfly.vcd");
        $dumpvars(0, test_tb_butterfly);
        $dumpvars(1, butterfly_new);
        $dumpvars(1, butterfly_old_inst);
    end

endmodule