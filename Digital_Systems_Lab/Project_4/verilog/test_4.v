`timescale 1ns/1ps

module test_2();
    reg clk, reset, MISO;
    wire CS, SCLK, MOSI, TxD;


    accelerometer_driver accelerometer_driver(clk, reset, TxD, CS, MISO, SCLK, MOSI);

    initial begin
        fork
            begin
                MISO = 1;
                clk = 1;
                reset = 1;
                #10
                reset = 0;
                #10
                reset = 1;
                #2000
                reset = 0;
            end
            begin
                #41
                forever begin
                    #200 MISO = ~MISO;
                end
            end
            begin
                #45
                forever begin
                    #350 MISO = ~MISO;
                end
            end
            begin
                #48
                forever begin
                    #180 MISO = ~MISO;
                end
            end
        join
    end

    always #5 clk = ~clk;
endmodule