module SdfUnit2 #(
    parameter   WIDTH = 32, //  Data Bit Length
    parameter   STAGE_NUM = 1,   //  Butterfly Stage Number
    parameter   N = 16 //  Number of Samples (2^STAGE_NUM)
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

localparam M = (1 << STAGE_NUM)/2; //  M = 2^STAGE_NUM

reg [3:0] O = N/(2 * M); //  O = N/M, used for twiddle factor indexing

wire [$clog2(N)-1:0] twiddle_index;
reg [STAGE_NUM-1:0] butterfly_en;
reg [STAGE_NUM-1:0] flush_count;

wire [WIDTH-1:0] x0_re, x0_im, y0_re, y0_im;
wire [WIDTH-1:0] x1_re, x1_im, y1_re, y1_im;
wire [WIDTH-1:0] delay_in_real, delay_in_imag, delay_out_real, delay_out_imag;
wire [WIDTH-1:0] output_real_reg, output_imag_reg;

reg [WIDTH/2 - 1:0] w_real [0: N/2 -1];
reg [WIDTH/2 - 1:0] w_imag [0: N/2 -1];

reg start_out;

initial begin
    `include "f_twiddle_16.vh"
end

always @(posedge clock or posedge reset) begin
    if (reset) begin
        butterfly_en <= 1'b0;
        //twiddle_index <= 1'b0;
        flush_count <= 1'b0;
    end else begin
        if(input_en) begin
            butterfly_en <= butterfly_en + 1'b1;
            flush_count <= M;
        end else begin
            butterfly_en <=  1'b0;
            if (flush_count == 0) begin
                flush_count <= 0;
            end else begin
                flush_count <= flush_count - 1'b1;
            end
        end
        // if(STAGE_NUM == 1) begin
        //     twiddle_index <= 0; // No twiddle factors for stage 1
        // end else begin
        //     twiddle_index <= (butterfly_en[STAGE_NUM-2:0]) * (N/M);
        // end
    end
end

assign twiddle_index = (STAGE_NUM == 1) ? 3'b0 : (butterfly_en[STAGE_NUM-2:0] * (N/(2 * M)));

assign x0_re = (butterfly_en[STAGE_NUM-1] == 1'b1) ? delay_out_real : {WIDTH{1'bx}};
assign x0_im = (butterfly_en[STAGE_NUM-1] == 1'b1) ? delay_out_imag : {WIDTH{1'bx}};
assign x1_re = (butterfly_en[STAGE_NUM-1] == 1'b1) ? input_real : {WIDTH{1'bx}};
assign x1_im = (butterfly_en[STAGE_NUM-1] == 1'b1) ? input_imag : {WIDTH{1'bx}};

butterfly #(
    .WIDTH(WIDTH)
) b0 (
    .ar(x0_re), .ai(x0_im),
    .br(x1_re), .bi(x1_im),
    .wr(w_real[twiddle_index]), .wi(w_imag[twiddle_index]),
    .out1r(y0_re), .out1i(y0_im),
    .out2r(y1_re), .out2i(y1_im)
);

DelayBuffer #(
    .DEPTH(M),
    .WIDTH(WIDTH)
) db0 (
    .clock(clock),
    .input_real(delay_in_real),
    .input_imag(delay_in_imag),
    .out_real(delay_out_real),
    .out_imag(delay_out_imag)
);

assign delay_in_real = (butterfly_en[STAGE_NUM-1] == 1'b1) ? y1_re : input_real;
assign delay_in_imag = (butterfly_en[STAGE_NUM-1] == 1'b1) ? y1_im : input_imag;
assign output_real_reg = (butterfly_en[STAGE_NUM-1] == 1'b1) ? y0_re : delay_out_real;
assign output_imag_reg = (butterfly_en[STAGE_NUM-1] == 1'b1) ? y0_im : delay_out_imag;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        output_en <= 1'b0;
        start_out <= 1'b0;
    end else begin
        if(input_en && (butterfly_en[STAGE_NUM-1] == 1'b1)) begin
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
