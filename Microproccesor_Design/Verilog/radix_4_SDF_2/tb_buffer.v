`timescale 1ns / 1ps

module test_delay_buffer_advanced;

    // Parameters
    parameter WIDTH = 32;
    parameter N = 16;
    parameter DEPTH = 16;
    
    // Testbench signals
    reg clock;
    reg reset;
    reg write_en, write_en2;
    reg read_first_en, read_first_en2;
    reg read_last_en, read_last_en2;
    reg rotate, rotate2;



    reg signed [WIDTH-1:0] data_inreal_0, data_inreal_1, data_inreal_2, data_inreal_3;
    reg signed [WIDTH-1:0] data_inimag_0, data_inimag_1, data_inimag_2, data_inimag_3;
    wire signed [WIDTH-1:0] data_out_real, data_out_imag, data_out_real2, data_out_imag2;
    
    // Test variables
    integer i;
    
    // Instantiate the delay buffer advanced module
    DelayBuffer_first #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) delay_buffer_inst (
        .clock(clock),
        .reset(reset),
        .enable_read_first(read_first_en),
        .enable_write(write_en),
        .enable_read_last(read_last_en),
        .rotate(rotate),
        .input_real_0(data_inreal_0),
        .input_real_1(data_inreal_1),
        .input_real_2(data_inreal_2),
        .input_real_3(data_inreal_3),
        .input_imag_0(data_inimag_0),
        .input_imag_1(data_inimag_1),
        .input_imag_2(data_inimag_2),
        .input_imag_3(data_inimag_3),
        .out_real(data_out_real),
        .out_imag(data_out_imag)
    );

    DelayBuffer_second #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) delay_buffer_inst_2 (
        .clock(clock),
        .reset(reset),
        .enable_read_first(read_first_en2),
        .enable_write(write_en2),
        .enable_read_last(read_last_en2),
        .rotate(rotate2),
        .input_real_0(data_inreal_0),
        .input_real_1(data_inreal_1),
        .input_real_2(data_inreal_2),
        .input_real_3(data_inreal_3),
        .input_imag_0(data_inimag_0),
        .input_imag_1(data_inimag_1),
        .input_imag_2(data_inimag_2),
        .input_imag_3(data_inimag_3),
        .out_real(data_out_real2),
        .out_imag(data_out_imag2)
    );
    
    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 100MHz clock
    end
    
    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        write_en = 0;
        read_first_en = 0;
        read_last_en = 0;  
        rotate = 0;
        write_en2 = 0;
        read_first_en2 = 0;
        read_last_en2 = 0;  
        rotate2 = 0;
        // Release reset
        #15;
        reset = 0;
        
        // Write data into the buffer
        for (i = 0; i < N/4; i = i + 1) begin
            @(negedge clock);
            write_en = 1;
            data_inreal_0 = (i+1) * 10; 
            data_inimag_0 = (i+1) * 5;  
            data_inreal_1 = (i+1) * 10 + 1; 
            data_inimag_1 = (i+1) * 5 + 1;  
            data_inreal_2 = (i+1) * 10 + 2; 
            data_inimag_2 = (i+1) * 5 + 2;  
            data_inreal_3 = (i+1) * 10 + 3; 
            data_inimag_3 = (i+1) * 5 + 3;  
        end
        rotate = 1;
        // Stop writing
        @(negedge clock);
        write_en = 0;
        @(negedge clock);
        rotate = 1;
        
        // Read data from the buffer
        for (i = 0; i < N/4; i = i + 1) begin
            @(negedge clock);
            rotate = 0;
            read_first_en = 1;
            $display("Data out at time %t: %d", $time, data_out_real);
            $display("Data out at time %t: %d", $time, data_out_imag);
        end
        // Read and write data from the buffer
        for (i = 0; i < N/4; i = i + 1) begin
            @(negedge clock);
            read_first_en = 1;
            write_en = 1;
            data_inreal_0 = (i+1) * 20; 
            data_inimag_0 = (i+1) * 10;  
            data_inreal_1 = (i+1) * 20 + 1; 
            data_inimag_1 = (i+1) * 10 + 1;  
            data_inreal_2 = (i+1) * 20 + 2; 
            data_inimag_2 = (i+1) * 10 + 2;  
            data_inreal_3 = (i+1) * 20 + 3; 
            data_inimag_3 = (i+1) * 10 + 3;
            $display("Data out at time %t: %d", $time, data_out_real);
            $display("Data out at time %t: %d", $time, data_out_imag);
        end
        //Read last elements
        for (i = 0; i < N/2; i = i + 1) begin
            @(negedge clock);
            read_last_en = 1;
            read_first_en = 0;
            write_en = 0;
            $display("Data out at time %t: %d", $time, data_out_real);
            $display("Data out at time %t: %d", $time, data_out_imag);
        end
        // Finish simulation
        #20;
        write_en = 0;
        read_first_en = 0;
        read_last_en = 0;
        rotate = 1;
        #30;

        // Write data into the buffer
        for (i = 0; i < N/4; i = i + 1) begin
            @(negedge clock);
            write_en2 = 1;
            data_inreal_0 = (i+1) * 10; 
            data_inimag_0 = (i+1) * 5;  
            data_inreal_1 = (i+1) * 10 + 1; 
            data_inimag_1 = (i+1) * 5 + 1;  
            data_inreal_2 = (i+1) * 10 + 2; 
            data_inimag_2 = (i+1) * 5 + 2;  
            data_inreal_3 = (i+1) * 10 + 3; 
            data_inimag_3 = (i+1) * 5 + 3;  
        end
        rotate2 = 1;
        // Stop writing
        @(negedge clock);
        write_en2 = 0;
        @(negedge clock);
        rotate2 = 1;

        // Read data from the buffer
        for (i = 0; i < N/2; i = i + 1) begin
            @(negedge clock);
            rotate2 = 0;
            read_first_en2 = 1;
            $display("Data out at time %t: %d", $time, data_out_real2);
            $display("Data out at time %t: %d", $time, data_out_imag2);
        end
        // Read and write data from the buffer
        for (i = 0; i < N/4; i = i + 1) begin
            @(negedge clock);
            read_first_en2 = 1;
            write_en2 = 1;
            data_inreal_0 = (i+1) * 20; 
            data_inimag_0 = (i+1) * 10;  
            data_inreal_1 = (i+1) * 20 + 1; 
            data_inimag_1 = (i+1) * 10 + 1;  
            data_inreal_2 = (i+1) * 20 + 2; 
            data_inimag_2 = (i+1) * 10 + 2;  
            data_inreal_3 = (i+1) * 20 + 3; 
            data_inimag_3 = (i+1) * 10 + 3;
            $display("Data out at time %t: %d", $time, data_out_real2);
            $display("Data out at time %t: %d", $time, data_out_imag2);
        end
        //Read last elements
        for (i = 0; i < N/4; i = i + 1) begin
            @(negedge clock);
            read_last_en2 = 1;
            read_first_en2 = 0;
            write_en2 = 0;
            $display("Data out at time %t: %d", $time, data_out_real2);
            $display("Data out at time %t: %d", $time, data_out_imag2);
        end
        #20;
        read_first_en2 = 0;
        read_last_en2 = 0;  
        write_en2 = 0;
        rotate2 = 1;
        #30;
        rotate2 = 0;

        $finish;
    end
        initial begin
            $dumpfile("tb_dumpfile.vcd");
            $dumpvars(0, test_delay_buffer_advanced);
            $dumpvars(1, delay_buffer_inst);
            $dumpvars(2, delay_buffer_inst_2);
            for(i=0 ; i<DEPTH; i=i+1) begin
                $dumpvars(2, delay_buffer_inst.buf_re[i]);
                $dumpvars(2, delay_buffer_inst.buf_im[i]);
                $dumpvars(2, delay_buffer_inst_2.buf_re[i]);
                $dumpvars(2, delay_buffer_inst_2.buf_im[i]);
            end
            for(i=0 ; i<DEPTH/2; i=i+1) begin
                $dumpvars(2, delay_buffer_inst.buf_re_temp[i]);
                $dumpvars(2, delay_buffer_inst.buf_im_temp[i]);
            end
            for(i=0 ; i<DEPTH/4; i=i+1) begin
                $dumpvars(2, delay_buffer_inst_2.buf_re_temp[i]);
                $dumpvars(2, delay_buffer_inst_2.buf_im_temp[i]);
            end
        end
endmodule