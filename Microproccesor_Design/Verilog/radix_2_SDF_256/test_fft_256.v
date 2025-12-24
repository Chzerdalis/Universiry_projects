`timescale 1ns / 1ps

module test_fft_256_top;

    // Parameters
    parameter WIDTH = 32;
    parameter N = 256;
    
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
    fft_256_top #(
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
        forever #5 clock = ~clock; // 100MHz clock
    end
    
    // Cosine table with bit-reversed indices for N=64
    reg signed [31:0] input_real_arr [0:N-1];
    reg signed [31:0] correct_real [0:N-1];
    reg signed [31:0] correct_imag [0:N-1];
    
    initial begin
        `include "f_input_rev_256.vh"
    end

    initial begin
        `include "f_correct_256.vh"
    end

    // Test stimulus
    initial begin  
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
        for (i = 0; i < N; i = i + 1) begin
            $display("  Input[%2d]: Real=%8d, Imag=%8d", i, input_real_arr[i], 0);
        end

        // Input 64 values from cosine table
        input_en = 1;
        
        for (i = 0; i < N; i = i + 1) begin
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