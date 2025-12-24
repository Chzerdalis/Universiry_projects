// Top module for accelerometer driver //

module accelerometer_driver (clk, reset, TxD, CS, MISO, SCLK, MOSI);
    input clk, reset, MISO;
    output TxD, CS, SCLK, MOSI;

    wire [7:0] ascii_X1, ascii_X2, ascii_X3, ascii_X4;
    wire [7:0] ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4;
    wire [7:0] ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4;
    wire [7:0] ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6;
    wire is_negative_X, is_negative_Y, is_negative_Z, is_negative_T;

    reg data_ready_for_printing;

    debounce_sync debounce(.clk(clk), .sign_in(reset), .sig_out(reset_db));

    uart_transmitter_data_control uart_transmitter_data_control_inst(.clk(clk), .reset(reset_db), .TxD(TxD), .start_transmission(1'b1), .data_ready_for_printing(data_ready_for_printing),
    .ascii_X1(ascii_X1), .ascii_X2(ascii_X2), .ascii_X3(ascii_X3), .ascii_X4(ascii_X4),
    .ascii_Y1(ascii_Y1), .ascii_Y2(ascii_Y2), .ascii_Y3(ascii_Y3), .ascii_Y4(ascii_Y4),
    .ascii_Z1(ascii_Z1), .ascii_Z2(ascii_Z2), .ascii_Z3(ascii_Z3), .ascii_Z4(ascii_Z4),
    .ascii_T1(ascii_T1), .ascii_T2(ascii_T2), .ascii_T3(ascii_T3), .ascii_T4(ascii_T4), .ascii_T5(ascii_T5), .ascii_T6(ascii_T6),
    .is_negative_X(is_negative_X), .is_negative_Y(is_negative_Y), .is_negative_Z(is_negative_Z), .is_negative_T(is_negative_T)
    );

    wire ADXL_OUT_ready; //Tells us when data is ready from the SPI
    wire repeat_count_signal; //Used to count how many times has the bundle of commands have been sent
    wire [2:0] out_select; //Chooses from which command the output is
    wire [23:0] c_ADXL_OUT; //Output from SPI data from ADXL

    reg [11:0] bin_X, bin_Y, bin_Z; //Regs that keep the same value for one second
    reg [17:0] bin_T;
    reg [32:0] counter; //Counts to 1 sec
    wire [11:0] reg_X, reg_Y, reg_Z; //These are the outputs from when 128 command bundles have been sent and these regs 
    wire [17:0] reg_T;               //contain the mean and normalized value of all the 128 outputs

    //These module sends the commands thought the SPI to the accelerometer
    command_driver command_driver(.reset(reset_db), .clk(clk), .CS(CS),
    .MISO(MISO), .SCLK(SCLK), .MOSI(MOSI), .ADXL_OUT_ready(ADXL_OUT_ready), 
    .c_ADXL_OUT(c_ADXL_OUT), .out_select(out_select), .repeat_count_signal(repeat_count_signal));

    //This module converts a binary integer into its ascii values
    bin_to_ascii bin_to_ascii(.reset(reset_db), .clk(clk), .bin_X(bin_X), .bin_Y(bin_Y), .bin_Z(bin_Z), .bin_T(bin_T), 
    .ascii_X1(ascii_X1), .ascii_X2(ascii_X2), .ascii_X3(ascii_X3), .ascii_X4(ascii_X4), .ascii_Y1(ascii_Y1), 
    .ascii_Y2(ascii_Y2), .ascii_Y3(ascii_Y3), .ascii_Y4(ascii_Y4), .ascii_Z1(ascii_Z1), .ascii_Z2(ascii_Z2), 
    .ascii_Z3(ascii_Z3), .ascii_Z4(ascii_Z4), .ascii_T1(ascii_T1), .ascii_T2(ascii_T2), .ascii_T3(ascii_T3), 
    .ascii_T4(ascii_T4), .ascii_T5(ascii_T5), .ascii_T6(ascii_T6), .is_negative_X(is_negative_X), 
    .is_negative_Y(is_negative_Y), .is_negative_Z(is_negative_Z), .is_negative_T(is_negative_T));

    //This module is responsible for finding the mean values and the normalize them
    ADXL_data ADXL_data(.reset(reset_db), .clk(clk), .ADXL_OUT_ready(ADXL_OUT_ready), .repeat_count_signal(repeat_count_signal), 
    .c_ADXL_OUT(c_ADXL_OUT[7:0]), .out_select(out_select), .reg_X(reg_X), .reg_Y(reg_Y), .reg_Z(reg_Z), .reg_T(reg_T));

    //Here we change the value of the bin registers with a counter that counts up to one second 
    //And then we enable the UART transmition to send the data to the board
    always @ (posedge clk or posedge reset_db)
    begin
        if (reset_db == 1'b1)
        begin
            counter <= 32'b0;
            bin_X <= 0;
            bin_Y <= 0;
            bin_Z <= 0;
            bin_T <= 0;
            data_ready_for_printing <= 1'd0;
        end
        else
        begin
            if (counter == 'd100_000_000) //100_000_000
            begin
                bin_X <= reg_X;
                bin_Y <= reg_Y;
                bin_Z <= reg_Z;
                bin_T <= reg_T;
                data_ready_for_printing <= 1'd1;
                counter <= 0;
            end
            else
            begin
                counter <= counter + 1'b1;
                data_ready_for_printing <= 1'd0;
            end
        end
    end
endmodule
