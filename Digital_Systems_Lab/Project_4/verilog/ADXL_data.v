module ADXL_data(reset, clk, ADXL_OUT_ready, repeat_count_signal, c_ADXL_OUT, out_select, reg_X, reg_Y, reg_Z, reg_T);
    input reset, clk, ADXL_OUT_ready, repeat_count_signal; //Explained in Top module
    input [2:0] out_select;
    input signed [7:0] c_ADXL_OUT;

    //registers that save the unprosseced sum of 128 out values
    reg signed [15:0] sum_X, sum_Y, sum_Z;
    reg signed [15:0] sum_X_n, sum_Y_n, sum_Z_n;
    reg signed [19:0] sum_T, sum_T_n;
    reg [7:0] temp_L, temp_L_n;
    //counter to 127
    reg [6:0] counter;

    //Explained in Top module
    output reg signed [11:0] reg_X, reg_Y, reg_Z;
    output reg signed [17:0] reg_T;

    always @(ADXL_OUT_ready or out_select or c_ADXL_OUT or sum_X_n or sum_Y_n or sum_Z_n or sum_T_n) begin
        sum_X = sum_X_n; 
        sum_Y = sum_Y_n;
        sum_Z = sum_Z_n;
        temp_L = temp_L_n;
        sum_T = sum_T_n;

        //Depending on the out select we choose to what command the current output corresponds
        if (ADXL_OUT_ready) begin
            case (out_select)
                3'b011: sum_X = sum_X_n + c_ADXL_OUT; // X-axis
                3'b100: sum_Y = sum_Y_n + c_ADXL_OUT; // Y-axis
                3'b101: sum_Z = sum_Z_n + c_ADXL_OUT; // Z-axis
                3'b110: temp_L = c_ADXL_OUT; //T low bits
                3'b111: sum_T = sum_T_n + {c_ADXL_OUT[3:0], temp_L_n}; //T high bits
            endcase
        end
    end

    //This always block helps to prevent from latches as these values have to be assigned and also saved
    always@ (posedge clk or posedge reset) begin
        if(reset || (counter == 'd127 && repeat_count_signal)) begin
            sum_X_n <= 0;
            sum_Y_n <= 0;
            sum_Z_n <= 0;
            sum_T_n <= 0;
            temp_L_n <= 0;
        end else begin
            sum_X_n <= sum_X;
            sum_Y_n <= sum_Y;
            sum_Z_n <= sum_Z;
            sum_T_n <= sum_T;
            temp_L_n <= temp_L;
        end
    end
    
    //When 128 bundles have been sent the module outputs the mean and normalized values of the sums
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            reg_X <= 0;
            reg_Y <= 0;
            reg_Z <= 0;
            reg_T <= 0;
        end else if(counter == 'd126 && repeat_count_signal) begin
            reg_X <= (sum_X_n>>7) * 16;
            reg_Y <= (sum_Y_n>>7) * 16;
            reg_Z <= (sum_Z_n>>7) * 16;
            reg_T <= (sum_T_n>>7) * 65;
        end 
    end

    //This counter counts 128 command bundles
    always@ (posedge clk or posedge reset) begin
        if(reset) begin
            counter <= 0;
        end else if(repeat_count_signal) begin
            counter <= counter + 1'b1;
        end
    end
endmodule