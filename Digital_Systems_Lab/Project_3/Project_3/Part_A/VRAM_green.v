`timescale 1ns/1ps

module vram_green(reset, clk, address, green);
    input clk, reset;
    input [13:0] address;
    output green;
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

        .INIT_0C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_0D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_0E(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_0F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_10(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_11(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_12(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_14(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_16(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

        .INIT_18(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1A(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1C(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_1D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_1E(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_1F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_20(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_21(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_22(256'h00000000000000000000000000000000_00000000000000000000000000000000),
        .INIT_23(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

        .INIT_24(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
        .INIT_25(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
        .INIT_26(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
        .INIT_27(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
        .INIT_28(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
        .INIT_29(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
        .INIT_2A(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
        .INIT_2B(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
        .INIT_2C(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
        .INIT_2D(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
        .INIT_2E(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
        .INIT_2F(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0)   
    ) BRAM_SINGLE_MACRO_inst (
        .DO(green),       // Output data, width defined by READ_WIDTH parameter
        .ADDR(address),   // Input address, width defined by read/write port depth
        .CLK(clk),     // 1-bit input clock
        .DI(input_data),       // Input data port, width defined by WRITE_WIDTH parameter
        .EN(ram_enable),       // 1-bit input RAM enable
        .REGCE(reg_enable), // 1-bit input output register enable
        .RST(reset),     // 1-bit input reset
        .WE(write_enable)        // Input write enable, width defined by write port depth
    );			
endmodule