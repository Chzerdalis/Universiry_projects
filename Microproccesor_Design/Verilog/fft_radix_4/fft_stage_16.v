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
    wire signed [31:0] data_real_out [0:15], data_imag_out [0:15];

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            assign data_real_in[i]  = $signed(data_real_in_flat[32*i +: 32]);
            assign data_real_out_flat[32*i +: 32] = data_real_out[i];
            assign data_imag_out_flat[32*i +: 32] = data_imag_out[i];
        end
    endgenerate

    wire signed [31:0] s1_real [0:15], s1_imag [0:15];

    reg signed [15:0] w_real [0:15];
    reg signed [15:0] w_imag [0:15];

    reg signed [31:0] data_real_in_reg [0:15];
    reg signed [31:0] s1_real_reg [0:15], s1_imag_reg [0:15];

    reg done_1, done_2;

    integer j;

    initial begin
        `include "f_twiddle_16.vh"
    end

    generate
        for (i = 0; i < 4; i = i + 1) begin : stage1
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
        for (i = 0; i < 4; i = i + 1) begin : stage2
            butterfly_radix4 b (
                s1_real_reg[i], s1_imag_reg[i],
                s1_real_reg[i+4], s1_imag_reg[i+4],
                s1_real_reg[i+8], s1_imag_reg[i+8],
                s1_real_reg[i+12], s1_imag_reg[i+12],

                w_real[i], w_imag[i],
                w_real[2*i], w_imag[2*i],
                w_real[3*i], w_imag[3*i],

                data_real_out[i], data_imag_out[i],
                data_real_out[i+4], data_imag_out[i+4],
                data_real_out[i+8], data_imag_out[i+8],
                data_real_out[i+12], data_imag_out[i+12]
            );
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (j = 0; j < 16; j = j + 1) begin
                data_real_in_reg[j] <= 32'h0;
                s1_real_reg[j] <= 32'h0;
                s1_imag_reg[j] <= 32'h0;
                done_1 <= 1'b0;
                done_2 <= 1'b0;
                done <= 1'b0;
            end
        end else begin
            for (j = 0; j < 16; j = j + 1) begin
                data_real_in_reg[j] <= data_real_in[j];
                s1_real_reg[j] <= s1_real[j];
                s1_imag_reg[j] <= s1_imag[j];
                done_1 <= ready;
                done_2 <= done_1;
                done <= done_2;
            end
        end
    end

endmodule