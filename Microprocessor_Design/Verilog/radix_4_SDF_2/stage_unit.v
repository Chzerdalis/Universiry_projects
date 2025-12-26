`timescale 1ns / 1ps

module SdfUnit4 #(
    parameter WIDTH = 32, // Data Bit Lenght
    parameter STAGE_NUM = 1, //Butterfly Stage
    parameter Num_of_samples = 16 //How many inputs
)(
    input                   clock,       //  System Clock
    input                   reset,        //  Active High Asynchronous Reset
    input                   input_en,    //  Input Data Enable
    input       [WIDTH-1:0] input_real_0, input_real_1, input_real_2, input_real_3,  //  Input Data (Real)
    input       [WIDTH-1:0] input_imag_0, input_imag_1, input_imag_2, input_imag_3,  //  Input Data (Imag)
    output  reg             output_en,  //  Output Data Enable
    output  reg [WIDTH-1:0] output_real_0, output_real_1, output_real_2, output_real_3,  //  Output Data (Real)
    output  reg [WIDTH-1:0] output_imag_0, output_imag_1, output_imag_2, output_imag_3   //  Output Data (Imag)
);

    localparam sn = 2*STAGE_NUM;
    localparam Depth = 1 << (2*(STAGE_NUM - 1));
    localparam Stride = 1 << (2*STAGE_NUM); 

    //Wires needed for stages > 1
    //if (STAGE_NUM > 1) begin : gen_counter_and_flush
        //Counters to calculate the twiddle factors and manage the delay buffers
        reg [sn-3:0] butterfly_op_counter;
        reg [sn-3:0] stride_segment_counter;
        reg butterfly_op_counter_en;
        reg stride_segment_counter_en;

        //Counter to flush the pipeline at the end of the data
        reg [sn-1:0] flush_count;
        reg start_out;

        //Delay buffer enable signals
        wire db0_write_en, db0_read_first_en, db0_read_last_en, db0_rotate;
        wire db1_write_en, db1_read_first_en, db1_read_last_en, db1_rotate;
        wire db2_write_en, db2_read_en;
        wire db3_write_en, db3_read_en;

        //Delay buffer input/output wires
        wire [WIDTH-1:0] db0_in_re_0, db0_in_imag_0;
        wire [WIDTH-1:0] db0_in_re_1, db0_in_imag_1;
        wire [WIDTH-1:0] db0_in_re_2, db0_in_imag_2;
        wire [WIDTH-1:0] db0_in_re_3, db0_in_imag_3;

        wire [WIDTH-1:0] db1_in_re_0, db1_in_imag_0;
        wire [WIDTH-1:0] db1_in_re_1, db1_in_imag_1;
        wire [WIDTH-1:0] db1_in_re_2, db1_in_imag_2;
        wire [WIDTH-1:0] db1_in_re_3, db1_in_imag_3;

        wire [WIDTH-1:0] db2_in_re_0, db2_in_imag_0;
        wire [WIDTH-1:0] db2_in_re_1, db2_in_imag_1;
        wire [WIDTH-1:0] db2_in_re_2, db2_in_imag_2;
        wire [WIDTH-1:0] db2_in_re_3, db2_in_imag_3;

        wire [WIDTH-1:0] db3_in_re_1, db3_in_imag_1;
        wire [WIDTH-1:0] db3_in_re_2, db3_in_imag_2;
        wire [WIDTH-1:0] db3_in_re_3, db3_in_imag_3;

        wire [WIDTH-1:0] delay_out_real_0, delay_out_imag_0;
        wire [WIDTH-1:0] delay_out_real_1, delay_out_imag_1;
        wire [WIDTH-1:0] delay_out_real_2, delay_out_imag_2;
        wire [WIDTH-1:0] delay_out_real_3, delay_out_imag_3;
    //end

    wire butterfly_out_ready, start_butterfly;

    wire [$clog2(Num_of_samples)-1:0] twiddle_index_0, twiddle_index_1, twiddle_index_2;

    wire [WIDTH-1:0] x0_re, x0_im, y0_re, y0_im;
    wire [WIDTH-1:0] x1_re, x1_im, y1_re, y1_im;
    wire [WIDTH-1:0] x2_re, x2_im, y2_re, y2_im;
    wire [WIDTH-1:0] x3_re, x3_im, y3_re, y3_im;

    reg [WIDTH/2 - 1:0] w_real [0:Num_of_samples-1];
    reg [WIDTH/2 - 1:0] w_imag [0:Num_of_samples-1];


    initial begin
        `include "f_twiddle_16.vh"
    end

    //Manage counters
    if (STAGE_NUM > 1) begin : gen_input_logic
        always @(posedge clock or posedge reset) begin
            if (reset) begin
                stride_segment_counter <= {(sn-2){1'b0}};
                butterfly_op_counter <= {(sn-2){1'b0}};
                stride_segment_counter_en <= 1'b0;
                butterfly_op_counter_en <= 1'b0;
                flush_count <= Num_of_samples/4 - 1;
            end else begin
                if(input_en) begin
                    if(stride_segment_counter == {2'b10, {(sn-4){1'b1}}} && butterfly_op_counter_en == 0) begin
                        butterfly_op_counter_en <= 1'b1;
                        butterfly_op_counter <= butterfly_op_counter;
                        flush_count <= flush_count;
                    end else if (butterfly_op_counter_en) begin
                        butterfly_op_counter <= butterfly_op_counter + 1'b1;
                        butterfly_op_counter_en <= 1'b1;
                        flush_count <= flush_count - 1'b1;
                    end else begin
                        butterfly_op_counter <= butterfly_op_counter;
                        butterfly_op_counter_en <= 1'b0;
                        flush_count <= flush_count;
                    end

                    if(stride_segment_counter_en == 1'b0) begin
                        stride_segment_counter_en <= 1'b1;
                        stride_segment_counter <= stride_segment_counter;
                    end else begin
                        stride_segment_counter_en <= 1'b1;
                        stride_segment_counter <= stride_segment_counter + 1'b1;
                    end
                end else begin
                    if (flush_count == 0) begin
                        butterfly_op_counter <= 1'b0;
                        stride_segment_counter <= 1'b0;
                        butterfly_op_counter_en <= 1'b0;
                    end else begin
                        butterfly_op_counter <= butterfly_op_counter + 1'b1;
                        stride_segment_counter <= stride_segment_counter + 1'b1;
                        butterfly_op_counter_en <= butterfly_op_counter_en;
                        flush_count <= flush_count - 1'b1;
                    end
                end
            end
        end
    end

    //Manage twiddle factors based on stage number
    assign twiddle_index_0 = (STAGE_NUM == 1) ? 3'b0 : (butterfly_op_counter * (Num_of_samples/Stride));
    assign twiddle_index_1 = (STAGE_NUM == 1) ? 3'b0 : (butterfly_op_counter * (Num_of_samples/Stride) * 2);
    assign twiddle_index_2 = (STAGE_NUM == 1) ? 3'b0 : (butterfly_op_counter * (Num_of_samples/Stride) * 3);

    //Manage butterfly inputs based on stage number
    assign x0_re = (STAGE_NUM == 1) ? input_real_0 : delay_out_real_0;
    assign x0_im = (STAGE_NUM == 1) ? input_imag_0 : delay_out_imag_0;

    assign x1_re = (STAGE_NUM == 1) ? input_real_1 : delay_out_real_1;
    assign x1_im = (STAGE_NUM == 1) ? input_imag_1 : delay_out_imag_1;

    assign x2_re = (STAGE_NUM == 1) ? input_real_2 : delay_out_real_2;
    assign x2_im = (STAGE_NUM == 1) ? input_imag_2 : delay_out_imag_2;

    assign x3_re = (STAGE_NUM == 1) ? input_real_3 : (butterfly_op_counter[sn-3:sn-4] != 2'b00) ? input_real_0 : delay_out_real_3;
    assign x3_im = (STAGE_NUM == 1) ? input_imag_3 : (butterfly_op_counter[sn-3:sn-4] != 2'b00) ? input_imag_0 : delay_out_imag_3; 

    assign start_butterfly = (STAGE_NUM == 1) ? input_en : butterfly_op_counter_en;

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
        .out4r(y3_re), .out4i(y3_im),
        .start(start_butterfly),
        .done(butterfly_out_ready)
    );

    //if(STAGE_NUM > 1) begin : gen_delay_buffers

        DelayBuffer_first #(
            .DEPTH(Depth),
            .WIDTH(WIDTH)
        ) db0 (
            .clock(clock),
            .reset(reset),
            .enable_write(db0_write_en),
            .enable_read_first(db0_read_first_en),
            .enable_read_last(db0_read_last_en),
            .rotate(db0_rotate),
            .input_real_0(input_real_0),
            .input_real_1(input_real_1),
            .input_real_2(input_real_2),
            .input_real_3(input_real_3),
            .input_imag_0(input_imag_0),
            .input_imag_1(input_imag_1),
            .input_imag_2(input_imag_2),
            .input_imag_3(input_imag_3),
            .out_real(delay_out_real_0),
            .out_imag(delay_out_imag_0)
        );

        DelayBuffer_second #(
            .DEPTH(Depth),
            .WIDTH(WIDTH)
        ) db1 (
            .clock(clock),
            .reset(reset),
            .enable_write(db1_write_en),
            .enable_read_first(db1_read_first_en),
            .enable_read_last(db1_read_last_en),
            .rotate(db1_rotate),
            .input_real_0(input_real_0),
            .input_real_1(input_real_1),
            .input_real_2(input_real_2),
            .input_real_3(input_real_3),
            .input_imag_0(input_imag_0),
            .input_imag_1(input_imag_1),
            .input_imag_2(input_imag_2),
            .input_imag_3(input_imag_3),
            .out_real(delay_out_real_1),
            .out_imag(delay_out_imag_1)
        );

        DelayBuffer_third #(
            .DEPTH(Depth),
            .WIDTH(WIDTH)
        ) db2 (
            .clock(clock),
            .reset(reset),
            .enable_write(db2_write_en),
            .enable_read(db2_read_en),
            .input_real_0(input_real_0),
            .input_real_1(input_real_1),
            .input_real_2(input_real_2),
            .input_real_3(input_real_3),
            .input_imag_0(input_imag_0),
            .input_imag_1(input_imag_1),
            .input_imag_2(input_imag_2),
            .input_imag_3(input_imag_3),
            .out_real(delay_out_real_2),
            .out_imag(delay_out_imag_2)
        );

        DelayBuffer_fourth #(
            .DEPTH(Depth),
            .WIDTH(WIDTH)
        ) db3 (
            .clock(clock),
            .reset(reset),
            .enable_write(db3_write_en),
            .enable_read(db3_read_en),
            .input_real_1(input_real_1),
            .input_real_2(input_real_2),
            .input_real_3(input_real_3),
            .input_imag_1(input_imag_1),
            .input_imag_2(input_imag_2),
            .input_imag_3(input_imag_3),
            .out_real(delay_out_real_3),
            .out_imag(delay_out_imag_3)
        );

        wire [1:0] sel_stride = stride_segment_counter[sn-3:sn-4];
        wire [1:0] sel_butterfly = butterfly_op_counter[sn-3:sn-4];

        //db0 control signals
        assign db0_write_en = (sel_stride == 2'b00) ? 1'b1 : 1'b0;
        assign db0_read_first_en = (sel_butterfly[1] == 1'b0 && butterfly_op_counter_en) ? 1'b1 : 1'b0;
        assign db0_read_last_en = (sel_butterfly[1] == 1'b1 && butterfly_op_counter_en) ? 1'b1 : 1'b0;
        assign db0_rotate = (stride_segment_counter == {2'b10, {(sn-4){1'b1}}}) ? 1'b1 : 1'b0;

        //db1 control signals
        assign db1_write_en = (sel_stride == 2'b01) ? 1'b1 : 1'b0;
        assign db1_read_first_en = (sel_butterfly != 2'b11 && butterfly_op_counter_en) ? 1'b1 : 1'b0;
        assign db1_read_last_en = (sel_butterfly == 2'b11 && butterfly_op_counter_en) ? 1'b1 : 1'b0;
        assign db1_rotate = (stride_segment_counter == {2'b10, {(sn-4){1'b1}}}) ? 1'b1 : 1'b0; 

        //db2 control signals
        assign db2_write_en = (sel_stride == 2'b10) ? 1'b1 : 1'b0;
        assign db2_read_en = (butterfly_op_counter_en) ? 1'b1 : 1'b0; 

        //db3 control signals
        assign db3_write_en = (sel_stride == 2'b11) ? 1'b1 : 1'b0;
        assign db3_read_en = (sel_butterfly != 2'b00 && butterfly_op_counter_en) ? 1'b1 : 1'b0;
    //end

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            output_en <= 1'b0;
        end else begin
            if(butterfly_out_ready) begin
                output_en <= 1'b1;
            end else begin
                output_en <= 1'b0;
            end
        end
    end
    
    //Manage butterfly and unit outputs
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            output_real_0 <= {WIDTH{1'b0}};
            output_imag_0 <= {WIDTH{1'b0}};
            output_real_1 <= {WIDTH{1'b0}};
            output_imag_1 <= {WIDTH{1'b0}};
            output_real_2 <= {WIDTH{1'b0}};
            output_imag_2 <= {WIDTH{1'b0}};
            output_real_3 <= {WIDTH{1'b0}};
            output_imag_3 <= {WIDTH{1'b0}};
        end else begin
            output_real_0 <= y0_re;
            output_imag_0 <= y0_im;
            output_real_1 <= y1_re;
            output_imag_1 <= y1_im;
            output_real_2 <= y2_re;
            output_imag_2 <= y2_im;
            output_real_3 <= y3_re;
            output_imag_3 <= y3_im;
        end
    end
endmodule