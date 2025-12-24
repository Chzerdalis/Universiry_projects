module fft_top #(
    parameter WIDTH = 32,
    parameter N = 256
)(
    input                   clock,
    input                   reset,
    input                   input_en,
    input       [WIDTH-1:0] input_real,
    input       [WIDTH-1:0] input_imag,
    output                  output_en,
    output      [WIDTH-1:0] output_real,
    output      [WIDTH-1:0] output_imag
);
    localparam STAGE_NUM = $clog2(N)/$clog2(4); // For radix-4 FFT

    wire [WIDTH-1:0] input_real_stage [0:STAGE_NUM-1];
    wire [WIDTH-1:0] input_imag_stage [0:STAGE_NUM-1];
    wire [WIDTH-1:0] stage_output_real [0:STAGE_NUM-1];
    wire [WIDTH-1:0] stage_output_imag [0:STAGE_NUM-1];
    wire enable_stage [0:STAGE_NUM];

    assign input_real_stage[0] = input_real;
    assign input_imag_stage[0] = input_imag;
    assign enable_stage[0] = input_en;
    assign output_en = enable_stage[STAGE_NUM];
    assign output_real = stage_output_real[STAGE_NUM-1];
    assign output_imag = stage_output_imag[STAGE_NUM-1];

    genvar i;
    generate
        for (i = 0; i < STAGE_NUM; i = i + 1) begin : gen_stages
            SdfUnit4 #(
                .WIDTH(WIDTH),
                .STAGE_NUM(i + 1),
                .Num_of_samples(N)
            ) stage_inst (
                .clock(clock),
                .reset(reset),
                .input_en(enable_stage[i]),
                .input_real(input_real_stage[i]),
                .input_imag(input_imag_stage[i]),
                .output_en(enable_stage[i + 1]),
                .output_real(stage_output_real[i]),
                .output_imag(stage_output_imag[i])
            );

            if (i < STAGE_NUM - 1) begin
                assign input_real_stage[i + 1] = stage_output_real[i];
                assign input_imag_stage[i + 1] = stage_output_imag[i];
            end
        end
    endgenerate
endmodule