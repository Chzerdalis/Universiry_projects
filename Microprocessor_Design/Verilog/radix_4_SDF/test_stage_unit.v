`timescale 1ns / 1ps

module test_stage_unit;

    // Parameters
    parameter WIDTH = 32;
    parameter STAGE_NUM_1 = 1;
    parameter STAGE_NUM_2 = 2;
    parameter N = 16;
    
    // Testbench signals
    reg clock;
    reg reset;
    reg input_en;
    reg [WIDTH-1:0] input_real;
    reg [WIDTH-1:0] input_imag;
    
    // Stage 1 outputs
    wire stage1_output_en;
    wire [WIDTH-1:0] stage1_output_real;
    wire [WIDTH-1:0] stage1_output_imag;
    
    // Stage 2 outputs
    wire stage2_output_en;
    wire [WIDTH-1:0] stage2_output_real;
    wire [WIDTH-1:0] stage2_output_imag;
    
    // Test variables
    integer i;
    
    // Instantiate Stage 1 (STAGE_NUM = 1)
    SdfUnit4 #(
        .WIDTH(WIDTH),
        .STAGE_NUM(STAGE_NUM_1),
        .Num_of_samples(N)
    ) stage1 (
        .clock(clock),
        .reset(reset),
        .input_en(input_en),
        .input_real(input_real),
        .input_imag(input_imag),
        .output_en(stage1_output_en),
        .output_real(stage1_output_real),
        .output_imag(stage1_output_imag)
    );
    
    // Instantiate Stage 2 (STAGE_NUM = 2)
    SdfUnit4 #(
        .WIDTH(WIDTH),
        .STAGE_NUM(STAGE_NUM_2),
        .Num_of_samples(N)
    ) stage2 (
        .clock(clock),
        .reset(reset),
        .input_en(stage1_output_en),
        .input_real(stage1_output_real),
        .input_imag(stage1_output_imag),
        .output_en(stage2_output_en),
        .output_real(stage2_output_real),
        .output_imag(stage2_output_imag)
    );
    
    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 100MHz clock
    end
    
    reg signed [31:0] cos_table [0:15];

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        input_en = 0;
        input_real = 0;
        input_imag = 0;
        

        // Bit-reversed indices for N=16
        cos_table[0]  = 32'sd32768;   // index 0  -> rev4(0)  = 0
        cos_table[4]  = 32'sd30274;   // index 1  -> rev4(1)  = 4
        cos_table[8]  = 32'sd23170;   // index 2  -> rev4(2)  = 8
        cos_table[12] = 32'sd12540;   // index 3  -> rev4(3)  = 12
        cos_table[1]  = 32'sd0;       // index 4  -> rev4(4)  = 1
        cos_table[5]  = -32'sd12540;  // index 5  -> rev4(5)  = 5
        cos_table[9]  = -32'sd23170;  // index 6  -> rev4(6)  = 9
        cos_table[13] = -32'sd30274;  // index 7  -> rev4(7)  = 13
        cos_table[2]  = -32'sd32768;  // index 8  -> rev4(8)  = 2
        cos_table[6]  = -32'sd30274;  // index 9  -> rev4(9)  = 6
        cos_table[10] = -32'sd23170;  // index 10 -> rev4(10) = 10
        cos_table[14] = -32'sd12540;  // index 11 -> rev4(11) = 14
        cos_table[3]  = 32'sd0;       // index 12 -> rev4(12) = 3
        cos_table[7]  = 32'sd12540;   // index 13 -> rev4(13) = 7
        cos_table[11] = 32'sd23170;   // index 14 -> rev4(14) = 11
        cos_table[15] = 32'sd30274;   // index 15 -> rev4(15) = 15

        // Wait for reset
        #20;
        reset = 0;
        #10;
        
        // Input 16 values
        for (i = 0; i < 16; i = i + 1) begin
            input_real = cos_table[i];        // Pattern: 0, 1000, 2000, ...
            input_imag = 0; 
            input_en = 1;              // All imaginary parts are 0
            #10;
        end
        
        // Disable input and let pipeline flush
        input_en = 0;
    
        for (i = 0; i < 30; i = i + 1) begin
            #10;
            if (stage2_output_en) begin
                $display("Flush %0d: S2[%b,%0d,%0d]", 
                         i, 
                         stage2_output_en, $signed(stage2_output_real), $signed(stage2_output_imag));
            end
        end
        
        $display("Test completed");
        $finish;
    end
endmodule