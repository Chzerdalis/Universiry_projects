`timescale 1ns / 1ps

module test_fft_64_top;

    // Parameters
    parameter WIDTH = 32;
    parameter N = 64;
    
    // Testbench signals
    reg clock;
    reg reset;
    reg input_en;
    reg signed [WIDTH-1:0] input_real;
    reg signed [WIDTH-1:0] input_imag;
    
    wire output_en;
    wire signed [WIDTH-1:0] output_real;
    wire signed [WIDTH-1:0] output_imag;
    
    // Test variables
    integer i;
    integer output_count;
    
    // Instantiate the FFT top module
    fft_64_top #(
        .WIDTH(WIDTH),
        .N(N)
    ) dut (
        .clock(clock),
        .reset(reset),
        .input_en(input_en),
        .input_real(input_real),
        .input_imag(input_imag),
        .output_en(output_en),
        .output_real(output_real),
        .output_imag(output_imag)
    );
    
    // Clock generation
    initial begin
        clock = 0;
        forever #7 clock = ~clock; // 100MHz clock
    end
    
    // Cosine table with bit-reversed indices for N=64
    //reg signed [31:0] cos_table [0:63];
    
    reg signed [31:0] input_real_arr [0:N-1];   
    reg signed [31:0] correct_real [0:N-1];
    reg signed [31:0] correct_imag [0:N-1];
    
    initial begin
        `include "f_input_rev_64.vh"
    end

    initial begin
        `include "f_correct_64.vh"
    end

    // Test stimulus
    initial begin
        // Initialize cosine table (bit-reversed order)
        // Fill cos_table in bit-reversed order for N=64
        // cos_table[0]  = 32'sd32768;  // cos(0)
        // cos_table[32] = 32'sd32610;  // cos(π/32)
        // cos_table[16] = 32'sd32138;  // cos(2π/32)
        // cos_table[48] = 32'sd31357;  // cos(3π/32)
        // cos_table[8]  = 32'sd30274;  // cos(4π/32)
        // cos_table[40] = 32'sd28899;  // cos(5π/32)
        // cos_table[24] = 32'sd27246;  // cos(6π/32)
        // cos_table[56] = 32'sd25330;  // cos(7π/32)
        // cos_table[4]  = 32'sd23170;  // cos(8π/32)
        // cos_table[36] = 32'sd20788;  // cos(9π/32)
        // cos_table[20] = 32'sd18205;  // cos(10π/32)
        // cos_table[52] = 32'sd15447;  // cos(11π/32)
        // cos_table[12] = 32'sd12540;  // cos(12π/32)
        // cos_table[44] = 32'sd9512;   // cos(13π/32)
        // cos_table[28] = 32'sd6393;   // cos(14π/32)
        // cos_table[60] = 32'sd3212;   // cos(15π/32)
        // cos_table[2]  = 32'sd0;      // cos(16π/32)
        // cos_table[34] = -32'sd3212;  // cos(17π/32)
        // cos_table[18] = -32'sd6393;  // cos(18π/32)
        // cos_table[50] = -32'sd9512;  // cos(19π/32)
        // cos_table[10] = -32'sd12540; // cos(20π/32)
        // cos_table[42] = -32'sd15447; // cos(21π/32)
        // cos_table[26] = -32'sd18205; // cos(22π/32)
        // cos_table[58] = -32'sd20788; // cos(23π/32)
        // cos_table[6]  = -32'sd23170; // cos(24π/32)
        // cos_table[38] = -32'sd25330; // cos(25π/32)
        // cos_table[22] = -32'sd27246; // cos(26π/32)
        // cos_table[54] = -32'sd28899; // cos(27π/32)
        // cos_table[14] = -32'sd30274; // cos(28π/32)
        // cos_table[46] = -32'sd31357; // cos(29π/32)
        // cos_table[30] = -32'sd32138; // cos(30π/32)
        // cos_table[62] = -32'sd32610; // cos(31π/32)
        // cos_table[1]  = -32'sd32768; // cos(32π/32)
        // cos_table[33] = -32'sd32610; // cos(33π/32)
        // cos_table[17] = -32'sd32138; // cos(34π/32)
        // cos_table[49] = -32'sd31357; // cos(35π/32)
        // cos_table[9]  = -32'sd30274; // cos(36π/32)
        // cos_table[41] = -32'sd28899; // cos(37π/32)
        // cos_table[25] = -32'sd27246; // cos(38π/32)
        // cos_table[57] = -32'sd25330; // cos(39π/32)
        // cos_table[5]  = -32'sd23170; // cos(40π/32)
        // cos_table[37] = -32'sd20788; // cos(41π/32)
        // cos_table[21] = -32'sd18205; // cos(42π/32)
        // cos_table[53] = -32'sd15447; // cos(43π/32)
        // cos_table[13] = -32'sd12540; // cos(44π/32)
        // cos_table[45] = -32'sd9512;  // cos(45π/32)
        // cos_table[29] = -32'sd6393;  // cos(46π/32)
        // cos_table[61] = -32'sd3212;  // cos(47π/32)
        // cos_table[3]  = 32'sd0;      // cos(48π/32)
        // cos_table[35] = 32'sd3212;   // cos(49π/32)
        // cos_table[19] = 32'sd6393;   // cos(50π/32)
        // cos_table[51] = 32'sd9512;   // cos(51π/32)
        // cos_table[11] = 32'sd12540;  // cos(52π/32)
        // cos_table[43] = 32'sd15447;  // cos(53π/32)
        // cos_table[27] = 32'sd18205;  // cos(54π/32)
        // cos_table[59] = 32'sd20788;  // cos(55π/32)
        // cos_table[7]  = 32'sd23170;  // cos(56π/32)
        // cos_table[39] = 32'sd25330;  // cos(57π/32)
        // cos_table[23] = 32'sd27246;  // cos(58π/32)
        // cos_table[55] = 32'sd28899;  // cos(59π/32)
        // cos_table[15] = 32'sd30274;  // cos(60π/32)
        // cos_table[47] = 32'sd31357;  // cos(61π/32)
        // cos_table[31] = 32'sd32138;  // cos(62π/32)
        // cos_table[63] = 32'sd32610;  // cos(63π/32)
        
        // Initialize inputs
        reset = 1;
        input_en = 0;
        input_real = 0;
        input_imag = 0;
        output_count = 0;
        
        $display("==================================================");
        $display("16-Point FFT Top Module Test");
        $display("==================================================");
        
        // Wait for reset
        #20;
        reset = 0;
        #10;
        
        $display("Starting FFT with cosine input sequence...");
        $display("Input sequence (bit-reversed cosine):");
        
        // Display input sequence
        for (i = 0; i < 64; i = i + 1) begin
            $display("  Input[%2d]: Real=%8d, Imag=%8d", i, input_real_arr[i], 0);
        end

        // Input 64 values from cosine table
        input_en = 1;
        
        for (i = 0; i < 64; i = i + 1) begin
            input_real = input_real_arr[i];
            input_imag = 0;  // All imaginary parts are 0
            #10;
        end
        
        // Disable input and wait for pipeline to flush
        input_en = 0;
        $display("\nInput complete, waiting for FFT outputs...");       
        #13000;
        $finish;
    end
    
    // Monitor outputs
    always @(posedge clock) begin
        if (output_en) begin
            $display("  Output[%2d]: Real=%8d, Imag=%8d (Time: %0t)", 
                     output_count, output_real, output_imag, $time);
            output_count = output_count + 1;
        end
    end
    
    // Timeout protection
    initial begin
        #10000; // 10us timeout
        $display("ERROR: Testbench timeout at time %0t", $time);
        $display("Outputs received so far: %0d", output_count);
        $finish;
    end

endmodule