module serial_init #(
    parameter N = 16
)(
    input wire clk,
    input wire rst,
    input new_data,
    input wire [$clog2(N)-1:0] addr,
    input wire [31:0] data_in_real,
    input wire [31:0] data_in_imag,
    output wire [32*N-1:0] mem_out_real, // N x 32 bits
    output wire [32*N-1:0] mem_out_imag, // N x 32 bits
    output reg done
);
    reg signed [31:0] mem_real [0:N-1];
    reg signed [31:0] mem_imag [0:N-1];
    reg [$clog2(N)-1:0] write_ptr;
    reg [1:0] current_state , next_state;
    reg mem_write_enable;
    integer i;

    localparam [1:0] 
        IDLE            = 3'b00,
        READ_DATA       = 3'b01,
        DATA_READY      = 3'b10;

    always@(current_state or new_data or write_ptr) begin
        case(current_state) 
            IDLE:begin
                done = 0;
                mem_write_enable = 0;
                if(new_data) next_state = READ_DATA;
                else  next_state = IDLE;
            end
            READ_DATA:begin
                done = 0;
                mem_write_enable = 1;
                if(write_ptr == N - 1) next_state = DATA_READY;
                else next_state = current_state;
            end
            DATA_READY:begin
                mem_write_enable = 0;
                done = 1;
                next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
                mem_write_enable = 0;
                done = 0;
            end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            write_ptr <= 0;
            current_state <= IDLE;
            for (i = 0; i < N; i = i + 1) begin
                mem_imag[i] <= 0;
                mem_real[i] <= 0;
            end
        end else begin
            current_state <= next_state;
            if (mem_write_enable) begin
                write_ptr <= write_ptr + 1;
                for (i = 0; i < N; i = i + 1) begin
                    if(i == addr) begin
                        mem_imag[i] <= data_in_imag;
                        mem_real[i] <= data_in_real;
                    end else begin 
                        mem_real[i] <= mem_real[i];
                        mem_imag[i] <= mem_imag[i];
                    end
                end
            end else begin
                write_ptr <= write_ptr;
                for (i = 0; i < N; i = i + 1)
                    mem_real[i] <= mem_real[i];
                    mem_imag[i] <= mem_imag[i];
            end
        end
    end

    // Flatten the memory for output
    genvar idx;
    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : flatten
            assign mem_out_real[32*idx +: 32] = mem_real[idx];
            assign mem_out_imag[32*idx +: 32] = mem_imag[idx];
        end
    endgenerate
endmodule

module serial_output #(
    parameter N = 16
)(
    input wire clk,
    input wire rst,
    input start,
    output reg [$clog2(N)-1:0] addr,
    output reg signed [31:0] data_out_real,
    output reg signed [31:0] data_out_imag,
    input wire [32*N-1:0] mem_in_real, // N x 32 bits
    input wire [32*N-1:0] mem_in_imag, // N x 32 bits
    output reg valid
);
    reg [$clog2(N)-1:0] counter;
    reg [1:0] current_state , next_state;
    reg start_count;
    integer i;

    reg [$clog2(N)-1:0] addr_n;
    reg  valid_n;
    reg signed [31:0] data_out_real_n;
    reg signed [31:0] data_out_imag_n;

    localparam [1:0] 
        IDLE            = 3'b00,
        SEND_DATA       = 3'b01,
        DATA_READY      = 3'b10;

    always@(current_state or start or counter or mem_in_real or mem_in_imag) begin
        case(current_state) 
            IDLE:begin
                valid = 0;
                start_count = 0;
                addr = 0;
                data_out_real = 0;
                data_out_imag = 0;
                if(start) next_state = SEND_DATA;
                else  next_state = IDLE;
            end
            SEND_DATA:begin
                start_count = 1;
                data_out_real = $signed(mem_in_real[32*counter +: 32]);
                data_out_imag = $signed(mem_in_imag[32*counter +: 32]);
                addr = counter;
                valid = 1;
                if(counter == N - 1) next_state = DATA_READY;
                else next_state = current_state;
            end
            DATA_READY:begin
                start_count = 0;
                valid = 0;
                addr = 0;
                data_out_real = 0;
                data_out_imag = 0;
                next_state = IDLE;
            end
            default: begin
                start_count = 0;
                valid = 0;
                addr = 0;
                data_out_real = 0;
                data_out_imag = 0;
                next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
            if(start_count) begin
                counter <= counter + 1;
            end else begin
                counter <= counter;
            end
        end
    end
endmodule