module vram_red_2(reset, clk, address, red);
    input clk, reset;
    input [13:0] address;
    output red;
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
        .INIT_04(256'hfffffffffffffff01fffffffffffffff_ffffffffffffffc007ffffffffffffff),
        .INIT_05(256'hffffffffffffff8003ffffffffffffff_ffffffffffffff0001ffffffffffffff),
        .INIT_06(256'hfffffffffffffe0000ffffffffffffff_fffffffffffffc00007fffffffffffff),
        .INIT_07(256'hfffffffffffffc00007fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_08(256'hfffffffffffff800003fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_09(256'hfffffffffffff800003fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_0A(256'hfffffffffffff800003fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_0B(256'hfffffffffffffc00007fffffffffffff_fffffffffffffc00007fffffffffffff),
        .INIT_0C(256'hfffffffffffffe0000ffffffffffffff_fffffffffcffff0001ffffffffffffff),
        .INIT_0D(256'hfffffffff07fff8003ffffffffffffff_fffffffff03fffc007ffffffffffffff),
        .INIT_0E(256'hfffffffff81ffff01fffffffffffffff_fffffffffc07fffc7fffffffffffffff),
        .INIT_0F(256'hfffffffffe03fffc7fffffffffffffff_ffffffffff03fffc7fffffffffffffff),
        .INIT_10(256'hffffffffff81fffc7fffffffffffffff_ffffffffffc0fffc7fffffffffffffff),
        .INIT_11(256'hffffffffffe07ffc7fffffffffffffff_fffffffffff03ffc7fffffffffffffff),
        .INIT_12(256'hfffffffffff81ffc7fffffffffffffff_fffffffffffc0ffc7fffffffffffffff),
        .INIT_13(256'hfffffffffffe07fc7fffffffffffffff_ffffffffffff03fc7fffffffffffffff),
        .INIT_14(256'hffffffffffff80fc7fffffffffffffff_ffffffffffffc07c7fffffffffffffff),
        .INIT_15(256'hffffffffffffe03c7fffffffffffffff_fffffffffffff01c7fffffffffffffff),
        .INIT_16(256'hfffffffffffff81c7fffffffffffffff_fffffffffffffc0c7fffffffffffffff),
        .INIT_17(256'hfffffffffffffe001fffffffffffffff_ffffffffffffff000fffffffffffffff),
        .INIT_18(256'hffffffffffffff8007ffffffffffffff_ffffffffffffffc003ffffffffffffff),
        .INIT_19(256'hfffffffffffffffc00ffffffffffffff_fffffffffffffffc407fffffffffffff),
        .INIT_1A(256'hfffffffffffffffc703fffffffffffff_fffffffffffffffc781fffffffffffff),
        .INIT_1B(256'hfffffffffffffffc780fffffffffffff_ffffe07ffffffffc7e07ffffffffffff),
        .INIT_1C(256'hffff800007fffffc7f01ffffffffffff_ffff800003fffffc7f80ffffffffffff),
        .INIT_1D(256'hffff800001fffffc7fe07fffffffffff_ffff800001fffffc7ff03fffffffffff),
        .INIT_1E(256'hffff800003fffffc7ffc1fffffffffff_ffff800003fffffc7ffe0fffffffffff),
        .INIT_1F(256'hffff800003fffffc7fff03ffffffffff_ffff800003fffffc7fff01ffffffffff),
        .INIT_20(256'hffff800003fffffc7fffc0ffffffffff_ffff800007fffffc7fffe07fffffffff),
        .INIT_21(256'hffff800007fffffc7ffff03fffffffff_ffff800007fffffc7ffff81fffffffff),
        .INIT_22(256'hffff800007fffffc7ffffc3fffffffff_ffff800007fffffc7fffffffffffffff),
        .INIT_23(256'hffff800007fffffc7fffffffffffffff_ffff800007fffffc7fffffffffffffff),
        .INIT_24(256'hffff800007fffffc7fffffffffffffff_ffff800007fffffc7fffffffffffffff),
        .INIT_25(256'hffff800007fffffc7fffffffffffffff_ffff800003fffffc7fffffffffffffff),
        .INIT_26(256'hffff800003fffffc7fffffffffffffff_ffff800003fffffc7fffffffffffffff),
        .INIT_27(256'hffff800003fffff83fffffffffffffff_ffff800003fffff01fffffffffffffff),
        .INIT_28(256'hffff800003ffffe00fffffffffffffff_ffff800007ffffc107ffffffffffffff),
        .INIT_29(256'hffffffffffffff8383ffffffffffffff_ffffffffffffff07c1ffffffffffffff),
        .INIT_2A(256'hfffffffffffffe0fe0ffffffffffffff_fffffffffffffc1ff07fffffffffffff),
        .INIT_2B(256'hfffffffffffff83ff83fffffffffffff_fffffffffffff07ffc1fffffffffffff),
        .INIT_2C(256'hffffffffffffe0fffe0fffffffffffff_ffffffffffffc1ffff07ffffffffffff),
        .INIT_2D(256'hffffffffffff83ffff83ffffffffffff_ffffffffffff07ffffc1ffffffffffff),
        .INIT_2E(256'hfffffffffffe0fffffe0ffffffffffff_fffffffffffc1ffffff07fffffffffff),
        .INIT_2F(256'hfffffffffff83ffffff83fffffffffff_fffffffffff07ffffffc1fffffffffff)   
    ) BRAM_SINGLE_MACRO_inst (
        .DO(red),       // Output data, width defined by READ_WIDTH parameter
        .ADDR(address),   // Input address, width defined by read/write port depth
        .CLK(clk),     // 1-bit input clock
        .DI(input_data),       // Input data port, width defined by WRITE_WIDTH parameter
        .EN(ram_enable),       // 1-bit input RAM enable
        .REGCE(reg_enable), // 1-bit input output register enable
        .RST(reset),     // 1-bit input reset
        .WE(write_enable)        // Input write enable, width defined by write port depth
    );								
endmodule