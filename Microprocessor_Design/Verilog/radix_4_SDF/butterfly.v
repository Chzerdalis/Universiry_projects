`timescale 1ns/1ps

module butterfly_radix4 #(
    parameter WIDTH = 32
) (
    input                  clock,
    input                  reset,
    input  signed [WIDTH-1:0] ar, ai,
    input  signed [WIDTH-1:0] br, bi,
    input  signed [WIDTH-1:0] cr, ci,
    input  signed [WIDTH-1:0] dr, di,

    // Twiddle width is assumed to be WIDTH/2
    input  signed [WIDTH/2-1:0] w0r, w0i,
    input  signed [WIDTH/2-1:0] w1r, w1i,
    input  signed [WIDTH/2-1:0] w2r, w2i,

    output reg signed [WIDTH-1:0] out1r, out1i,
    output reg signed [WIDTH-1:0] out2r, out2i,
    output reg signed [WIDTH-1:0] out3r, out3i,
    output reg signed [WIDTH-1:0] out4r, out4i
);
    localparam TW = WIDTH/2;
    localparam PROD = WIDTH + TW; // product width when multiplying data*twiddle
    
    reg [WIDTH-1:0] ar_reg, ai_reg, br_reg, bi_reg, cr_reg, ci_reg, dr_reg, di_reg;
    reg [WIDTH/2-1:0] w0r_reg, w0i_reg, w1r_reg, w1i_reg, w2r_reg, w2i_reg;
    reg [WIDTH-1:0] ar_reg_0, ai_reg_0;
    reg [WIDTH-1:0] ar_reg_1, ai_reg_1;
    reg [PROD-1:0] m0r_reg, m0i_reg, m1r_reg, m1i_reg, m2r_reg, m2i_reg;
    reg [PROD-1:0] mul_m0r_reg_1, mul_m0i_reg_1, mul_m1r_reg_1, mul_m1i_reg_1, mul_m2r_reg_1, mul_m2i_reg_1;
    reg [PROD-1:0] mul_m0r_reg_2, mul_m0i_reg_2, mul_m1r_reg_2, mul_m1i_reg_2, mul_m2r_reg_2, mul_m2i_reg_2;
    reg [WIDTH-1:0] t0r_reg, t0i_reg, t1r_reg, t1i_reg, t2r_reg, t2i_reg, t3r_reg, t3i_reg;

    //Do one multimplication per clock cycle per dedicated data path
    // wire signed [PROD-1:0] mul_m0r_1 = br_reg * w0r_reg;
    // wire signed [PROD-1:0] mul_m0i_1 = br_reg * w0i_reg;
    // wire signed [PROD-1:0] mul_m1r_1 = cr_reg * w1r_reg;
    // wire signed [PROD-1:0] mul_m1i_1 = cr_reg * w1i_reg;
    // wire signed [PROD-1:0] mul_m2r_1 = dr_reg * w2r_reg;
    // wire signed [PROD-1:0] mul_m2i_1 = dr_reg * w2i_reg;

    // wire signed [PROD-1:0] mul_m0r_2 = bi_reg * w0i_reg;
    // wire signed [PROD-1:0] mul_m0i_2 = bi_reg * w0r_reg;
    // wire signed [PROD-1:0] mul_m1r_2 = ci_reg * w1i_reg;
    // wire signed [PROD-1:0] mul_m1i_2 = ci_reg * w1r_reg;
    // wire signed [PROD-1:0] mul_m2r_2 = di_reg * w2i_reg;
    // wire signed [PROD-1:0] mul_m2i_2 = di_reg * w2r_reg;

    wire signed [PROD-1:0] mul_m0r_1; 
    wire signed [PROD-1:0] mul_m0i_1;
    wire signed [PROD-1:0] mul_m1r_1;
    wire signed [PROD-1:0] mul_m1i_1;
    wire signed [PROD-1:0] mul_m2r_1;
    wire signed [PROD-1:0] mul_m2i_1;

    wire signed [PROD-1:0] mul_m0r_2;
    wire signed [PROD-1:0] mul_m0i_2;   
    wire signed [PROD-1:0] mul_m1r_2;
    wire signed [PROD-1:0] mul_m1i_2;
    wire signed [PROD-1:0] mul_m2r_2;
    wire signed [PROD-1:0] mul_m2i_2;

    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm0r (
        .clock(clock), .reset(reset),
        .A(br_reg),
        .B(w0r_reg),
        .P(mul_m0r_1)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm0i (
        .clock(clock), .reset(reset),
        .A(br_reg),
        .B(w0i_reg),
        .P(mul_m0i_1)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm1r (
        .clock(clock), .reset(reset),
        .A(cr_reg),
        .B(w1r_reg),
        .P(mul_m1r_1)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm1i (
        .clock(clock), .reset(reset),
        .A(cr_reg),
        .B(w1i_reg),
        .P(mul_m1i_1)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm2r (
        .clock(clock), .reset(reset),
        .A(dr_reg),
        .B(w2r_reg),
        .P(mul_m2r_1)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm2i (
        .clock(clock), .reset(reset),
        .A(dr_reg),
        .B(w2i_reg),
        .P(mul_m2i_1)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm0r_2 (
        .clock(clock), .reset(reset),
        .A(bi_reg),
        .B(w0i_reg),
        .P(mul_m0r_2)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm0i_2 (
        .clock(clock), .reset(reset),
        .A(bi_reg),
        .B(w0r_reg),
        .P(mul_m0i_2)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm1r_2 (
        .clock(clock), .reset(reset),
        .A(ci_reg),
        .B(w1i_reg),
        .P(mul_m1r_2)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm1i_2 (
        .clock(clock), .reset(reset),
        .A(ci_reg),
        .B(w1r_reg),
        .P(mul_m1i_2)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm2r_2 (
        .clock(clock), .reset(reset),
        .A(di_reg),
        .B(w2i_reg),
        .P(mul_m2r_2)
    );
    partial_mul #(
        .WIDTH(WIDTH),
        .PROD(PROD)
    ) pm2i_2 (
        .clock(clock), .reset(reset),
        .A(di_reg),
        .B(w2r_reg),
        .P(mul_m2i_2)
    );


    //One addition/subtraction per clock cycle per data path to find m0, m1, m2
    wire signed [PROD-1:0] m0r = mul_m0r_reg_1 - mul_m0r_reg_2;
    wire signed [PROD-1:0] m0i = mul_m0i_reg_1 + mul_m0i_reg_2;

    wire signed [PROD-1:0] m1r = mul_m1r_reg_1 - mul_m1r_reg_2;
    wire signed [PROD-1:0] m1i = mul_m1i_reg_1 + mul_m1i_reg_2;

    wire signed [PROD-1:0] m2r = mul_m2r_reg_1 - mul_m2r_reg_2;
    wire signed [PROD-1:0] m2i = mul_m2i_reg_1 + mul_m2i_reg_2;

    //One addition/subtraction per clock cycle per data path to find t0, t1, t2, t3
    wire signed [WIDTH-1:0] t0r = ar_reg_1 + m1r_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t0i = ai_reg_1 + m1i_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t1r = ar_reg_1 - m1r_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t1i = ai_reg_1 - m1i_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t2r = m0r_reg[PROD-2:TW-1] + m2r_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t2i = m0i_reg[PROD-2:TW-1] + m2i_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t3r = m0r_reg[PROD-2:TW-1] - m2r_reg[PROD-2:TW-1];
    wire signed [WIDTH-1:0] t3i = m0i_reg[PROD-2:TW-1] - m2i_reg[PROD-2:TW-1];

    // Output assignments
    wire signed [WIDTH-1:0] out1r_reg = t0r_reg + t2r_reg;
    wire signed [WIDTH-1:0] out1i_reg = t0i_reg + t2i_reg;
    wire signed [WIDTH-1:0] out2r_reg = t1r_reg + t3i_reg;
    wire signed [WIDTH-1:0] out2i_reg = t1i_reg - t3r_reg;
    wire signed [WIDTH-1:0] out3r_reg = t0r_reg - t2r_reg;
    wire signed [WIDTH-1:0] out3i_reg = t0i_reg - t2i_reg;
    wire signed [WIDTH-1:0] out4r_reg = t1r_reg - t3i_reg;
    wire signed [WIDTH-1:0] out4i_reg = t1i_reg + t3r_reg;


    always @(posedge clock or posedge reset) begin
        if (reset) begin
            //Input registers
            ar_reg <= 0; ai_reg <= 0; br_reg <= 0; bi_reg <= 0;
            cr_reg <= 0; ci_reg <= 0; dr_reg <= 0; di_reg <= 0;
            w0r_reg <= 0; w0i_reg <= 0;
            w1r_reg <= 0; w1i_reg <= 0;
            w2r_reg <= 0; w2i_reg <= 0;
            //First pipeline stage registers
            mul_m0r_reg_1 <= 0;  mul_m0i_reg_1 <= 0;
            mul_m1r_reg_1 <= 0;  mul_m1i_reg_1 <= 0;
            mul_m2r_reg_1 <= 0;  mul_m2i_reg_1 <= 0; 
            mul_m0r_reg_2 <= 0;  mul_m0i_reg_2 <= 0; 
            mul_m1r_reg_2 <= 0;  mul_m1i_reg_2 <= 0;
            mul_m2r_reg_2 <= 0;  mul_m2i_reg_2 <= 0;
            ar_reg_0 <= 0; ai_reg_0 <= 0;
            //Second pipeline stage registers
            m0i_reg <= 0; m0r_reg <= 0;
            m1i_reg <= 0; m1r_reg <= 0;
            m2i_reg <= 0; m2r_reg <= 0;
            ar_reg_1 <= 0; ai_reg_1 <= 0;
            //Third pipeline stage registers
            t0r_reg <= 0; t0i_reg <= 0;
            t1r_reg <= 0; t1i_reg <= 0;
            t2r_reg <= 0; t2i_reg <= 0;
            t3r_reg <= 0; t3i_reg <= 0;
            //Output registers
            out1r <= 0; out1i <= 0;
            out2r <= 0; out2i <= 0;
            out3r <= 0; out3i <= 0;
            out4r <= 0; out4i <= 0;
        end else begin
            ar_reg <= ar; ai_reg <= ai; br_reg <= br; bi_reg <= bi;
            cr_reg <= cr; ci_reg <= ci; dr_reg <= dr; di_reg <= di;
            w0r_reg <= w0r; w0i_reg <= w0i;
            w1r_reg <= w1r; w1i_reg <= w1i;
            w2r_reg <= w2r; w2i_reg <= w2i;

            mul_m0r_reg_1 <= mul_m0r_1; mul_m0i_reg_1 <= mul_m0i_1;
            mul_m1r_reg_1 <= mul_m1r_1; mul_m1i_reg_1 <= mul_m1i_1;
            mul_m2r_reg_1 <= mul_m2r_1; mul_m2i_reg_1 <= mul_m2i_1;
            mul_m0r_reg_2 <= mul_m0r_2; mul_m0i_reg_2 <= mul_m0i_2;
            mul_m1r_reg_2 <= mul_m1r_2; mul_m1i_reg_2 <= mul_m1i_2;
            mul_m2r_reg_2 <= mul_m2r_2; mul_m2i_reg_2 <= mul_m2i_2;
            ar_reg_0 <= ar; ai_reg_0 <= ai;

            m0i_reg <= m0i; m0r_reg <= m0r;
            m1i_reg <= m1i; m1r_reg <= m1r;
            m2i_reg <= m2i; m2r_reg <= m2r;
            ar_reg_1 <= ar_reg_0; ai_reg_1 <= ai_reg_0;

            t0r_reg <= t0r; t0i_reg <= t0i;
            t1r_reg <= t1r; t1i_reg <= t1i;
            t2r_reg <= t2r; t2i_reg <= t2i;
            t3r_reg <= t3r; t3i_reg <= t3i;

            out1r <= out1r_reg; out1i <= out1i_reg;
            out2r <= out2r_reg; out2i <= out2i_reg;
            out3r <= out3r_reg; out3i <= out3i_reg;
            out4r <= out4r_reg; out4i <= out4i_reg;
        end
    end
endmodule

