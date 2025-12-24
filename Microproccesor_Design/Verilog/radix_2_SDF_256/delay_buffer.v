module DelayBuffer #(
    parameter   DEPTH = 32,
    parameter   WIDTH = 32
)(
    input               clock,  
    input   [WIDTH-1:0] input_real,  
    input   [WIDTH-1:0] input_imag,  
    output  [WIDTH-1:0] out_real, 
    output  [WIDTH-1:0] out_imag   
);

reg [WIDTH-1:0] buf_re[0:DEPTH-1];
reg [WIDTH-1:0] buf_im[0:DEPTH-1];
integer n;

always @(posedge clock) begin
    for (n = DEPTH-1; n > 0; n = n - 1) begin
        buf_re[n] <= buf_re[n-1];
        buf_im[n] <= buf_im[n-1];
    end
    buf_re[0] <= input_real;
    buf_im[0] <= input_imag; 
end

assign  out_real = buf_re[DEPTH-1];
assign  out_imag = buf_im[DEPTH-1];

endmodule