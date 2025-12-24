`timescale 1ns / 1ps

module Data_mem(clk, reset, button, A, B);
    input button, clk, reset;
    output [31:0] A, B;

    reg [63:0]mem[7:0];
    reg [2:0] pointer;

    //Counter that increases when the button signal is high
    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            pointer <= 0;
        end else begin
            if(button) begin
                pointer <= pointer + 1;
            end else begin
                pointer <= pointer;
            end
        end
    end

    //Memory is initialized on reset
    always @ (posedge clk or posedge reset) begin
            if(reset) begin
                mem[0] <= 64'h3f80000040000000;
                mem[1] <= 64'hbf8000003f800000;
                mem[2] <= 64'hc2de800045155e00;
                mem[3] <= 64'h6b64b2356ac49214;
                mem[4] <= 64'h2ac492146ac49214;
                mem[5] <= 64'hbfc666663fc7ae14;
                mem[6] <= 64'hc565ee8b4565ee8a;
                mem[7] <= 64'h447a4efac47a1ccd;
            end else begin
                mem[0] <= mem[0];
                mem[1] <= mem[1];
                mem[2] <= mem[2];
                mem[3] <= mem[3];
                mem[4] <= mem[4];
                mem[5] <= mem[5];
                mem[6] <= mem[6];
                mem[7] <= mem[7];
            end
    end

    //Assign output depending on the value of the pointer
    assign A = mem[pointer][63:32];
    assign B = mem[pointer][31:0];
endmodule