`timescale 1ns/1ps

module tb;
    localparam N = 16;

    reg clk;
    reg rst;
    reg new_data;
    reg [$clog2(N)-1:0] addr;
    reg signed [31:0] data_in_real;
    reg signed [31:0] data_in_imag;
    wire [$clog2(N)-1:0] addr_out;
    wire signed [31:0] data_out_real;
    wire signed [31:0] data_out_imag;
    wire valid;

    reg signed [31:0] cos_table [0:63];

    // Instantiate the DUT
    top_module #(N) uut (
        .new_data(new_data),
        .addr(addr),
        .data_in_real(data_in_real),
        .data_in_imag(data_in_imag),
        .addr_out(addr_out),
        .data_out_real(data_out_real),
        .data_out_imag(data_out_imag),
        .valid(valid),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100MHz clock

    integer i;

    reg signed [31:0] input_real [0:N-1];
    reg signed [31:0] correct_real [0:N-1];
    reg signed [31:0] correct_imag [0:N-1];

    initial begin
        `include "f_input_64.vh"
    end

    initial begin
        `include "f_correct_64.vh"
    end

    initial begin
        // Initialize inputs
        rst = 1;
        new_data = 0;
        addr = 0;
        data_in_real = 0;
        data_in_imag = 0;       

        // cos_table[0]  = 32'sd32768;  // cos(0)
        // cos_table[1]  = 32'sd32610;  // cos(π/32)
        // cos_table[2]  = 32'sd32138;  // cos(2π/32)
        // cos_table[3]  = 32'sd31357;  // cos(3π/32)
        // cos_table[4]  = 32'sd30274;  // cos(4π/32)
        // cos_table[5]  = 32'sd28899;  // cos(5π/32)
        // cos_table[6]  = 32'sd27246;  // cos(6π/32)
        // cos_table[7]  = 32'sd25330;  // cos(7π/32)
        // cos_table[8]  = 32'sd23170;  // cos(8π/32)
        // cos_table[9]  = 32'sd20788;  // cos(9π/32)
        // cos_table[10] = 32'sd18205;  // cos(10π/32)
        // cos_table[11] = 32'sd15447;  // cos(11π/32)
        // cos_table[12] = 32'sd12540;  // cos(12π/32)
        // cos_table[13] = 32'sd9512;   // cos(13π/32)
        // cos_table[14] = 32'sd6393;   // cos(14π/32)
        // cos_table[15] = 32'sd3212;   // cos(15π/32)
        // cos_table[16] = 32'sd0;      // cos(16π/32)
        // cos_table[17] = -32'sd3212;  // cos(17π/32)
        // cos_table[18] = -32'sd6393;  // cos(18π/32)
        // cos_table[19] = -32'sd9512;  // cos(19π/32)
        // cos_table[20] = -32'sd12540; // cos(20π/32)
        // cos_table[21] = -32'sd15447; // cos(21π/32)
        // cos_table[22] = -32'sd18205; // cos(22π/32)
        // cos_table[23] = -32'sd20788; // cos(23π/32)
        // cos_table[24] = -32'sd23170; // cos(24π/32)
        // cos_table[25] = -32'sd25330; // cos(25π/32)
        // cos_table[26] = -32'sd27246; // cos(26π/32)
        // cos_table[27] = -32'sd28899; // cos(27π/32)
        // cos_table[28] = -32'sd30274; // cos(28π/32)
        // cos_table[29] = -32'sd31357; // cos(29π/32)
        // cos_table[30] = -32'sd32138; // cos(30π/32)
        // cos_table[31] = -32'sd32610; // cos(31π/32)
        // cos_table[32] = -32'sd32768; // cos(32π/32)
        // cos_table[33] = -32'sd32610; // cos(33π/32)
        // cos_table[34] = -32'sd32138; // cos(34π/32)
        // cos_table[35] = -32'sd31357; // cos(35π/32)
        // cos_table[36] = -32'sd30274; // cos(36π/32)
        // cos_table[37] = -32'sd28899; // cos(37π/32)
        // cos_table[38] = -32'sd27246; // cos(38π/32)
        // cos_table[39] = -32'sd25330; // cos(39π/32)
        // cos_table[40] = -32'sd23170; // cos(40π/32)
        // cos_table[41] = -32'sd20788; // cos(41π/32)
        // cos_table[42] = -32'sd18205; // cos(42π/32)
        // cos_table[43] = -32'sd15447; // cos(43π/32)
        // cos_table[44] = -32'sd12540; // cos(44π/32)
        // cos_table[45] = -32'sd9512;  // cos(45π/32)
        // cos_table[46] = -32'sd6393;  // cos(46π/32)
        // cos_table[47] = -32'sd3212;  // cos(47π/32)
        // cos_table[48] = 32'sd0;      // cos(48π/32)
        // cos_table[49] = 32'sd3212;   // cos(49π/32)
        // cos_table[50] = 32'sd6393;   // cos(50π/32)
        // cos_table[51] = 32'sd9512;   // cos(51π/32)
        // cos_table[52] = 32'sd12540;  // cos(52π/32)
        // cos_table[53] = 32'sd15447;  // cos(53π/32)
        // cos_table[54] = 32'sd18205;  // cos(54π/32)
        // cos_table[55] = 32'sd20788;  // cos(55π/32)
        // cos_table[56] = 32'sd23170;  // cos(56π/32)
        // cos_table[57] = 32'sd25330;  // cos(57π/32)
        // cos_table[58] = 32'sd27246;  // cos(58π/32)
        // cos_table[59] = 32'sd28899;  // cos(59π/32)
        // cos_table[60] = 32'sd30274;  // cos(60π/32)
        // cos_table[61] = 32'sd31357;  // cos(61π/32)
        // cos_table[62] = 32'sd32138;  // cos(62π/32)
        // cos_table[63] = 32'sd32610;  // cos(63π/32)

        cos_table[0]  = 32'sd32768;   // index 0  -> rev4(0)  = 0
        cos_table[1]  = 32'sd30274;   // index 1  -> rev4(1)  = 4
        cos_table[2]  = 32'sd23170;   // index 2  -> rev4(2)  = 8
        cos_table[3]  = 32'sd12540;   // index 3  -> rev4(3)  = 12
        cos_table[4]  = 32'sd0;       // index 4  -> rev4(4)  = 1
        cos_table[5]  = -32'sd12540;  // index 5  -> rev4(5)  = 5
        cos_table[6]  = -32'sd23170;  // index 6  -> rev4(6)  = 9
        cos_table[7]  = -32'sd30274;  // index 7  -> rev4(7)  = 13
        cos_table[8]  = -32'sd32768;  // index 8  -> rev4(8)  = 2
        cos_table[9]  = -32'sd30274;  // index 9  -> rev4(9)  = 6
        cos_table[10] = -32'sd23170;  // index 10 -> rev4(10) = 10
        cos_table[11] = -32'sd12540;  // index 11 -> rev4(11) = 14
        cos_table[12] = 32'sd0;       // index 12 -> rev4(12) = 3
        cos_table[13] = 32'sd12540;   // index 13 -> rev4(13) = 7
        cos_table[14] = 32'sd23170;   // index 14 -> rev4(14) = 11
        cos_table[15] = 32'sd30274;   // index 15 -> rev4(15) = 15

        // Apply reset
        #20 rst = 0;
        #10 new_data = 1;
        #10 new_data = 0;
        // Feed 64 samples to the input
        for (i = 0; i < N; i = i + 1) begin
            @(negedge clk);
            addr = i[$clog2(N)-1:0];
            //data_in_real = input_real[i];
            data_in_real = cos_table[i];
            data_in_imag = 0;
        end

        wait(valid == 1);
        #10;
        // Display output
        $display("FFT Output:");
        for (i = 0; i < N; i = i + 1) begin
            $display("Index %0d: Real = %0d, Imag = %0d",
                addr_out,
                $signed(data_out_real),
                $signed(data_out_imag)
            );
            #10;
        end
        #20;
        $finish;
    end
endmodule