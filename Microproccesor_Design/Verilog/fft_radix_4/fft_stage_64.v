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
    wire signed [31:0] data_real_out [0:63], data_imag_out [0:63];

    genvar g, i;
    generate
        for (i = 0; i < 64; i = i + 1) begin
            assign data_real_in[i]  = $signed(data_real_in_flat[32*i +: 32]);
            assign data_real_out_flat[32*i +: 32] = data_real_out[i];
            assign data_imag_out_flat[32*i +: 32] = data_imag_out[i];
        end
    endgenerate

    wire signed [31:0] s1_real [0:63], s1_imag [0:63];
    wire signed [31:0] s2_real [0:63], s2_imag [0:63];

    reg signed [15:0] w_real [0:63];
    reg signed [15:0] w_imag [0:63];

    reg signed [31:0] data_real_in_reg [0:63];
    reg signed [31:0] s1_real_reg [0:63], s1_imag_reg [0:63];
    reg signed [31:0] s2_real_reg [0:63], s2_imag_reg [0:63];

    reg done_1, done_2, done_3;

    integer j;

    initial begin
        `include "f_twiddle_64.vh"
    end

    generate
        for (i = 0; i < 16; i = i + 1) begin : stage1
            localparam integer idx = 4 * i;
            butterfly_radix4_real_no_twiddle b (
                data_real_in_reg[idx],
                data_real_in_reg[idx + 1],
                data_real_in_reg[idx + 2],
                data_real_in_reg[idx + 3],

                s1_real[idx], s1_imag[idx],
                s1_real[idx + 1], s1_imag[idx + 1],
                s1_real[idx + 2], s1_imag[idx + 2],
                s1_real[idx + 3], s1_imag[idx + 3]
            );
        end
    endgenerate

    generate
        for (g = 0; g < 4; g = g + 1) begin : stage2_group
            for (i = 0; i < 4; i = i + 1) begin : stage2_inner
                localparam integer idx = 16 * g + i;
                butterfly_radix4 b (
                    s1_real_reg[idx], s1_imag_reg[idx],
                    s1_real_reg[idx + 4], s1_imag_reg[idx + 4],
                    s1_real_reg[idx + 8], s1_imag_reg[idx + 8],
                    s1_real_reg[idx + 12], s1_imag_reg[idx + 12],

                    w_real[4*i], w_imag[4*i],
                    w_real[8*i], w_imag[8*i],
                    w_real[12*i], w_imag[12*i],

                    s2_real[idx], s2_imag[idx],
                    s2_real[idx + 4], s2_imag[idx + 4],
                    s2_real[idx + 8], s2_imag[idx + 8],
                    s2_real[idx + 12], s2_imag[idx + 12]
                );
            end
        end
    endgenerate

    generate
        for (i = 0; i < 16; i = i + 1) begin : stage3
            butterfly_radix4 b (
                s2_real_reg[i], s2_imag_reg[i],
                s2_real_reg[i+16], s2_imag_reg[i+16],
                s2_real_reg[i+32], s2_imag_reg[i+32],
                s2_real_reg[i+48], s2_imag_reg[i+48],

                w_real[i], w_imag[i],
                w_real[2*i], w_imag[2*i],
                w_real[3*i], w_imag[3*i],

                data_real_out[i], data_imag_out[i],
                data_real_out[i+16], data_imag_out[i+16],
                data_real_out[i+32], data_imag_out[i+32],
                data_real_out[i+48], data_imag_out[i+48]
            );
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (j = 0; j < 64; j = j + 1) begin
                data_real_in_reg[j] <= 32'h0;
                s1_real_reg[j] <= 32'h0;
                s1_imag_reg[j] <= 32'h0;
                s2_real_reg[j] <= 32'h0;
                s2_imag_reg[j] <= 32'h0;
                done_1 <= 1'b0;
                done_2 <= 1'b0;
                done_3 <= 1'b0;
                done <= 1'b0;
            end
        end else begin
            for (j = 0; j < 64; j = j + 1) begin
                data_real_in_reg[j] <= data_real_in[j];
                s1_real_reg[j] <= s1_real[j];
                s1_imag_reg[j] <= s1_imag[j];
                s2_real_reg[j] <= s2_real[j];
                s2_imag_reg[j] <= s2_imag[j];
                done_1 <= ready;
                done_2 <= done_1;
                done_3 <= done_2;
                done <= done_3;
            end
        end
    end

endmodule