`timescale 1ns/1ps

module butterfly_real_no_twiddle (
    input signed [31:0] ar, br,
    output signed [31:0] out1r, out2r
);
    assign out1r = ar + br;
    assign out2r = ar - br;
endmodule

module butterfly_real (
    input signed [31:0] ar, br,
    input signed [15:0] wr, wi,
    output signed [31:0] out1r, out1i, out2r, out2i
);
    wire signed [47:0] mr = br * wr;
    wire signed [47:0] mi = br * wi;

    assign out1r = ar + mr[46:15];
    assign out1i = mi[46:15];
    assign out2r = ar - mr[46:15];
    assign out2i = -mi[46:15];
endmodule

module butterfly (
    input signed [31:0] ar, ai, br, bi,
    input signed [15:0] wr, wi,
    output signed [31:0] out1r, out1i, out2r, out2i
);
    wire signed [47:0] mr = br * wr - bi * wi;
    wire signed [47:0] mi = br * wi + bi * wr;

    assign out1r = ar + mr[46:15];
    assign out1i = ai + mi[46:15];
    assign out2r = ar - mr[46:15];
    assign out2i = ai - mi[46:15];
endmodule