module uart(reset, clk, baud_select, Tx_EN, Tx_WR, Tx_DATA, Rx_EN, Tx_BUSY ,Rx_PERROR, Rx_FERROR, Rx_VALID, Rx_DATA);
    input reset, clk, Tx_EN, Rx_EN, Tx_WR;
    input [2:0] baud_select;
    input [7:0] Tx_DATA;
    output [7:0] Rx_DATA;
    output Tx_BUSY, Rx_FERROR, Rx_PERROR, Rx_VALID;
    reg buffer_data, receiver_data;
    wire transmiter_data;
    wire [2:0] baud_select_1;
    assign baud_select_1 = ~baud_select;

    //synchronizer
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            buffer_data <= 1;
        end else begin
            buffer_data <= transmiter_data;
        end
    end

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            receiver_data <= 1;
        end else begin
            receiver_data <= buffer_data;
        end
    end

    uart_transmitter transmiter(.reset(reset), .clk(clk), .Tx_DATA(Tx_DATA), .baud_select(baud_select), 
    .Tx_WR(Tx_WR), .Tx_EN(Tx_EN), .TxD(transmiter_data), .Tx_BUSY(Tx_BUSY));

    uart_receiver receiver(.reset(reset), .clk(clk), .Rx_EN(Rx_EN), .Rx_DATA(Rx_DATA), .Rx_FERROR(Rx_FERROR), 
    .Rx_PERROR(Rx_PERROR), .baud_select(baud_select_1), .Rx_VALID(Rx_VALID), .RxD(receiver_data));
endmodule