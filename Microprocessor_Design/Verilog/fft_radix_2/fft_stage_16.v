`timescale 1ns/1ps

// fft_stage_16.v
module fft_stage_16 (
    input  signed [511:0] data_real_in_flat,
    output signed [511:0] data_real_out_flat,
    output signed [511:0] data_imag_out_flat,
    input  clk,
    input  rst,
    input  ready,
    output reg done
);
    wire signed [31:0] data_real_in [0:15];
    wire signed [31:0] data_real_out [0:15];
    wire signed [31:0] data_imag_out [0:15];

    genvar g, i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            assign data_real_in[i] = $signed(data_real_in_flat[32*i +: 32]);
            assign data_real_out_flat[32*i +: 32] = data_real_out[i];
            assign data_imag_out_flat[32*i +: 32] = data_imag_out[i];
        end
    endgenerate

    wire signed [31:0] s1_real [0:15];
    wire signed [31:0] s2_real [0:15], s2_imag [0:15];
    wire signed [31:0] s3_real [0:15], s3_imag [0:15];

    reg signed [15:0] w_real [0:15];
    reg signed [15:0] w_imag [0:15];

    reg signed [31:0] data_real_in_reg [0:15];
    reg signed [31:0] s1_real_reg [0:15];
    reg signed [31:0] s2_real_reg [0:15], s2_imag_reg [0:15];
    reg signed [31:0] s3_real_reg [0:15], s3_imag_reg [0:15];

    reg done_1, done_2, done_3;

    integer j;

    initial begin
        `include "f_twiddle_16.vh"
    end

    // Stage 1: distance = 1, stride = 2 (no twiddles)
    generate
        for (i = 0; i < 8; i = i + 1) begin : stage1
            localparam integer idx = 2 * i;
            butterfly_real_no_twiddle b (
                data_real_in_reg[idx], data_real_in_reg[idx + 1],
                s1_real[idx], s1_real[idx + 1]
            );
        end
    endgenerate

    // Stage 2: distance = 2, stride = 4
    generate
        for (g = 0; g < 4; g = g + 1) begin : stage2_group
            for (i = 0; i < 2; i = i + 1) begin : stage2_inner
                localparam integer idx = 4 * g + i;
                butterfly_real b (
                    s1_real_reg[idx],
                    s1_real_reg[idx + 2],
                    w_real[(idx % 2) * 4], w_imag[(idx % 2) * 4],
                    s2_real[idx], s2_imag[idx],
                    s2_real[idx + 2], s2_imag[idx + 2]
                );
            end
        end
    endgenerate

    // Stage 3: distance = 4, stride = 8
    generate
        for (g = 0; g < 2; g = g + 1) begin : stage3_group
            for (i = 0; i < 4; i = i + 1) begin : stage3_inner
                localparam integer idx = 8 * g + i;
                butterfly b (
                    s2_real_reg[idx], s2_imag_reg[idx],
                    s2_real_reg[idx + 4], s2_imag_reg[idx + 4],
                    w_real[(idx % 4) * 2], w_imag[(idx % 4) * 2],
                    s3_real[idx], s3_imag[idx],
                    s3_real[idx + 4], s3_imag[idx + 4]
                );
            end
        end
    endgenerate

    // Stage 4: distance = 8, stride = 16
    generate
        for (i = 0; i < 8; i = i + 1) begin : stage4
            butterfly b (
                s3_real_reg[i], s3_imag_reg[i],
                s3_real_reg[i + 8], s3_imag_reg[i + 8],
                w_real[i], w_imag[i],
                data_real_out[i], data_imag_out[i],
                data_real_out[i + 8], data_imag_out[i + 8]
            );
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (j = 0; j < 16; j = j + 1) begin
                data_real_in_reg[j] <= 32'h0;
                s1_real_reg[j] <= 32'h0;
                s2_real_reg[j] <= 32'h0;
                s2_imag_reg[j] <= 32'h0;
                s3_real_reg[j] <= 32'h0;
                s3_imag_reg[j] <= 32'h0;
                done_1 <= 0;
                done_2 <= 0;
                done_3 <= 0;
                done <= 0;
            end
        end else begin
            for (j = 0; j < 16; j = j + 1) begin
                data_real_in_reg[j] <= data_real_in[j];
                s1_real_reg[j] <= s1_real[j];
                s2_real_reg[j] <= s2_real[j];
                s2_imag_reg[j] <= s2_imag[j];
                s3_real_reg[j] <= s3_real[j];
                s3_imag_reg[j] <= s3_imag[j];
                done_1 <= ready;
                done_2 <= done_1;   
                done_3 <= done_2;
                done <= done_3;
            end
        end
    end
endmodule