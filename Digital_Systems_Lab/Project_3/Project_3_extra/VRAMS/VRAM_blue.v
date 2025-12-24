`timescale 1ns/1ps

module vram_blue(reset, clk, address, blue);
    input clk, reset;
    input [13:0] address;
    output blue;
    wire input_data, ram_enable, reg_enable, write_enable;

    assign input_data = 0;
    assign ram_enable = 1'b1;
    assign reg_enable = 0;
    assign write_enable = 0;

    BRAM_SINGLE_MACRO #(
        .BRAM_SIZE("18Kb"), // Target BRAM, "18Kb" or "36Kb" 
        .DEVICE("7SERIES"), // Target Device: "7SERIES" 
        .DO_REG(0), // Optional output register (0 or 1)
        .INIT(36'h000000000), // Initial values on output port
        .INIT_FILE ("NONE"),
        .WRITE_WIDTH(1), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
        .READ_WIDTH(1),  // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
        .SRVAL(36'h000000000), // Set/Reset value for port output
        .WRITE_MODE("READ_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
        
        .INIT_00(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_02(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_04(256'hffffc7ffffffffffffffffffffffffff_ffff00003fffffffffffffffffffffff),
        .INIT_05(256'hfffe00001fffffffffffffffffffffff_fffe00000fffffffffffffffffffffff),
        .INIT_06(256'hfffe000007ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_07(256'hfffe000007ffffffffffffffffffffff_fffe00000fffffffffffffffffffffff),
        .INIT_08(256'hfffe000007ffffffffffffffffffffff_fffe000007ffffffffffffffffffffff),
        .INIT_09(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_0A(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_0B(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_0C(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_0D(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_0E(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_0F(256'hfffe000003ffffffffffffffffffffff_fffe000003ffffffffffffffffffffff),
        .INIT_10(256'hfffe000003ffffffffffffffffffffff_fffe000007ffffffffffffffffffffff),
        .INIT_11(256'hffff07ffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_12(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_14(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_16(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_18(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1A(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffff01c7ff),
        .INIT_1D(256'hfffffffffffffffffffffffff80003ff_fffffffffffffffffffffffff80001ff),
        .INIT_1E(256'hfffffffffffffffffffffffff80001ff_fffffffffffffffffffffffff80001ff),
        .INIT_1F(256'hfffffffffffffffffffffffff80001ff_fffffffffffdfffffffffffff80001ff),
        .INIT_20(256'hfffffffffffffffffffffffff80001ff_fffffffffffffffffffffffff80001ff),
        .INIT_21(256'hfffffffffffffffffffffffff80001ff_fffffffffffffffffffffffff80001ff),
        .INIT_22(256'hfffffffffffffffffffffffff80001ff_ffffffffffffffffffffdffff80001ff),
        .INIT_23(256'hfffffffffffffffffffffffff80001ff_fffffffffffffffffffffffff80001ff),
        .INIT_24(256'hfffffffffffffffffffffffff80000ff_fffffffffffffffffffffffff80000ff),
        .INIT_25(256'hfffffffffffffffffffffffff80000ff_fffffffffffffffffffffffff80000ff),
        .INIT_26(256'hfffffffffffffffffffffffff800007f_fffffffffffffffffffffffff80000ff),
        .INIT_27(256'hfffffffffffffffffffffffff87fffff_ffffffffffffffffffffffffffffffff),
        .INIT_28(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_29(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_2A(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_2B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_2C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_2D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_2E(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_2F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff)   
    ) BRAM_SINGLE_MACRO_inst (
        .DO(blue),       // Output data, width defined by READ_WIDTH parameter
        .ADDR(address),   // Input address, width defined by read/write port depth
        .CLK(clk),     // 1-bit input clock
        .DI(input_data),       // Input data port, width defined by WRITE_WIDTH parameter
        .EN(ram_enable),       // 1-bit input RAM enable
        .REGCE(reg_enable), // 1-bit input output register enable
        .RST(reset),     // 1-bit input reset
        .WE(write_enable)        // Input write enable, width defined by write port depth
    );								
endmodule