`timescale 1ns/1ps 

module uart_receiver_perror(reset, clk, Rx_DATA, baud_select, Rx_EN, RxD, Rx_FERROR, Rx_PERROR, Rx_VALID);
    input reset, clk;
    input [2:0] baud_select;
    input Rx_EN;
    input RxD;
    output reg [7:0] Rx_DATA;
    output reg Rx_FERROR; //Framing Error//
    output reg Rx_PERROR; //Parity Error//
    output reg Rx_VALID; //Rx_DATA is Valid//
    reg [7:0] next_Rx_DATA;
    reg [3:0] current_state, next_state;
    reg count_ENABLE;
    wire [7:0] receive_counter;
    wire parity;

    localparam [2:0] 
        IDLE        = 4'b000,
        START_BIT   = 4'b001,
        DATA_BITS   = 4'b010,
        PARITY_BIT  = 4'b011,
        STOP_BIT    = 4'b100,
        VALID       = 4'b101;

    baud_controller baud_controller_rx_inst(.reset(reset), .clk(clk), .baud_select(baud_select), .sample_ENABLE(Rx_sample_ENABLE), .enable(Rx_EN));
    receive_timing receive_data(.clk(clk), .reset(reset), .count_ENABLE(count_ENABLE), .sample_ENABLE(Rx_sample_ENABLE), .receive_counter(receive_counter));
    assign parity = !(^Rx_DATA); 

    //State changer
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            current_state <= IDLE;
            Rx_DATA <= 0;
        end else begin
            current_state <= next_state;
            Rx_DATA <= next_Rx_DATA;
        end
    end

    always @(Rx_DATA or Rx_sample_ENABLE or RxD or receive_counter or parity or current_state or Rx_EN) begin
        count_ENABLE = 1'b1;
        Rx_VALID = 0;
        Rx_PERROR = 0;
        Rx_FERROR = 0;
        case(current_state)
            IDLE: begin
                if(RxD == 0 && Rx_EN) begin
                    next_state = START_BIT;
                    next_Rx_DATA = 0;
                end else begin
                    count_ENABLE = 1'b0;
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end
            end

            START_BIT: begin
                if(Rx_sample_ENABLE == 1'b1) begin
                    if(receive_counter == 15) begin
                        next_state = DATA_BITS;
                        next_Rx_DATA = Rx_DATA;
                    end else begin
                        if(RxD == 0) begin
                            next_state = current_state;
                            next_Rx_DATA = Rx_DATA;
                        end else begin
                            Rx_FERROR = 1;
                            next_state = IDLE;
                            count_ENABLE = 0;
                            next_Rx_DATA = 0;
                        end
                    end
                end else begin
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end
            end

            DATA_BITS: begin
                if(Rx_sample_ENABLE == 1'b1) begin
                    if(receive_counter == 143) begin
                        next_state = PARITY_BIT;
                        next_Rx_DATA = Rx_DATA;
                    end else if(receive_counter == 16 || receive_counter == 32 || receive_counter == 48  || receive_counter == 64 ||
                                receive_counter == 80 || receive_counter == 96 || receive_counter == 112 || receive_counter == 128) 
                    begin
                        next_Rx_DATA = (Rx_DATA << 1) + RxD;
                        next_state = current_state;
                    end else begin
                        if(Rx_DATA[0] == RxD) begin
                            next_state = current_state;
                            next_Rx_DATA = Rx_DATA;
                        end else begin
                            Rx_FERROR = 1'b1;
                            next_state = IDLE;
                            count_ENABLE = 0;
                            next_Rx_DATA = 0;
                        end 
                    end
                end else begin
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end
            end

            PARITY_BIT: begin
                if(Rx_sample_ENABLE == 1'b1) begin
                    if(receive_counter == 159) begin
                        next_state = STOP_BIT;
                        next_Rx_DATA = Rx_DATA;
                    end else if(receive_counter == 144) begin
                        if(RxD == parity) begin
                            next_state = current_state;
                            next_Rx_DATA = Rx_DATA;
                        end else begin
                            Rx_PERROR = 1'b1;
                            next_state = IDLE;
                            count_ENABLE = 0;
                            next_Rx_DATA = 0;
                        end
                    end else begin
                        if(parity == RxD) begin
                            next_state = current_state;
                                next_Rx_DATA = Rx_DATA;
                        end else begin
                            Rx_FERROR = 1'b1;
                            next_state = IDLE;
                            count_ENABLE = 0;
                            next_Rx_DATA = 0;
                        end
                    end
                end else begin
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end
            end

            STOP_BIT: begin
                if(Rx_sample_ENABLE == 1'b1) begin
                    if(receive_counter == 175) begin
                        next_state = VALID;
                        count_ENABLE = 0;
                        next_Rx_DATA = Rx_DATA;
                    end else begin
                        if(RxD == 1) begin
                            next_state = current_state;
                            next_Rx_DATA = Rx_DATA;
                        end else begin
                            Rx_FERROR = 1'b1;
                            next_state = IDLE;
                            count_ENABLE = 0;
                            next_Rx_DATA = 0;
                        end
                    end
                end else begin
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end
            end

            VALID: begin
                if(RxD) begin
                    Rx_VALID = 1;
                    count_ENABLE = 0;
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end else begin
                    Rx_VALID = 0;
                    next_state = START_BIT;
                    next_Rx_DATA = 0;
                end
            end

            default: begin
                next_state = IDLE;
                next_Rx_DATA = 0;
                count_ENABLE = 0;
            end
        endcase
    end
endmodule