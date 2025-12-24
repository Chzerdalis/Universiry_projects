`timescale 1ns/1ps

module bin_to_ascii(reset, clk, bin_X, bin_Y, bin_Z, bin_T, 
            ascii_X1, ascii_X2, ascii_X3, ascii_X4,
            ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4,
            ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4,
            ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6,
            is_negative_X, is_negative_Y, is_negative_Z, is_negative_T);

    input clk, reset;
    input [11:0] bin_X, bin_Y, bin_Z; //One extra beacause it is singed
    input [17:0] bin_T;

    output [7:0] ascii_X1, ascii_X2, ascii_X3, ascii_X4;
    output [7:0] ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4;
    output [7:0] ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4;
    output [7:0] ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6;
    output reg is_negative_X, is_negative_Y, is_negative_Z, is_negative_T;

    wire [15:0] bcd_X, bcd_Y, bcd_Z;
    wire [23:0] bcd_T;
    reg  [10:0] bin_X_positive, bin_Y_positive, bin_Z_positive; //One extra beacause it is singed
    reg  [16:0] bin_T_positive;

    //Check if negative and gine only the positive part to the bcd algorithm
    always@(*) begin
        if(bin_X[11] == 1) begin //means negative
            bin_X_positive = ~bin_X[10:0] + 1'b1;
            is_negative_X = 1'b1;
        end else begin
            bin_X_positive = bin_X[10:0];
            is_negative_X = 0;
        end

        if(bin_Y[11] == 1) begin //means negative
            bin_Y_positive = ~bin_Y[10:0] + 1'b1;
            is_negative_Y = 1'b1;
        end else begin
            bin_Y_positive = bin_Y[10:0];
            is_negative_Y = 0;
        end

        if(bin_Z[11] == 1) begin //means negative
            bin_Z_positive = ~bin_Z[10:0] + 1'b1;
            is_negative_Z = 1'b1;
        end else begin
            bin_Z_positive = bin_Z[10:0];
            is_negative_Z = 0;
        end

        if(bin_T[17] == 1) begin //means negative
            bin_T_positive = ~bin_T[16:0] + 1'b1;
            is_negative_T = 1'b1;
        end else begin
            bin_T_positive = bin_T[16:0];
            is_negative_T = 0;
        end
    end
    //Takes the abs values and converts then to bcd
    bin_to_bcd      bin_to_bcd_X(.bin(bin_X_positive), .bcd(bcd_X));
    bin_to_bcd      bin_to_bcd_Y(.bin(bin_Y_positive), .bcd(bcd_Y));
    bin_to_bcd      bin_to_bcd_Z(.bin(bin_Z_positive), .bcd(bcd_Z));
    bin_to_bcd_T    bin_to_bcd_T(.reset(reset), .clk(clk), .bin(bin_T_positive), .bcd(bcd_T));

    //Converts to ascii
    assign ascii_X1 = bcd_X[15:12]  + 'h30;
    assign ascii_X2 = bcd_X[11:8]   + 'h30;
    assign ascii_X3 = bcd_X[7:4]    + 'h30;
    assign ascii_X4 = bcd_X[3:0]    + 'h30;
    assign ascii_Y1 = bcd_Y[15:12]  + 'h30;
    assign ascii_Y2 = bcd_Y[11:8]   + 'h30;
    assign ascii_Y3 = bcd_Y[7:4]    + 'h30;
    assign ascii_Y4 = bcd_Y[3:0]    + 'h30;
    assign ascii_Z1 = bcd_Z[15:12]  + 'h30;
    assign ascii_Z2 = bcd_Z[11:8]   + 'h30;
    assign ascii_Z3 = bcd_Z[7:4]    + 'h30;
    assign ascii_Z4 = bcd_Z[3:0]    + 'h30;
    assign ascii_T1 = bcd_T[23:20]  + 'h30;
    assign ascii_T2 = bcd_T[19:16]  + 'h30;
    assign ascii_T3 = bcd_T[15:12]  + 'h30;
    assign ascii_T4 = bcd_T[11:8]   + 'h30;
    assign ascii_T5 = bcd_T[7:4]    + 'h30;
    assign ascii_T6 = bcd_T[3:0]    + 'h30;
endmodule