`timescale 1ns / 1ps

module fpadd_system_tb;
    reg clk;
    reg rst;
    reg noisy_level; 
    
    wire [7:0] leds;
    wire an0, a0, b0, c0, d0, e0, f0, g0;
    wire an1, a1, b1, c1, d1, e1, f1, g1;

    fpadd_system uut (.clk(clk), .rst(rst), .noisy_level(noisy_level), .leds(leds), .an0(an0), .a0(a0), .b0(b0), .c0(c0), .d0(d0), 
                      .e0(e0), .f0(f0), .g0(g0), .an1(an1), .a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1), .f1(f1), .g1(g1)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1;
        noisy_level = 0;
        rst = 0;
        #200;
        rst = 1;

        #20;
        rst = 0;
        #20;
        rst = 1;
        #1500;
        rst = 0;
        
        #50;
        noisy_level = 1;
        #10;
        noisy_level = 0;

        #400;
        noisy_level = 1;
        #1010;
        noisy_level = 0;

        #400;
        noisy_level = 1;
        #1010;
        noisy_level = 0;

        #400;
        noisy_level = 1;
        #1010;
        noisy_level = 0;

        #400;
        noisy_level = 1;
        #1010;
        noisy_level = 0;

        #2500;
        $finish;
    end
endmodule
