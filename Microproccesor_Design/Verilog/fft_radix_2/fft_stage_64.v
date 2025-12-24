`timescale 1ns/1ps

// fft_stage_64.v
module fft_stage_64 (
    input  signed [2047:0] data_real_in_flat,
    output signed [2047:0] data_real_out_flat,
    output signed [2047:0] data_imag_out_flat,
    input  clk,
    input  rst,
    input  ready,
    output reg done
);
    wire signed [31:0] data_real_in [0:63];
    wire signed [31:0] data_real_out [0:63];
    wire signed [31:0] data_imag_out [0:63];

    genvar g, i;
    generate
        for (i = 0; i < 64; i = i + 1) begin
            assign data_real_in[i] = $signed(data_real_in_flat[32*i +: 32]);
            assign data_real_out_flat[32*i +: 32] = data_real_out[i];
            assign data_imag_out_flat[32*i +: 32] = data_imag_out[i];
        end
    endgenerate

    wire signed [31:0] s1_real [0:63];
    wire signed [31:0] s2_real [0:63], s2_imag [0:63];
    wire signed [31:0] s3_real [0:63], s3_imag [0:63];
    wire signed [31:0] s4_real [0:63], s4_imag [0:63];
    wire signed [31:0] s5_real [0:63], s5_imag [0:63];

    reg signed [15:0] w_real [0:63];
    reg signed [15:0] w_imag [0:63];

    reg signed [31:0] data_real_in_reg [0:63];
    reg signed [31:0] s1_real_reg [0:63];
    reg signed [31:0] s2_real_reg [0:63], s2_imag_reg [0:63];
    reg signed [31:0] s3_real_reg [0:63], s3_imag_reg [0:63];
    reg signed [31:0] s4_real_reg [0:63], s4_imag_reg [0:63];
    reg signed [31:0] s5_real_reg [0:63], s5_imag_reg [0:63];

    reg done_1, done_2, done_3, done_4, done_5;

    integer j;

    initial begin
        `include "f_twiddle_64.vh"
    end

    // Stage 1: distance = 1
    generate
        for (i = 0; i < 32; i = i + 1) begin : stage1
            localparam integer idx = 2 * i;
            butterfly_real_no_twiddle b (
                data_real_in_reg[idx], data_real_in_reg[idx + 1],
                s1_real[idx], s1_real[idx + 1]
            );
        end
    endgenerate

    // Stage 2: distance = 2
    generate
        for (g = 0; g < 16; g = g + 1) begin : stage2_group
            for (i = 0; i < 2; i = i + 1) begin : stage2_inner
                localparam integer idx = 4 * g + i;
                butterfly_real b (
                    s1_real_reg[idx],
                    s1_real_reg[idx + 2],
                    w_real[(idx % 2) * 16], w_imag[(idx % 2) * 16],
                    s2_real[idx], s2_imag[idx],
                    s2_real[idx + 2], s2_imag[idx + 2]
                );
            end
        end
    endgenerate

    // Stage 3: distance = 4
    generate
        for (g = 0; g < 8; g = g + 1) begin : stage3_group
            for (i = 0; i < 4; i = i + 1) begin : stage3_inner
                localparam integer idx = 8 * g + i;
                butterfly b (
                    s2_real_reg[idx], s2_imag_reg[idx],
                    s2_real_reg[idx + 4], s2_imag_reg[idx + 4],
                    w_real[(idx % 4) * 8], w_imag[(idx % 4) * 8],
                    s3_real[idx], s3_imag[idx],
                    s3_real[idx + 4], s3_imag[idx + 4]
                );
            end
        end
    endgenerate

    // Stage 4: distance = 8
    generate
        for (g = 0; g < 4; g = g + 1) begin : stage4_group
            for (i = 0; i < 8; i = i + 1) begin : stage4_inner
                localparam integer idx = 16 * g + i;
                butterfly b (
                    s3_real_reg[idx], s3_imag_reg[idx],
                    s3_real_reg[idx + 8], s3_imag_reg[idx + 8],
                    w_real[(idx % 8) * 4], w_imag[(idx % 8) * 4],
                    s4_real[idx], s4_imag[idx],
                    s4_real[idx + 8], s4_imag[idx + 8]
                );
            end
        end
    endgenerate

    // Stage 5: distance = 16
    generate
        for (g = 0; g < 2; g = g + 1) begin : stage5_group
            for (i = 0; i < 16; i = i + 1) begin : stage5_inner
                localparam integer idx = 32 * g + i;
                butterfly b (
                    s4_real_reg[idx], s4_imag_reg[idx],
                    s4_real_reg[idx + 16], s4_imag_reg[idx + 16],
                    w_real[(idx % 16) * 2], w_imag[(idx % 16) * 2],
                    s5_real[idx], s5_imag[idx],
                    s5_real[idx + 16], s5_imag[idx + 16]
                );
            end
        end
    endgenerate

    // Stage 6: distance = 32
    generate
        for (i = 0; i < 32; i = i + 1) begin : stage6
            butterfly b (
                s5_real_reg[i], s5_imag_reg[i],
                s5_real_reg[i + 32], s5_imag_reg[i + 32],
                w_real[i], w_imag[i],
                data_real_out[i], data_imag_out[i],
                data_real_out[i + 32], data_imag_out[i + 32]
            );
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (j = 0; j < 64; j = j + 1) begin
                data_real_in_reg[j] <= 32'h0;
                s1_real_reg[j] <= 32'h0;
                s2_real_reg[j] <= 32'h0;
                s2_imag_reg[j] <= 32'h0;
                s3_real_reg[j] <= 32'h0;
                s3_imag_reg[j] <= 32'h0;
                s4_real_reg[j] <= 32'h0;
                s4_imag_reg[j] <= 32'h0;
                s5_real_reg[j] <= 32'h0;
                s5_imag_reg[j] <= 32'h0;
                done_1 <= 0;
                done_2 <= 0;
                done_3 <= 0;
                done_4 <= 0;
                done_5 <= 0;
                done <= 0;
            end
        end else begin
            for (j = 0; j < 64; j = j + 1) begin
                data_real_in_reg[j] <= data_real_in[j];
                s1_real_reg[j] <= s1_real[j];
                s2_real_reg[j] <= s2_real[j];
                s2_imag_reg[j] <= s2_imag[j];
                s3_real_reg[j] <= s3_real[j];
                s3_imag_reg[j] <= s3_imag[j];
                s4_real_reg[j] <= s4_real[j];
                s4_imag_reg[j] <= s4_imag[j];
                s5_real_reg[j] <= s5_real[j];
                s5_imag_reg[j] <= s5_imag[j];
                done_1 <= ready;
                done_2 <= done_1;   
                done_3 <= done_2;
                done_4 <= done_3;
                done_5 <= done_4;
                done <= done_5;
                //done <= done_6;
            end
        end
    end
endmodule