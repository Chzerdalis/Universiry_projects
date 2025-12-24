`timescale 1ns/1ps

module bin_to_bcd_T(reset, clk, bin, bcd);
input   clk, reset;
input   [16:0] bin;
output reg [23:0] bcd;
reg     [23:0] bcd_1, bcd_2;
integer i, j;
	
always @(bin) begin
    bcd_1=0;		 	
    for (i=0;i<10;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd_1[3:0] >= 5) bcd_1[3:0] = bcd_1[3:0] + 3;		//If any bcd_next digit is >= 5, add three
	    if (bcd_1[7:4] >= 5) bcd_1[7:4] = bcd_1[7:4] + 3;
	    if (bcd_1[11:8] >= 5) bcd_1[11:8] = bcd_1[11:8] + 3;
	    if (bcd_1[15:12] >= 5) bcd_1[15:12] = bcd_1[15:12] + 3;
        if (bcd_1[19:16] >= 5) bcd_1[19:16] = bcd_1[19:16] + 3;
        if (bcd_1[23:20] >= 5) bcd_1[23:20] = bcd_1[23:20] + 3;
	    bcd_1 = {bcd_1[22:0],bin[16-i]};				//Shift one bit, and shift in proper bit from input 
    end
end

//This is a pipeline 
//It is implemented becase this combinational circuit had clock valiotions 
//with a 10ns period as the logic was to large 
always @(posedge clk or posedge reset) begin
    if(reset) begin
        bcd_2 <= 0;
    end else begin
        bcd_2 <= bcd_1;
    end 
end

always @(bcd_2) begin	
    bcd = bcd_2; 	
    for (j=10;j<17;j=j+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any bcd digit is >= 5, add three
	    if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	    if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	    if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
        if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
        if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
	    bcd = {bcd[22:0],bin[16-j]};				//Shift one bit, and shift in proper bit from input 
    end
end

endmodule