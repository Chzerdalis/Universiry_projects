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
        
        .INIT_00(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_02(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_04(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_05(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_06(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_07(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_08(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_09(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_0A(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_0B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

        .INIT_0C(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_0D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_0E(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_0F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_10(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_11(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_12(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_14(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_16(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

        .INIT_18(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1A(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1E(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_20(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_21(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_22(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_23(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

        .INIT_24(256'h00000f00000f00000f00000f00000f00_00000f00000f00000f00000f00000f00),
        .INIT_25(256'h00ffff00ffff00ffff00ffff00ffff00_00ffff00ffff00ffff00ffff00ffff00),
        .INIT_26(256'h00000f00000f00000f00000f00000f00_00000f00000f00000f00000f00000f00),
        .INIT_27(256'h00ffff00ffff00ffff00ffff00ffff00_00ffff00ffff00ffff00ffff00ffff00),
        .INIT_28(256'h00000f00000f00000f00000f00000f00_00000f00000f00000f00000f00000f00),
        .INIT_29(256'h00ffff00ffff00ffff00ffff00ffff00_00ffff00ffff00ffff00ffff00ffff00),
        .INIT_2A(256'h00000f00000f00000f00000f00000f00_00000f00000f00000f00000f00000f00),
        .INIT_2B(256'h00ffff00ffff00ffff00ffff00ffff00_00ffff00ffff00ffff00ffff00ffff00),
        .INIT_2C(256'h00000f00000f00000f00000f00000f00_00000f00000f00000f00000f00000f00),
        .INIT_2D(256'h00ffff00ffff00ffff00ffff00ffff00_00ffff00ffff00ffff00ffff00ffff00),
        .INIT_2E(256'h00000f00000f00000f00000f00000f00_00000f00000f00000f00000f00000f00),
        .INIT_2F(256'h00ffff00ffff00ffff00ffff00ffff00_00ffff00ffff00ffff00ffff00ffff00)   
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