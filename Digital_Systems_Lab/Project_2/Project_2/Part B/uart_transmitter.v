`timescale 1ns/1ps
//This module transmits the data with a state machine 
module uart_transmitter(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    input reset, clk;
    input [7:0] Tx_DATA;
    input [2:0] baud_select;
    input Tx_EN;
    input Tx_WR;
    output reg TxD;
    output reg Tx_BUSY;

    wire sample_ENABLE;
    wire [3:0] ENABLE_count;
    wire parity_bit;

    localparam [3:0] 
        IDLE        = 4'b0000,
        START_BIT   = 4'b0001,
        FIRST_BIT   = 4'b0010,
        SECOND_BIT  = 4'b0011,
        THIRD_BIT   = 4'b0100,
        FOURTH_BIT  = 4'b0101,
        FIFTH_BIT   = 4'b0110,
        SIXTH_BIT   = 4'b0111,
        SEVENTH_BIT = 4'b1000,
        EIGHTH_BIT  = 4'b1001,
        PARITY_BIT  = 4'b1010,
        STOP_BIT    = 4'b1011,
        OFF         = 4'b1100;

    reg [3:0] current_state, next_state;
    //dedicated baud countroller that provides the transiter with Tx_sample_enable
    baud_controller baud_controller_tx_inst(.reset(reset), .clk(clk), .baud_select(baud_select), .sample_ENABLE(sample_ENABLE), .enable(Tx_EN));
    //counts the sample_enables
    transmit_counter counter(clk, reset, ENABLE_count, sample_ENABLE, Tx_WR);
    //calculates the parity bit for the parity state
    assign parity_bit = Tx_DATA[7] + Tx_DATA[6] + Tx_DATA[5] + Tx_DATA[4] + Tx_DATA[3] + Tx_DATA[2] + Tx_DATA[1] + Tx_DATA[0];

    //State changer
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            current_state <= OFF;
        end else begin
            current_state <= next_state;
        end
    end

    //Next state combinational
    always @(ENABLE_count or sample_ENABLE or current_state or Tx_WR or Tx_EN or Tx_DATA or parity_bit) begin
        case(current_state)
            OFF: begin
                TxD = 1'b1;
                Tx_BUSY = 1'b0;
                if(Tx_EN == 1'b1) begin                 //OFF state is when the Tx_EN is not active 
                    next_state = IDLE;
                end else begin
                    next_state = current_state;
                end
            end
            IDLE: begin
                TxD = 1'b1;
                Tx_BUSY = 1'b0;
                if(Tx_EN == 0) begin
                    next_state = OFF;
                end else if(Tx_WR == 1'b1) begin        //Waits for Tx_WR to start trasmiting
                    next_state = START_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            START_BIT: begin
                TxD = 1'b0;
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin  //Sends the start bit and after 16 sampling cycles it moves to the next
                    next_state = FIRST_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            FIRST_BIT: begin
                TxD = Tx_DATA[7];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin  //Sends the MSB and after 16 sampling cycles it moves to the next
                    next_state = SECOND_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            SECOND_BIT: begin
                TxD = Tx_DATA[6];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin
                    next_state = THIRD_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            THIRD_BIT: begin
                TxD = Tx_DATA[5];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin
                    next_state = FOURTH_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            FOURTH_BIT: begin
                TxD = Tx_DATA[4];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin
                    next_state = FIFTH_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            FIFTH_BIT: begin
                TxD = Tx_DATA[3];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin
                    next_state = SIXTH_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            SIXTH_BIT: begin
                TxD = Tx_DATA[2];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin
                    next_state = SEVENTH_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            SEVENTH_BIT: begin
                TxD = Tx_DATA[1];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin
                    next_state = EIGHTH_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            EIGHTH_BIT: begin
                TxD = Tx_DATA[0];
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin //Sends the LSB and after 16 sampling cycles it moves to the parity bit
                    next_state = PARITY_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            PARITY_BIT: begin
                TxD = parity_bit;
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin //Sends the parity bit
                    next_state = STOP_BIT;
                end else begin
                    next_state = current_state;
                end
            end
            STOP_BIT: begin
                TxD = 1'b1;
                Tx_BUSY = 1'b1;
                if(ENABLE_count == 4'b1111 && sample_ENABLE == 1'b1) begin //Sends the stop bit
                    next_state = IDLE;
                end else begin
                    next_state = current_state;
                end
            end
            default: begin
                TxD = 1'b1;
                Tx_BUSY = 1'b0;
                next_state = IDLE;
            end
        endcase
    end
endmodule
