`timescale 1ns / 1ps

module test_fft_top;

    // Parameters
    parameter WIDTH = 32;
    parameter N = 16;
    
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
    fft_top #(
        .WIDTH(WIDTH),
        .N(N)
    ) fft_top (
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
        forever #5 clock = ~clock; // 100MHz clock
    end
    
    // Cosine table with bit-reversed indices for N=16
    reg signed [31:0] cos_table [0:255];
    // reg signed [31:0] input_real_arr [0:N-1];   
    // reg signed [31:0] correct_real [0:N-1];
    // reg signed [31:0] correct_imag [0:N-1];
    
    // initial begin
    //     `include "f_input_rev_16.vh"
    // end

    // initial begin
    //     `include "f_correct_16.vh"
    // end
    
    // Test stimulus
    initial begin
        //Initialize cosine table (bit-reversed order)
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
        for (i = 0; i < 16; i = i + 1) begin
            $display("  Input[%2d]: Real=%8d, Imag=%8d", i, cos_table[i], 0);
        end
        
        // Input 16 values from cosine table
        input_en = 1;
        
        for (i = 0; i < 16; i = i + 1) begin
            //input_real = input_real_arr[i];
            input_real = cos_table[i];
            input_imag = 0;  // All imaginary parts are 0
            #10;
        end
        
        // Disable input and wait for pipeline to flush
        input_en = 0;
        $display("\nInput complete, waiting for FFT outputs...");
        
        // // Wait for all outputs with timeout
        // while (output_count < 16 && $time < 5000) begin
        //     #10;
        // end
        
        // if (output_count < 16) begin
        //     $display("WARNING: Only received %0d outputs out of 16", output_count);
            
        //     // Continue waiting a bit more
        //     for (i = 0; i < 20; i = i + 1) begin
        //         #10;
        //         if (output_count >= 16) break;
        //     end
        // end
        
        // $display("\n==================================================");
        // $display("FFT Processing Complete");
        // $display("Total outputs received: %0d", output_count);
        // $display("==================================================");
        
        #500;
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