`timescale 1ns/1ps

// Radix-4 butterfly
module butterfly_radix4_real_no_twiddle (
    input  signed [31:0] ar,
    input  signed [31:0] br,
    input  signed [31:0] cr,
    input  signed [31:0] dr,

    output signed [31:0] out0r, out0i,
    output signed [31:0] out1r, out1i,
    output signed [31:0] out2r, out2i,
    output signed [31:0] out3r, out3i
);
    wire signed [31:0] t0r = ar + cr;
    wire signed [31:0] t1r = ar - cr;
    wire signed [31:0] t2r = br + dr;
    wire signed [31:0] t3r = br - dr;

    assign out0r = t0r + t2r;
    assign out0i = 0;
    assign out1r = t1r;
    assign out1i = -t3r;
    assign out2r = t0r - t2r;
    assign out2i = 0;
    assign out3r = t1r;
    assign out3i = t3r;
endmodule

module butterfly_radix4 (
    input  signed [31:0] ar, ai,
    input  signed [31:0] br, bi,
    input  signed [31:0] cr, ci,
    input  signed [31:0] dr, di,

    input  signed [15:0] w0r, w0i,
    input  signed [15:0] w1r, w1i,
    input  signed [15:0] w2r, w2i,

    output signed [31:0] out0r, out0i,
    output signed [31:0] out1r, out1i,
    output signed [31:0] out2r, out2i,
    output signed [31:0] out3r, out3i
);
    wire signed [47:0] m0r = br * w0r - bi * w0i;
    wire signed [47:0] m0i = br * w0i + bi * w0r;

    wire signed [47:0] m1r = cr * w1r - ci * w1i;
    wire signed [47:0] m1i = cr * w1i + ci * w1r;
    
    wire signed [47:0] m2r = dr * w2r - di * w2i;
    wire signed [47:0] m2i = dr * w2i + di * w2r;

    wire signed [31:0] t0r = ar + m1r[46:15];
    wire signed [31:0] t0i = ai + m1i[46:15];
    wire signed [31:0] t1r = ar - m1r[46:15];
    wire signed [31:0] t1i = ai - m1i[46:15];
    wire signed [31:0] t2r = m0r[46:15] + m2r[46:15];
    wire signed [31:0] t2i = m0i[46:15] + m2i[46:15];
    wire signed [31:0] t3r = m0r[46:15] - m2r[46:15];
    wire signed [31:0] t3i = m0i[46:15] - m2i[46:15];

    assign out0r = t0r + t2r;
    assign out0i = t0i + t2i;
    assign out1r = t1r + t3i;
    assign out1i = t1i - t3r;
    assign out2r = t0r - t2r;
    assign out2i = t0i - t2i;
    assign out3r = t1r - t3i;
    assign out3i = t1i + t3r;
endmodule

