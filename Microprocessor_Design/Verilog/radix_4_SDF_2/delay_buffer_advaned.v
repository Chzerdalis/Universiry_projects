`timescale 1ns / 1ps

module DelayBuffer_first #(
    parameter   DEPTH = 16,
    parameter   WIDTH = 32
)(
    input               clock,
    input               reset,
    input               enable_write,
    input               enable_read_first,
    input               enable_read_last,
    input               rotate,
    input   [WIDTH-1:0] input_real_0, input_real_1, input_real_2, input_real_3,
    input   [WIDTH-1:0] input_imag_0, input_imag_1, input_imag_2, input_imag_3,
    output  [WIDTH-1:0] out_real, 
    output  [WIDTH-1:0] out_imag   
);

localparam d = DEPTH / 4;

reg [WIDTH-1:0] buf_re_temp[0:DEPTH/2 - 1];
reg [WIDTH-1:0] buf_im_temp[0:DEPTH/2 - 1];

reg [WIDTH-1:0] buf_re[0:DEPTH - 1];
reg [WIDTH-1:0] buf_im[0:DEPTH - 1];

integer n;

always @(posedge clock or posedge reset) begin

    if(reset) begin
        for (n=0; n < DEPTH; n = n + 1) begin
            buf_re[n] <= 0;
            buf_im[n] <= 0;
        end
        for (n = 0; n < DEPTH/2 - 1; n = n + 1) begin
            buf_re_temp[n] <= 0;
            buf_im_temp[n] <= 0;
        end

    end else if (enable_write) begin

        for (n = DEPTH/2-1; n > 0; n = n - 1) begin
            buf_re_temp[n] <= buf_re_temp[n-1];
            buf_im_temp[n] <= buf_im_temp[n-1];
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
        
        //This part of the buffer is not used do it can be rewriten
        buf_re[0] <= input_real_3;
        buf_im[0] <= input_imag_3;
        buf_im[d] <= input_imag_2;
        buf_re[d] <= input_real_2;
        //This part must be preserved so we write to a temporary register
        buf_re_temp[0] <= input_real_1;
        buf_im_temp[0] <= input_imag_1;
        buf_re_temp[d] <= input_real_0;
        buf_im_temp[d] <= input_imag_0;

        if(enable_read_first) begin
            for (n = DEPTH-1; n > DEPTH/2-1; n = n - 1) begin
                buf_re[n] <= buf_re[n-1];
                buf_im[n] <= buf_im[n-1];
            end
        end

    end else if (enable_read_first) begin

        for (n = DEPTH-1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end

    end else if (enable_read_last) begin

        for (n = DEPTH-1; n > DEPTH/2 - 1; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
    end

    if (rotate) begin
        for (n = 0; n < DEPTH/2; n = n + 1) begin
            buf_re[DEPTH/2 + n] <= buf_re_temp[n];
            buf_im[DEPTH/2 + n] <= buf_im_temp[n];
        end
    end 
end

assign  out_real = buf_re[DEPTH-1];
assign  out_imag = buf_im[DEPTH-1];

endmodule

module DelayBuffer_second #(
    parameter   DEPTH = 16,
    parameter   WIDTH = 32
)(
    input               clock,
    input               reset,
    input               enable_write,
    input               enable_read_first,
    input               enable_read_last,
    input               rotate,
    input   [WIDTH-1:0] input_real_0, input_real_1, input_real_2, input_real_3,
    input   [WIDTH-1:0] input_imag_0, input_imag_1, input_imag_2, input_imag_3,
    output  [WIDTH-1:0] out_real, 
    output  [WIDTH-1:0] out_imag   
);

localparam d = DEPTH / 4;

reg [WIDTH-1:0] buf_re_temp[0:DEPTH/4 - 1];
reg [WIDTH-1:0] buf_im_temp[0:DEPTH/4 - 1];

reg [WIDTH-1:0] buf_re[0:DEPTH - 1];
reg [WIDTH-1:0] buf_im[0:DEPTH - 1];

integer n;

always @(posedge clock or posedge reset) begin

    if(reset) begin
        for (n=0; n < DEPTH; n = n + 1) begin
            buf_re[n] <= 0;
            buf_im[n] <= 0;
        end
        for (n = 0; n < DEPTH/4 - 1; n = n + 1) begin
            buf_re_temp[n] <= 0;
            buf_im_temp[n] <= 0;
        end

    end else if (enable_write) begin

        for (n = DEPTH/4-1; n > 0; n = n - 1) begin
            buf_re_temp[n] <= buf_re_temp[n-1];
            buf_im_temp[n] <= buf_im_temp[n-1];
        end
        for (n = 3*DEPTH/4-1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
        
        //This part of the buffer is not used do it can be rewriten
        buf_re[0] <= input_real_3;
        buf_im[0] <= input_imag_3;
        buf_im[d] <= input_imag_2;
        buf_re[d] <= input_real_2;
        buf_im[2*d] <= input_imag_1;
        buf_re[2*d] <= input_real_1;
        //This part must be preserved so we write to a temporary register
        buf_re_temp[0] <= input_real_0;
        buf_im_temp[0] <= input_imag_0;

        if(enable_read_first) begin
            for (n = DEPTH-1; n > 3*DEPTH/4-1; n = n - 1) begin
                buf_re[n] <= buf_re[n-1];
                buf_im[n] <= buf_im[n-1];
            end
        end

    end else if (enable_read_first) begin

        for (n = DEPTH-1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end

    end else if (enable_read_last) begin

        for (n = DEPTH-1; n > 3*DEPTH/4 - 1; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
    end

    if (rotate) begin
        for (n = 0; n < DEPTH/4; n = n + 1) begin
            buf_re[3*DEPTH/4 + n] <= buf_re_temp[n];
            buf_im[3*DEPTH/4 + n] <= buf_im_temp[n];
        end
    end 
end

assign  out_real = buf_re[DEPTH-1];
assign  out_imag = buf_im[DEPTH-1];

endmodule

module DelayBuffer_third #(
    parameter   DEPTH = 16,
    parameter   WIDTH = 32
)(
    input               clock,
    input               reset,
    input               enable_write,
    input               enable_read,
    input   [WIDTH-1:0] input_real_0, input_real_1, input_real_2, input_real_3,
    input   [WIDTH-1:0] input_imag_0, input_imag_1, input_imag_2, input_imag_3,
    output  [WIDTH-1:0] out_real, 
    output  [WIDTH-1:0] out_imag   
);

localparam d = DEPTH / 4;

reg [WIDTH-1:0] buf_re[0:DEPTH - 1];
reg [WIDTH-1:0] buf_im[0:DEPTH - 1];

integer n;

always @(posedge clock or posedge reset) begin

    if(reset) begin

        for (n=0; n < DEPTH; n = n + 1) begin
            buf_re[n] <= 0;
            buf_im[n] <= 0;
        end

    end else if (enable_write) begin

        for (n = DEPTH - 1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
        
        //This part of the buffer is not used do it can be rewriten
        buf_re[0] <= input_real_3;
        buf_im[0] <= input_imag_3;
        buf_re[d] <= input_real_2;
        buf_im[d] <= input_imag_2;
        buf_re[2*d] <= input_real_1;
        buf_im[2*d] <= input_imag_1;
        buf_re[3*d] <= input_real_0;
        buf_im[3*d] <= input_imag_0;

    end else if (enable_read) begin

        for (n = DEPTH-1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
       
    end
end

assign  out_real = buf_re[DEPTH-1];
assign  out_imag = buf_im[DEPTH-1];

endmodule

module DelayBuffer_fourth #(
    parameter   DEPTH = 16,
    parameter   WIDTH = 32
)(
    input               clock,
    input               reset,
    input               enable_write,
    input               enable_read,
    input   [WIDTH-1:0] input_real_1, input_real_2, input_real_3,
    input   [WIDTH-1:0] input_imag_1, input_imag_2, input_imag_3,
    output  [WIDTH-1:0] out_real, 
    output  [WIDTH-1:0] out_imag   
);

localparam d = DEPTH / 4;

reg [WIDTH-1:0] buf_re[0:3*DEPTH/4 - 1];
reg [WIDTH-1:0] buf_im[0:3*DEPTH/4 - 1];

integer n;

always @(posedge clock or posedge reset) begin

    if(reset) begin

        for (n=0; n < 3*DEPTH/4; n = n + 1) begin
            buf_re[n] <= 0;
            buf_im[n] <= 0;
        end

    end else if (enable_write) begin

        for (n = 3*DEPTH/4 - 1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
        
        //This part of the buffer is not used do it can be rewriten
        buf_re[0] <= input_real_3;
        buf_im[0] <= input_imag_3;
        buf_re[d] <= input_real_2;
        buf_im[d] <= input_imag_2;
        buf_re[2*d] <= input_real_1;
        buf_im[2*d] <= input_imag_1;

    end else if (enable_read) begin

        for (n = 3*DEPTH/4-1; n > 0; n = n - 1) begin
            buf_re[n] <= buf_re[n-1];
            buf_im[n] <= buf_im[n-1];
        end
       
    end
end

assign  out_real = buf_re[3*DEPTH/4-1];
assign  out_imag = buf_im[3*DEPTH/4-1];

endmodule