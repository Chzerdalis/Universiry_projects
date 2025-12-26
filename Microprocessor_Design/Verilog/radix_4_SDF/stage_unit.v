module SdfUnit4 #(
    parameter WIDTH = 32, // Data Bit Lenght
    parameter STAGE_NUM = 1, //Butterfly Stage
    parameter Num_of_samples = 16 //How many inputs
)(
    input                   clock,  //  Master Clock
    input                   reset,  //  Active High Asynchronous Reset
    input                   input_en,  //  Input Data Enable
    input       [WIDTH-1:0] input_real,  //  Input Data (Real)
    input       [WIDTH-1:0] input_imag,  //  Input Data (Imag)
    output  reg             output_en,  //  Output Data Enable
    output  reg [WIDTH-1:0] output_real,  //  Output Data (Real)
    output  reg [WIDTH-1:0] output_imag   //  Output Data (Imag)
);

localparam sn = 2*STAGE_NUM;
localparam Depth = 1 << (2*(STAGE_NUM - 1));
localparam Stride = 1 << (2*STAGE_NUM); 

reg [sn-1:0] butterfly_en;
reg [sn-1:0] flush_count;
reg start_out;

wire [$clog2(Num_of_samples)-1:0] twiddle_index_0, twiddle_index_1, twiddle_index_2;

wire en_buff_0, en_buff_1, en_buff_2;

wire [WIDTH-1:0] x0_re, x0_im, y0_re, y0_im;
wire [WIDTH-1:0] x1_re, x1_im, y1_re, y1_im;
wire [WIDTH-1:0] x2_re, x2_im, y2_re, y2_im;
wire [WIDTH-1:0] x3_re, x3_im, y3_re, y3_im;

wire [WIDTH-1:0] delay_in_real_0, delay_in_imag_0;
wire [WIDTH-1:0] delay_in_real_1, delay_in_imag_1;
wire [WIDTH-1:0] delay_in_real_2, delay_in_imag_2;

wire [WIDTH-1:0] delay_out_real_0, delay_out_imag_0;
wire [WIDTH-1:0] delay_out_real_1, delay_out_imag_1;
wire [WIDTH-1:0] delay_out_real_2, delay_out_imag_2;

wire [WIDTH-1:0] output_real_reg, output_imag_reg;

reg [WIDTH/2 - 1:0] w_real [0:Num_of_samples-1];
reg [WIDTH/2 - 1:0] w_imag [0:Num_of_samples-1];


initial begin
    `include "f_twiddle_16.vh"
end

always @(posedge clock or posedge reset) begin
    if (reset) begin
        butterfly_en <= 1'b0;
        flush_count <= 0;
    end else begin
        if(input_en) begin
            butterfly_en <= butterfly_en + 1'b1;
            flush_count <= 3*Depth;
        end else begin
            if (flush_count == 0) begin
                flush_count <= 0;
                butterfly_en <= 1'b0;
            end else begin
                flush_count <= flush_count - 1'b1;
                butterfly_en <= butterfly_en + 1'b1;
            end
        end
    end
end

assign twiddle_index_0 = (STAGE_NUM == 1) ? 3'b0 : (butterfly_en[sn-3:0] * (Num_of_samples/Stride));
assign twiddle_index_1 = (STAGE_NUM == 1) ? 3'b0 : (butterfly_en[sn-3:0] * (Num_of_samples/Stride) * 2);
assign twiddle_index_2 = (STAGE_NUM == 1) ? 3'b0 : (butterfly_en[sn-3:0] * (Num_of_samples/Stride) * 3);

assign x0_re = (butterfly_en[sn-1:sn-2] == 2'b11) ? delay_out_real_0 : {WIDTH{1'bx}};
assign x0_im = (butterfly_en[sn-1:sn-2] == 2'b11) ? delay_out_imag_0 : {WIDTH{1'bx}};

assign x1_re = (butterfly_en[sn-1:sn-2] == 2'b11) ? delay_out_real_1 : {WIDTH{1'bx}};
assign x1_im = (butterfly_en[sn-1:sn-2] == 2'b11) ? delay_out_imag_1 : {WIDTH{1'bx}};

assign x2_re = (butterfly_en[sn-1:sn-2] == 2'b11) ? delay_out_real_2 : {WIDTH{1'bx}};
assign x2_im = (butterfly_en[sn-1:sn-2] == 2'b11) ? delay_out_imag_2 : {WIDTH{1'bx}};

assign x3_re = (butterfly_en[sn-1:sn-2] == 2'b11) ? input_real : {WIDTH{1'bx}};
assign x3_im = (butterfly_en[sn-1:sn-2] == 2'b11) ? input_imag : {WIDTH{1'bx}};

butterfly_radix4 #(
    .WIDTH(WIDTH)
) b4 (
    .clock(clock), .reset(reset),
    .ar(x0_re), .ai(x0_im),
    .br(x1_re), .bi(x1_im),
    .cr(x2_re), .ci(x2_im),
    .dr(x3_re), .di(x3_im),
    .w0r(w_real[twiddle_index_0]), .w0i(w_imag[twiddle_index_0]),
    .w1r(w_real[twiddle_index_1]), .w1i(w_imag[twiddle_index_1]),
    .w2r(w_real[twiddle_index_2]), .w2i(w_imag[twiddle_index_2]),
    .out1r(y0_re), .out1i(y0_im),
    .out2r(y1_re), .out2i(y1_im),
    .out3r(y2_re), .out3i(y2_im),
    .out4r(y3_re), .out4i(y3_im)
);

DelayBuffer #(
    .DEPTH(Depth),
    .WIDTH(WIDTH)
) db0 (
    .clock(clock),
    .enable(en_buff_0),
    .input_real(delay_in_real_0),
    .input_imag(delay_in_imag_0),
    .out_real(delay_out_real_0),
    .out_imag(delay_out_imag_0)
);

DelayBuffer #(
    .DEPTH(Depth),
    .WIDTH(WIDTH)
) db1 (
    .clock(clock),
    .enable(en_buff_1),
    .input_real(delay_in_real_1),
    .input_imag(delay_in_imag_1),
    .out_real(delay_out_real_1),
    .out_imag(delay_out_imag_1)
);

DelayBuffer #(
    .DEPTH(Depth),
    .WIDTH(WIDTH)
) db2 (
    .clock(clock),
    .enable(en_buff_2),
    .input_real(delay_in_real_2),
    .input_imag(delay_in_imag_2),
    .out_real(delay_out_real_2),
    .out_imag(delay_out_imag_2)
);

// In every stage we need to buffer the input in its corresponding buffer and
// take the output from the correct buffer depending on the butterfly_en state.
// Use continuous assigns instead of an always block for combinational logic.
wire [1:0] sel = butterfly_en[sn-1:sn-2];

assign en_buff_0 = (sel == 2'b11) || (sel == 2'b00);
assign en_buff_1 = (sel == 2'b11) || (sel == 2'b01);
assign en_buff_2 = (sel == 2'b11) || (sel == 2'b10);

assign delay_in_real_0 = (sel == 2'b11) ? y1_re : 
                         (sel == 2'b00) ? input_real : {WIDTH{1'b0}};
assign delay_in_imag_0 = (sel == 2'b11) ? y1_im :
                         (sel == 2'b00) ? input_imag : {WIDTH{1'b0}};

assign delay_in_real_1 = (sel == 2'b11) ? y2_re :
                         (sel == 2'b01) ? input_real : {WIDTH{1'b0}};
assign delay_in_imag_1 = (sel == 2'b11) ? y2_im :
                         (sel == 2'b01) ? input_imag : {WIDTH{1'b0}};

assign delay_in_real_2 = (sel == 2'b11) ? y3_re :
                         (sel == 2'b10) ? input_real : {WIDTH{1'b0}};
assign delay_in_imag_2 = (sel == 2'b11) ? y3_im :
                         (sel == 2'b10) ? input_imag : {WIDTH{1'b0}};

assign output_real_reg = (sel == 2'b11) ? y0_re :
                         (sel == 2'b00) ? delay_out_real_0 :
                         (sel == 2'b01) ? delay_out_real_1 : delay_out_real_2;

assign output_imag_reg = (sel == 2'b11) ? y0_im :
                         (sel == 2'b00) ? delay_out_imag_0 :
                         (sel == 2'b01) ? delay_out_imag_1 : delay_out_imag_2;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        output_en <= 1'b0;
        start_out <= 1'b0;
    end else begin
        if(input_en && (butterfly_en[sn-1:sn-2] == 2'b11)) begin
            output_en <= 1'b1;
            start_out <= 1'b1;
        end else if(!input_en && flush_count > 0) begin
            output_en <= 1'b1;

            start_out <= 1'b0;
        end else if (input_en && start_out) begin
            output_en <= 1'b1;
            start_out <= 1'b1;
        end else begin
            output_en <= 1'b0;
            start_out <= 1'b0;
        end
    end
end

always @(posedge clock or posedge reset) begin
    if (reset) begin
        output_real <= {WIDTH{1'b0}};
        output_imag <= {WIDTH{1'b0}};
    end else begin
        output_real <= output_real_reg;
        output_imag <= output_imag_reg;
    end
end

endmodule