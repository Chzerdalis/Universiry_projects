`timescale 1ns/1ps

module top_module #(
    parameter N = 16
) (
    input new_data,
    input wire [$clog2(N)-1:0] addr,
    input wire [31:0] data_in_real,
    input wire [31:0] data_in_imag,
    output wire [$clog2(N)-1:0] addr_out,
    output wire [31:0] data_out_real,
    output wire [31:0] data_out_imag,
    output wire valid,
    input  clk,
    input  rst
);
    wire signed [32*N-1:0] data_real_in_br;
    wire signed [32*N-1:0] data_imag_in_br;

    wire signed [32*N-1:0] data_real_in_flat;
    wire signed [32*N-1:0] data_imag_in_flat;

    wire signed [32*N-1:0] data_real_out_flat;
    wire signed [32*N-1:0] data_imag_out_flat;

    wire ready_calculate;
    wire done_calculating;
    
    function [$clog2(N)-1:0] rev;
        input [$clog2(N)-1:0] in;
        integer i;
        begin
            for (i = 0; i < $clog2(N); i = i + 2) begin
                rev[i] = in[$clog2(N)-2-i];
                rev[i+1] = in[$clog2(N)-1-i];
            end
        end
    endfunction

    //Bit-reverse the input data
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : bitrev_in
            assign data_real_in_br[32*i +: 32] = data_real_in_flat[32*rev(i) +: 32];
            assign data_imag_in_br[32*i +: 32] = data_imag_in_flat[32*rev(i) +: 32];
        end
    endgenerate
    
    //Input controller
    serial_init #(N) serial_in (
        .clk(clk),
        .rst(rst),
        .new_data(new_data),
        .addr(addr),
        .data_in_real(data_in_real),
        .data_in_imag(data_in_imag),
        .mem_out_real(data_real_in_flat),
        .mem_out_imag(data_imag_in_flat),
        .done(ready_calculate)
    );

    // FFT stage instance
    generate
        if (N == 16) begin
            fft_stage_16 fft_inst (
                .data_real_in_flat(data_real_in_br),
                .data_real_out_flat(data_real_out_flat),
                .data_imag_out_flat(data_imag_out_flat),
                .clk(clk),
                .rst(rst),
                .ready(ready_calculate),
                .done(done_calculating)
            );
        end
        else if (N == 64) begin
            fft_stage_64 fft_inst (
                .data_real_in_flat(data_real_in_br),
                .data_real_out_flat(data_real_out_flat),
                .data_imag_out_flat(data_imag_out_flat),
                .clk(clk),
                .rst(rst),
                .ready(ready_calculate),
                .done(done_calculating)
            );
        end
    endgenerate

    // Serial output controller
    serial_output #(N) serial_out (
        .clk(clk),
        .rst(rst),
        .start(done_calculating),
        .addr(addr_out),
        .data_out_real(data_out_real),
        .data_out_imag(data_out_imag),
        .mem_in_real(data_real_out_flat), 
        .mem_in_imag(data_imag_out_flat), 
        .valid(valid)
    );
endmodule