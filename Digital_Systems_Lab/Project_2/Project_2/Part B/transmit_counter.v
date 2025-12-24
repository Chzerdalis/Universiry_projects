`timescale 1ns/1ps
//This module counts the Tx_sample_enables so that we can synchronize
//the transmiter with the reciever
module transmit_counter(clk, reset, trans_counter, sample_ENABLE, Tx_WR);
    input clk, reset, sample_ENABLE, Tx_WR;
    output reg [3:0] trans_counter;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            trans_counter <= 0;
        end else begin
            if(Tx_WR) begin //starts counting when the transmiting starts
                trans_counter <= 0;
            end else if(sample_ENABLE == 1'b1) begin
                trans_counter <= trans_counter + 1'b1;
            end else begin
                trans_counter <= trans_counter;
            end
        end
    end
endmodule
























// module state_counter(clk, reset, trans_counter, sample_ENABLE, Tx_WR, state);
//     input clk, reset, sample_ENABLE, Tx_WR;
//     input [3:0] trans_counter;
//     output reg [3:0] state;

//     always @(posedge clk or posedge reset) begin
//         if(reset || Tx_WR) begin
//             state <= 0;
//         end else begin
//             if(trans_counter == 4'b1111 and sample_ENABLE == 1'b1) begin
//                 state <= state + 1;
//             end else begin
//                 state <= state;
//             end
//         end
//     end
// endmodule
