// Module: demo                                                                      //
// Description:                                                                      //
// This module is intended solely for demonstration purposes of the PuTTY interface. //
// It changes the data to be sent to the interface every 1 second.                   //

module demo (clk, reset, data_ready_for_printing,
            ascii_X1, ascii_X2, ascii_X3, ascii_X4,
            ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4,
            ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4,
            ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6,
            is_negative_X, is_negative_Y, is_negative_Z, is_negative_T
);
  
input clk;
input reset;

output reg data_ready_for_printing;
output [7:0] ascii_X1, ascii_X2, ascii_X3, ascii_X4;
output [7:0] ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4;
output [7:0] ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4;
output [7:0] ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6;
output is_negative_X, is_negative_Y, is_negative_Z, is_negative_T;

reg [7:0] data_to_send;
reg change;
reg [13:0] bin_X, bin_Y, bin_Z;
reg [19:0] bin_T;
reg [32:0] counter;

bin_to_ascii bin_to_ascii(reset, clk, bin_X, bin_Y, bin_Z, bin_T, ascii_X1, ascii_X2, ascii_X3, ascii_X4,
                ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4, ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4,
                ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6, is_negative_X, is_negative_Y, is_negative_Z, is_negative_T);

// change every 1 second the data to be sent to the interface //
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
    begin
        counter <= 32'b0;
        change <= 1'd0;
        bin_X <= 0;
        bin_Y <= 0;
        bin_Z <= 0;
        bin_T <= 0;
        data_ready_for_printing <= 1'd0;
    end
    else
    begin
        if (counter == 'd100_000_000)
        begin
            change <= ~change;
            bin_X <= (change == 1'd0) ? 14'b00011000100001 : 14'b11100111011111;
            bin_Y <= (change == 1'd0) ? 14'b00011010000101 : 14'b11100101111011;
            bin_Z <= (change == 1'd0) ? 14'b00011101101011 : 14'b11100010010101;
            bin_T <= (change == 1'd0) ? 20'b00100011100111101001 : 20'b11011100011000010111;
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