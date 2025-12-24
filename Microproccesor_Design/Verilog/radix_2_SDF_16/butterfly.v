`timescale 1ns/1ps

module butterfly #(
    parameter   WIDTH = 32
)(
    input signed [WIDTH-1:0] ar, ai, br, bi,
    input signed [WIDTH/2-1:0] wr, wi,
    output signed [WIDTH-1:0] out1r, out1i, out2r, out2i
);
    wire signed [2*WIDTH-1:0] mr = br * wr - bi * wi;
    wire signed [2*WIDTH-1:0] mi = br * wi + bi * wr;

    assign out1r = ar + mr[WIDTH/2 + WIDTH-2 : WIDTH/2-1];
    assign out1i = ai + mi[WIDTH/2 + WIDTH-2 : WIDTH/2-1];
    assign out2r = ar - mr[WIDTH/2 + WIDTH-2 : WIDTH/2-1];
    assign out2i = ai - mi[WIDTH/2 + WIDTH-2 : WIDTH/2-1];
endmodule

// module butterfly_no_twiddle (
//     input signed [31:0] ar, ai, br, bi,
//     output signed [31:0] out1r, out1i, out2r, out2i
// );
//     assign out1r = ar + br;
//     assign out1i = ai + bi;
//     assign out2r = ar - br;
//     assign out2i = ai - bi;
// endmodule