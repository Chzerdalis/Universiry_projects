`timescale 1ns/1ps

module uart_tb();
    reg reset, clk, Tx_WR, s_tx_busy, s_rx_ferror, s_rx_perror;
    reg [7:0] Tx_DATA;
    reg Tx_EN, Rx_EN;  //input but assign
    reg [2:0] baud_select;  //input but assign
    wire [7:0] Rx_DATA;
    wire Tx_BUSY, Rx_FERROR, Rx_PERROR, Rx_VALID;
    reg [7:0] DATA [0:3];
    integer i, j, k;

    uart uart(reset, clk, baud_select, Tx_EN, Tx_WR, Tx_DATA, Rx_EN, Tx_BUSY ,Rx_PERROR, Rx_FERROR, Rx_VALID, Rx_DATA);
    
    initial begin
        reset = 0;
        Tx_WR = 0;
        Tx_EN = 0;
        Rx_EN = 0;
        Tx_DATA = 0;
        DATA[0] = 8'hAA;
        DATA[1] = 8'h55;
        DATA[2] = 8'hCC;
        DATA[3] = 8'h89;
        clk = 1;
        baud_select = 3'b111;

        for(i = 0; i < 7; i = i + 1) begin
            reset = 1;
            #10
            reset = 0;

            Tx_EN = 1;
            Rx_EN = 1;
            for (j = 0; j < 4; j = j + 1) begin
                Tx_DATA = DATA[j];

                #2 Tx_WR = 1;

                wait (s_tx_busy == 1);
                Tx_WR = 0;
                wait (s_tx_busy == 0 || s_rx_ferror == 1 || s_rx_perror == 1);

                if (Rx_VALID == 1) begin
                    $display("VALID");
                end else begin
                    $display("INVALID");
                end

                if(s_rx_ferror || s_rx_perror) begin
                    j = 4;
                end
                #5000;
            end
            Tx_EN = 0;
            Rx_EN = 0;
            baud_select = baud_select - 1'b1;
        end
        $finish;
    end

    always #5 clk = ~clk;

    //prevents spikes from the synthesized disign from affecting the testbence
    always @(posedge clk) begin
        if (Tx_BUSY)
            s_tx_busy <= 1'b1;
        else
            s_tx_busy <= 0; 

        if(Rx_FERROR) 
            s_rx_ferror <= 1'b1;
        else 
            s_rx_ferror <= 0;

        if(Rx_PERROR) 
            s_rx_perror <= 1'b1;
        else 
            s_rx_perror <= 0;
    end

endmodule