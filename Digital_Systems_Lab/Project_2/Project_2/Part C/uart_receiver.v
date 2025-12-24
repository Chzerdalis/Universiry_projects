`timescale 1ns/1ps 

module uart_receiver(reset, clk, Rx_DATA, baud_select, Rx_EN, RxD, Rx_FERROR, Rx_PERROR, Rx_VALID);
    input reset, clk;
    input [2:0] baud_select;
    input Rx_EN;
    input RxD;
    output reg [7:0] Rx_DATA;
    output reg Rx_FERROR;   //Framing Error//
    output reg Rx_PERROR;   //Parity Error//
    output reg Rx_VALID;    //Rx_DATA is Valid//
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
    //Provides the reciever with the sampling time
    baud_controller baud_controller_rx_inst(.reset(reset), .clk(clk), .baud_select(baud_select), .sample_ENABLE(Rx_sample_ENABLE), .enable(Rx_EN));
    //Counts the number of samples
    receive_timing receive_data(.clk(clk), .reset(reset), .count_ENABLE(count_ENABLE), .sample_ENABLE(Rx_sample_ENABLE), .receive_counter(receive_counter));
    //Calculates from recieved data the parity bits that should be transmited
    assign parity = ^Rx_DATA; 

    //State changer
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            current_state <= IDLE;
            Rx_DATA <= 0; 
        end else begin
            current_state <= next_state;
            Rx_DATA <= next_Rx_DATA; //We use a flip flop to store the data that is received in order to avoid having a lacht
        end
    end

    //State machine
    always @(Rx_DATA or Rx_sample_ENABLE or RxD or receive_counter or parity or current_state or Rx_EN) begin
        count_ENABLE = 1'b1;
        Rx_VALID = 0;
        Rx_PERROR = 0;
        Rx_FERROR = 0;
        case(current_state)
            IDLE: begin
                if(RxD == 0 && Rx_EN) begin
                    next_state = START_BIT;      //If the module is enabled and its recieves the start bit moves to the start state
                    next_Rx_DATA = 0;
                end else begin
                    count_ENABLE = 1'b0;
                    next_state = current_state;  //else stays in this state and does nothing
                    next_Rx_DATA = Rx_DATA;
                end
            end

            //Here with every sample enable it checks if the RxD remains 0 until the
            //end of the start_bit sate of the transmiter and if not that means framing error
            //if receive count is 15 that means that the transmiter should have stopped
            //transmiting the start bit

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

            //This state recieves and manages the incaming date. Firstly with the sampling that we have guaranteed 
            //corresponds to the first of every bit we sample the Data. After that with every bext sampling we compare
            //the new data to the previous and if different that means Framing eroor. Lastly with the sample
            //that corresponds the last that belongs to the transmiting state we move on to the parity bit

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

            //Similarly with the first sample the sample the parity bit and check its validity with the oine calculated
            //from the recieved data, if not same that means parity error. After that with every sample we check for 
            //framing errors and lastly change the state with the last sample

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

            //The a start bit but at the end if no eroors have occured that means that the transmition is valid 
            //and ew move on to the valid state

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

            //In this state if no new start bit is detected nothing happens, else if a new start bit is detected 
            //we move to start_bit state and start sampling, else if is Rx_EN is 0 then we move to IDLE
            //ans remain there

            VALID: begin
                if(Rx_EN == 0) begin
                    next_state = IDLE;
                    Rx_VALID = 1;
                    next_Rx_DATA = Rx_DATA;
                    count_ENABLE = 0;
                end else if(RxD) begin
                    Rx_VALID = 1;
                    count_ENABLE = 0;
                    next_state = current_state;
                    next_Rx_DATA = Rx_DATA;
                end else begin        
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