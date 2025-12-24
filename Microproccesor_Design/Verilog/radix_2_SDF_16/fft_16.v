module fft_16_top #(
    parameter WIDTH = 32,
    parameter N = 16
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

// Internal signals between stages
wire stage1_output_en;
wire [WIDTH-1:0] stage1_output_real;
wire [WIDTH-1:0] stage1_output_imag;

wire stage2_output_en;
wire [WIDTH-1:0] stage2_output_real;
wire [WIDTH-1:0] stage2_output_imag;

wire stage3_output_en;
wire [WIDTH-1:0] stage3_output_real;
wire [WIDTH-1:0] stage3_output_imag;

// Stage 1: STAGE_NUM = 1
SdfUnit2 #(
    .WIDTH(WIDTH),
    .STAGE_NUM(1),
    .N(N)
) stage1 (
    .clock(clock),
    .reset(reset),
    .input_en(input_en),
    .input_real(input_real),
    .input_imag(input_imag),
    .output_en(stage1_output_en),
    .output_real(stage1_output_real),
    .output_imag(stage1_output_imag)
);

// Stage 2: STAGE_NUM = 2
SdfUnit2 #(
    .WIDTH(WIDTH),
    .STAGE_NUM(2),
    .N(N)
) stage2 (
    .clock(clock),
    .reset(reset),
    .input_en(stage1_output_en),
    .input_real(stage1_output_real),
    .input_imag(stage1_output_imag),
    .output_en(stage2_output_en),
    .output_real(stage2_output_real),
    .output_imag(stage2_output_imag)
);

// Stage 3: STAGE_NUM = 3
SdfUnit2 #(
    .WIDTH(WIDTH),
    .STAGE_NUM(3),
    .N(N)
) stage3 (
    .clock(clock),
    .reset(reset),
    .input_en(stage2_output_en),
    .input_real(stage2_output_real),
    .input_imag(stage2_output_imag),
    .output_en(stage3_output_en),
    .output_real(stage3_output_real),
    .output_imag(stage3_output_imag)
);

// Stage 4: STAGE_NUM = 4
SdfUnit2 #(
    .WIDTH(WIDTH),
    .STAGE_NUM(4),
    .N(N)
) stage4 (
    .clock(clock),
    .reset(reset),
    .input_en(stage3_output_en),
    .input_real(stage3_output_real),
    .input_imag(stage3_output_imag),
    .output_en(output_en),
    .output_real(output_real),
    .output_imag(output_imag)
);

endmodule