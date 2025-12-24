module command_driver(reset, clk, CS, MISO, SCLK, MOSI, ADXL_OUT_ready, c_ADXL_OUT, out_select, repeat_count_signal);
    input clk, reset, MISO;
    output CS, MOSI, SCLK, ADXL_OUT_ready;
    output [23:0] c_ADXL_OUT;

    reg start_command; //Starts the spi_controller FSM
    reg [23:0] COMMAND; 

    reg en_count; //Enables counter
    output reg [2:0] out_select; //Depending on the command this has diff vals in order to differentiate the outs
    output reg repeat_count_signal; //Every time an FSM loop happens this enables for one clock cycle
    reg [18:0] counter; 
    wire [23:0] commands [10:0]; //Memory with the needed commands

    //Hex values of commands sent to the accelerometer
    assign commands[0] = 24'h0A_1F_52; //SOFT_RESET
    assign commands[1] = 24'h0A_1F_00; //STOP_RESET
    assign commands[2] = 24'h0A_2D_02; //EN_measure
    assign commands[3] = 24'h0A_2C_14; //FILTER_control
    assign commands[4] = 24'h0B_00_00; //READ_0x00
    assign commands[5] = 24'h0B_01_00; //READ_0x01
    assign commands[6] = 24'h0B_08_00; //READ_X
    assign commands[7] = 24'h0B_09_00; //READ_Y
    assign commands[8] = 24'h0B_0A_00; //READ_Z
    assign commands[9] = 24'h0B_14_00; //READ_T_L
    assign commands[10]= 24'h0B_15_00; //READ_T_H

    reg [3:0] c_state_command_dr, n_state_command_dr;

    localparam [3:0] 
        Setup_mmcm      = 4'b0000,
        SOFT_RESET      = 4'b0001,
        WAIT            = 4'b0010,
        STOP_RESET      = 4'b0011,
        EN_measure      = 4'b0100,
        FILTER_control  = 4'b0101,
        READ_0x00       = 4'b0110,
        READ_0x01       = 4'b0111,
        REPEAT          = 4'b1000,
        READ_X          = 4'b1001,
        READ_Y          = 4'b1010,
        READ_Z          = 4'b1011,
        READ_T_L        = 4'b1100,
        READ_T_H        = 4'b1101,
        WAIT_2          = 4'b1110;

    always@(ADXL_OUT_ready or c_state_command_dr or counter) begin
        case(c_state_command_dr)
            //Wait for the mmcm clock to stabalize
            Setup_mmcm:begin
                repeat_count_signal = 0;
                out_select = 0;
                en_count = 1;
                COMMAND = 0;
                start_command = 0;
                if(counter == 'd40) n_state_command_dr = SOFT_RESET;
                else n_state_command_dr = c_state_command_dr;
            end
            SOFT_RESET:begin
                repeat_count_signal = 0;
                out_select = 0;
                en_count = 0;
                COMMAND = commands[0];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = WAIT; //if ADXL_OUT_ready means that the command has been processed from the ADXL
                else n_state_command_dr = c_state_command_dr;
            end
            WAIT:begin
                repeat_count_signal = 0;
                out_select = 0;
                en_count = 1;
                COMMAND = commands[0];
                start_command = 0;
                if(counter == 'd50000) n_state_command_dr = STOP_RESET; //Wait for values in registers to reset
                else n_state_command_dr = c_state_command_dr;
            end
            STOP_RESET:begin
                repeat_count_signal = 0;
                out_select = 0;
                en_count = 0;
                COMMAND = commands[1];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = EN_measure;
                else n_state_command_dr = c_state_command_dr;
            end
            EN_measure:begin
                repeat_count_signal = 0;
                out_select = 0;
                en_count = 0;
                COMMAND = commands[2];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = FILTER_control;
                else n_state_command_dr = c_state_command_dr;
            end
            FILTER_control:begin
                repeat_count_signal = 0;
                out_select = 0;
                en_count = 0;
                COMMAND = commands[3];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_0x00;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_0x00:begin
                repeat_count_signal = 0;
                out_select = 3'b001; //Change the out_sel based on the current command 
                en_count = 0;
                COMMAND = commands[4];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_0x01;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_0x01:begin
                repeat_count_signal = 0;
                out_select = 3'b010;
                en_count = 0;
                COMMAND = commands[5];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_X;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_X:begin
                repeat_count_signal = 0;
                out_select = 3'b011;
                en_count = 0;
                COMMAND = commands[6];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_Y;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_Y:begin
                repeat_count_signal = 0;
                out_select = 3'b100;
                en_count = 0;
                COMMAND = commands[7];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_Z;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_Z:begin
                repeat_count_signal = 0;
                out_select = 3'b101;
                en_count = 0;
                COMMAND = commands[8];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_T_L;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_T_L:begin
                repeat_count_signal = 0;
                out_select = 3'b110;
                en_count = 0;
                COMMAND = commands[9];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = READ_T_H;
                else n_state_command_dr = c_state_command_dr;
            end
            READ_T_H:begin
                repeat_count_signal = 0;
                out_select = 3'b111;
                en_count = 0;
                COMMAND = commands[10];
                start_command = 1;
                if(ADXL_OUT_ready) n_state_command_dr = REPEAT;
                else n_state_command_dr = c_state_command_dr;
            end
            REPEAT:begin
                repeat_count_signal = 1'b1; //This state exists to enable this wire for one clock cycle
                out_select = 0;
                en_count = 1;
                COMMAND = commands[0];
                start_command = 0;
                n_state_command_dr = WAIT_2;
            end
            WAIT_2:begin
                repeat_count_signal = 0; //Wait for the values ion the ADXL to renew
                out_select = 0;
                en_count = 1;
                COMMAND = commands[0];
                start_command = 0;
                if(counter == 'd500000) n_state_command_dr = READ_X; //500000
                else n_state_command_dr = c_state_command_dr;
            end
            default:begin
                repeat_count_signal = 0;
                out_select = 2'b0;
                en_count = 1;
                COMMAND = commands[0];
                start_command = 0;
                n_state_command_dr = SOFT_RESET;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if(reset) c_state_command_dr <= 0;
        else c_state_command_dr <= n_state_command_dr;                 
    end
    //Counts to 5ms
    always@(posedge clk or posedge reset) begin
        if(en_count)begin
            if(reset)  counter <= 0;
            else counter <= counter + 1'b1;
        end else begin
            counter <= 0;
        end
    end
    //Module that uses the SPI to send 3 bytes that equal a command
    SPI_controller SPI_controller(.reset(reset), .clk(clk), .CS(CS), .MISO(MISO), .MOSI(MOSI), .SCLK(SCLK), 
    .ADXL_OUT_ready(ADXL_OUT_ready), .c_ADXL_OUT(c_ADXL_OUT), .start_command(start_command), .COMMAND(COMMAND));
endmodule