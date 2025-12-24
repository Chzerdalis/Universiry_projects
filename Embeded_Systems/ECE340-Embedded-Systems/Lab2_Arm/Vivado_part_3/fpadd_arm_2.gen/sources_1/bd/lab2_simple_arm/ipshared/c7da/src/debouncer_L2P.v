`timescale 1ns / 1ps

module Debouncer(clk, signal_in, signal_out);
    input clk, signal_in;
    output reg signal_out;

    reg [23:0] counter;

   always @(posedge clk) begin
        //if siganl_in remains high for 10000000 clk cycles then we output a stable 
        //signal until the singal_in becames zero
        if (signal_in) begin //if signal becames zero we restart the counter
            if (counter < 24'd10000000) begin
                counter <= counter + 1; //Signal has not been stable for enough time
                signal_out <= 0;
            end else begin
                counter <= counter; //Signal is stable -> we output 1
                signal_out <= 1;
            end
        end else begin
            counter <= 0;
            signal_out <= 0;
        end
    end
endmodule

//FSM for edge detection
module L2P(clk, multi_cycle_sig, single_cycle_sig);
    input clk, multi_cycle_sig;
    output reg single_cycle_sig;

    reg [1:0] current_state, next_state;

    //states
    localparam [1:0] 
        WAIT_FOR_SIGNAL  = 2'b00,
        GEN_SINGLE_CYCLE = 2'b01,
        WAIT_SIG_STOP    = 2'b10;
    
    always @ (posedge clk) begin
        if(multi_cycle_sig) begin //if the siganl in 1 the FSM works
            current_state <= next_state;
        end else begin
            current_state <= WAIT_FOR_SIGNAL; //if the signal is 0 the FSM waits for it to became 1
        end
    end

    always @ (*) begin
        case(current_state)
            WAIT_FOR_SIGNAL: begin //Signal is 0 while waiting
                single_cycle_sig = 0;
                if(multi_cycle_sig) begin
                    next_state <= GEN_SINGLE_CYCLE;
                end else begin
                    next_state <= current_state;
                end
            end
            GEN_SINGLE_CYCLE: begin
                single_cycle_sig = 1; //Is high for one clock cycle
                next_state <= WAIT_SIG_STOP;
            end
            WAIT_SIG_STOP: begin
                single_cycle_sig = 0; //Is zero and stays at this state until multi_cycle becames zero and reset the FSM
                next_state <= current_state;
            end
            default: begin
                single_cycle_sig = 0;
                next_state <= WAIT_FOR_SIGNAL;
            end
        endcase
    end
endmodule

//Module that connects debounce and edge detection
module Debounce_L2P(clk, signal_in, signal_out);
    input clk, signal_in;
    output signal_out;

    wire debounced_sig;

    Debouncer DB(.clk(clk), .signal_in(signal_in), .signal_out(debounced_sig));

    L2P L2P(.clk(clk), .multi_cycle_sig(debounced_sig), .single_cycle_sig(signal_out));
endmodule

