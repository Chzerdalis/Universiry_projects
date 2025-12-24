`timescale 1ns/1ps

module tb_stageunit;

    parameter WIDTH = 32;
    parameter STAGE_NUM = 2;
    parameter Num_of_samples = 16;

    reg clock;
    reg reset;
    reg input_en;
    reg [WIDTH-1:0] input_real_0, input_real_1, input_real_2, input_real_3;
    reg [WIDTH-1:0] input_imag_0, input_imag_1, input_imag_2, input_imag_3;
    wire output_en;
    wire [WIDTH-1:0] output_real_0, output_real_1, output_real_2, output_real_3;
    wire [WIDTH-1:0] output_imag_0, output_imag_1, output_imag_2, output_imag_3;

    reg [WIDTH-1:0] inputs_real [0:Num_of_samples - 1];
    reg [WIDTH-1:0] inputs_imag [0:Num_of_samples - 1];

    SdfUnit4 #(
        .WIDTH(WIDTH),
        .STAGE_NUM(STAGE_NUM),
        .Num_of_samples(Num_of_samples)
    ) uut (
        .clock(clock),
        .reset(reset),
        .input_en(input_en),
        .input_real_0(input_real_0),
        .input_real_1(input_real_1),
        .input_real_2(input_real_2),
        .input_real_3(input_real_3),
        .input_imag_0(input_imag_0),
        .input_imag_1(input_imag_1),
        .input_imag_2(input_imag_2),
        .input_imag_3(input_imag_3),
        .output_en(output_en),
        .output_real_0(output_real_0),
        .output_real_1(output_real_1),
        .output_real_2(output_real_2),
        .output_real_3(output_real_3),
        .output_imag_0(output_imag_0),
        .output_imag_1(output_imag_1),
        .output_imag_2(output_imag_2),
        .output_imag_3(output_imag_3)
    );

    integer i;

    initial begin
        // Initialize clock
        clock = 0;
        forever #5 clock = ~clock; // 10 time units clock period
    end

    initial begin
        // Initialize inputs
        for (i = 0; i < 16; i = i + 1) begin
            inputs_real[i] = 2*i + 1;
            inputs_imag[i] = 2*i;
        end

        // Apply reset
        reset = 1;
        #10;
        @ (posedge clock);
        reset = 0;

        // Enable input
        input_en = 1;
        for (i = 0; i < 16; i = i + 4) begin
            input_real_0 <= inputs_real[i];
            input_imag_0 <= inputs_imag[i];
            input_real_1 <= inputs_real[i + 1];
            input_imag_1 <= inputs_imag[i + 1];
            input_real_2 <= inputs_real[i + 2];
            input_imag_2 <= inputs_imag[i + 2];
            input_real_3 <= inputs_real[i + 3];
            input_imag_3 <= inputs_imag[i + 3];
            #10;
        end
        input_en = 0;

        // Wait for output
        wait(!output_en);
        #150;

        // Disable input
        $finish;
    end
    initial begin
        $dumpfile("tb_stageunit.vcd");
        $dumpvars(0, tb_stageunit);
        if(STAGE_NUM > 1) begin
            for(i=0; i<4; i=i+1) begin
                $dumpvars(2, tb_stageunit.uut.db0.buf_re[i]);
                $dumpvars(2, tb_stageunit.uut.db0.buf_im[i]);
                // $dumpvars(0, tb_stageunit.uut.db0);
                // $dumpvars(0, tb_stageunit.uut.db0);
                $dumpvars(2, tb_stageunit.uut.db1.buf_re[i]);
                $dumpvars(2, tb_stageunit.uut.db1.buf_im[i]);
                // $dumpvars(0, tb_stageunit.uut.db2);
                // $dumpvars(0, tb_stageunit.uut.db2);
                // $dumpvars(0, tb_stageunit.uut.db3);
                // $dumpvars(0, tb_stageunit.uut.db3);
            end
            for(i=0; i<3; i=i+1) begin
                $dumpvars(2, tb_stageunit.uut.db3.buf_re[i]);
                $dumpvars(2, tb_stageunit.uut.db3.buf_im[i]);
            end
        end
    end

endmodule