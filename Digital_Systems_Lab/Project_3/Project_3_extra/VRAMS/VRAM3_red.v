module vram_red_3(reset, clk, address, red);
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
        .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffdfffffffffff),
        .INIT_04(256'hffffffffffe7fff01fff8fffffffffff_ffffffffffc3ffc007ff07ffffffffff),
        .INIT_05(256'hffffffffffe1ff8003fe0fffffffffff_fffffffffff07f0001fc1fffffffffff),
        .INIT_06(256'hfffffffffff83e0000f83fffffffffff_fffffffffffc1c0000707fffffffffff),
        .INIT_07(256'hfffffffffffe0c000060ffffffffffff_ffffffffffff00000001ffffffffffff),
        .INIT_08(256'hffffffffffff80000003ffffffffffff_ffffffffffffc0000007ffffffffffff),
        .INIT_09(256'hffffffffffffe000000fffffffffffff_fffffffffffff000001fffffffffffff),
        .INIT_0A(256'hfffffffffffff800003fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_0B(256'hfffffffffffffc00007fffffffffffff_fffffffffffffc0000ffffffffffffff),
        .INIT_0C(256'hfffffffffffffe0001ffffffffffffff_ffffffffffffff0001ffffffffffffff),
        .INIT_0D(256'hffffffffffffff8003ffffffffffffff_ffffffffffffffc007ffffffffffffff),
        .INIT_0E(256'hfffffffffffffff01fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_0F(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_10(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_11(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_12(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_13(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_14(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_15(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7ffffff3ffffffff),
        .INIT_16(256'hfffffffffffffffc7fffffc0007fffff_fffffffffffffffc7fffffc0003fffff),
        .INIT_17(256'hfffffffffffffffc7fffffc00007ffff_fffffffffffffffc7fffffc00003ffff),
        .INIT_18(256'hfffffffffffffffc7fffffc00003ffff_fffffffffffffffc7fffffc00003ffff),
        .INIT_19(256'hfffffffffffffffc7fffffc00003ffff_fffffffffffffffc7fffffc00003ffff),
        .INIT_1A(256'hfffffffffffffffc7fffffe00003ffff_fffffffffffffffc7fffffe00003ffff),
        .INIT_1B(256'hfffffffffffffffc7fffffe00003ffff_fffffffffffffffc7fffffe00003ffff),
        .INIT_1C(256'hfffffffffffffffc7fffffe00003ffff_fffffffffffffffc7fffffe00003ffff),
        .INIT_1D(256'hfffffffffffffffc7fffffe00003ffff_fffffffffffffffc7fffffe00003ffff),
        .INIT_1E(256'hfffffffffffffffc7fffffe00003ffff_fffffffffffffffc7fffffe00003ffff),
        .INIT_1F(256'hfffffffffffffffc7fffffe00003ffff_fffffffffffffffc7fffffe00003ffff),
        .INIT_20(256'hfffffffffffffffc7fffffe00007ffff_fffffffffffffffc7fffffffffffffff),
        .INIT_21(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_22(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_23(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_24(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_25(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_26(256'hfffffffffffffffc7fffffffffffffff_fffffffffffffffc7fffffffffffffff),
        .INIT_27(256'hfffffffffffffff83fffffffffffffff_fffffffffffffff01fffffffffffffff),
        .INIT_28(256'hffffffffffffffe00fffffffffffffff_ffffffffffffffc107ffffffffffffff),
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