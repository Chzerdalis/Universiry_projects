`timescale 1ns/1ps

module vram_green_2(reset, clk, address, green);
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
        
        .INIT_00(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_02(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
        .INIT_04(256'hfffffffffffffff01fffffffffffffff_ffffffffffffffc007ffffffffffffff),
        .INIT_05(256'hffffffffffffff8003ffffffffffffff_ffffffffffffff0001ffffffffffffff),
        .INIT_06(256'hfffffffffffffe0000ffffffffffffff_fffffffffffffc00007fffffffffffff),
        .INIT_07(256'hfffffffffffffc00007fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_08(256'hfffffffffffff800003fffffffffffff_fffffffffffff800003fffffffffffff),
        .INIT_09(256'hfffffffffffff800003fffff0001ffff_fffffffffffff800003ffffc0000ffff),
        .INIT_0A(256'hfffffffffffff800003ffffc00003fff_fffffffffffff800003ffffc00001fff),
        .INIT_0B(256'hfffffffffffffc00007ffffc00001fff_fffffffffffffc00007ffffc00001fff),
        .INIT_0C(256'hfffffffffffffe0000fffffc00001fff_fffffffffcffff0001fffffc00001fff),
        .INIT_0D(256'hfffffffff07fff8003fffffc00001fff_fffffffff03fffc007fffffc00001fff),
        .INIT_0E(256'hfffffffff81ffff01ffffffc00001fff_fffffffffc07fffc7ffffffc00001fff),
        .INIT_0F(256'hfffffffffe03fffc7ffffffc00001fff_ffffffffff03fffc7ffffffc00001fff),
        .INIT_10(256'hffffffffff81fffc7ffffffc00001fff_ffffffffffc0fffc7ffffffc00001fff),
        .INIT_11(256'hffffffffffe07ffc7ffffffc00001fff_fffffffffff03ffc7ffffffc00001fff),
        .INIT_12(256'hfffffffffff81ffc7ffffffc00001fff_fffffffffffc0ffc7ffffffc00001fff),
        .INIT_13(256'hfffffffffffe07fc7ffffffc00001fff_ffffffffffff03fc7ffffffc00003fff),
        .INIT_14(256'hffffffffffff80fc7fffffffffffffff_ffffffffffffc07c7fffffffffffffff),
        .INIT_15(256'hffffffffffffe03c7fffffffffffffff_fffffffffffff01c7fffffffffffffff),
        .INIT_16(256'hfffffffffffff81c7fffffffffffffff_fffffffffffffc0c7fffffffffffffff),
        .INIT_17(256'hfffffffffffffe001fffffffffffffff_ffffffffffffff000fffffffffffffff),
        .INIT_18(256'hffffffffffffff8007ffffffffffffff_ffffffffffffffc003ffffffffffffff),
        .INIT_19(256'hfffffffffffffffc00ffffffffffffff_fffffffffffffffc407fffffffffffff),
        .INIT_1A(256'hfffffffffffffffc703fffffffffffff_fffffffffffffffc781fffffffffffff),
        .INIT_1B(256'hfffffffffffffffc780fffffffffffff_fffffffffffffffc7e07ffffffffffff),
        .INIT_1C(256'hfffffffffffffffc7f01ffffffffffff_fffffffffffffffc7f80ffffffffffff),
        .INIT_1D(256'hfffffffffffffffc7fe07fffffffffff_fffffffffffffffc7ff03fffffffffff),
        .INIT_1E(256'hfffffffffffffffc7ffc1fffffffffff_fffffffffffffffc7ffe0fffffffffff),
        .INIT_1F(256'hfffffffffffffffc7fff03ffffffffff_fffffffffffffffc7fff01ffffffffff),
        .INIT_20(256'hfffffffffffffffc7fffc0ffffffffff_fffffffffffffffc7fffe07fffffffff),
        .INIT_21(256'hfffffffffffffffc7ffff03fffffffff_fffffffffffffffc7ffff81fffffffff),
        .INIT_22(256'hfffffffffffffffc7ffffc3fffffffff_fffffffffffffffc7fffffffffffffff),
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
        .DO(green),       // Output data, width defined by READ_WIDTH parameter
        .ADDR(address),   // Input address, width defined by read/write port depth
        .CLK(clk),     // 1-bit input clock
        .DI(input_data),       // Input data port, width defined by WRITE_WIDTH parameter
        .EN(ram_enable),       // 1-bit input RAM enable
        .REGCE(reg_enable), // 1-bit input output register enable
        .RST(reset),     // 1-bit input reset
        .WE(write_enable)        // Input write enable, width defined by write port depth
    );			

//     RAMB18E1 #(
//         // Address Collision Mode: "PERFORMANCE" or "DELAYED_WRITE" 
//         .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
//         // Collision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
//         .SIM_COLLISION_CHECK("ALL"),
//         // DOA_REG, DOB_REG: Optional output register (0 or 1)
//         .DOA_REG(0),
//         .DOB_REG(0),
//         // INITP_00 to INITP_07: Initial contents of parity memory array
//         .INIT_00(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_02(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_04(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_05(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_06(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_07(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_08(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_09(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_0A(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_0B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

//         .INIT_0C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_0D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_0E(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_0F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_10(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_11(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_12(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_14(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_16(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

//         .INIT_18(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_1A(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_1C(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_1D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_1E(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_1F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_20(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_21(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),
//         .INIT_22(256'h00000000000000000000000000000000_00000000000000000000000000000000),
//         .INIT_23(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff),

//         .INIT_24(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
//         .INIT_25(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
//         .INIT_26(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
//         .INIT_27(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
//         .INIT_28(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
//         .INIT_29(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
//         .INIT_2A(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
//         .INIT_2B(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
//         .INIT_2C(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
//         .INIT_2D(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
//         .INIT_2E(256'hf00000f00000f00000f00000f00000f0_f00000f00000f00000f00000f00000f0),
//         .INIT_2F(256'hf0fff0f0fff0f0fff0f0fff0f0fff0f0_f0fff0f0fff0f0fff0f0fff0f0fff0f0),
//         // INIT_A, INIT_B: Initial values on output ports
//         .INIT_A(18'h00000),
//         .INIT_B(18'h00000),
//         // Initialization File: RAM initialization file
//         .INIT_FILE("NONE"),
//         // RAM Mode: "SDP" or "TDP" 
//         .RAM_MODE("TDP"),
//         // READ_WIDTH_A/B, WRITE_WIDTH_A/B: Read/write width per port
//         .READ_WIDTH_A(1),                                                                 // 0-72
//         .READ_WIDTH_B(0),                                                                 // 0-18
//         .WRITE_WIDTH_A(1),                                                                // 0-18
//         .WRITE_WIDTH_B(0),                                                                // 0-72
//         // RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
//         .RSTREG_PRIORITY_A("RSTREG"),
//         .RSTREG_PRIORITY_B("RSTREG"),
//         // SRVAL_A, SRVAL_B: Set/reset value for output
//         .SRVAL_A(18'h00000),
//         .SRVAL_B(18'h00000),
//         // Simulation Device: Must be set to "7SERIES" for simulation behavior
//         .SIM_DEVICE("7SERIES"),
//         // WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
//         .WRITE_MODE_A("WRITE_FIRST"),
//         .WRITE_MODE_B("WRITE_FIRST")
//    )
//    RAMB18E1_inst (
//         // Port A Data: 16-bit (each) output: Port A data
//         .DOADO(green),                 // 16-bit output: A port data/LSB data
//         .DOPADOP(DOPADOP),             // 2-bit output: A port parity/LSB parity
//         // Port B Data: 16-bit (each) output: Port B data
//         .DOBDO(DOBDO),                 // 16-bit output: B port data/MSB data
//         .DOPBDOP(DOPBDOP),             // 2-bit output: B port parity/MSB parity
//         // Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals (read port
//         // when RAM_MODE="SDP")
//         .ADDRARDADDR(address),     // 14-bit input: A port address/Read address
//         .CLKARDCLK(clk),         // 1-bit input: A port clock/Read clock
//         .ENARDEN(1'b1),             // 1-bit input: A port enable/Read enable
//         .REGCEAREGCE(REGCEAREGCE),     // 1-bit input: A port register enable/Register enable
//         .RSTRAMARSTRAM(0), // 1-bit input: A port set/reset
//         .RSTREGARSTREG(reset), // 1-bit input: A port register set/reset
//         .WEA(00),                     // 2-bit input: A port write enable
//         // Port A Data: 16-bit (each) input: Port A data
//         .DIADI(DIADI),                 // 16-bit input: A port data/LSB data
//         .DIPADIP(DIPADIP),             // 2-bit input: A port parity/LSB parity
//         // Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals (write port
//         // when RAM_MODE="SDP")
//         .ADDRBWRADDR(ADDRBWRADDR),     // 14-bit input: B port address/Write address
//         .CLKBWRCLK(CLKBWRCLK),         // 1-bit input: B port clock/Write clock
//         .ENBWREN(ENBWREN),             // 1-bit input: B port enable/Write enable
//         .REGCEB(REGCEB),               // 1-bit input: B port register enable
//         .RSTRAMB(RSTRAMB),             // 1-bit input: B port set/reset
//         .RSTREGB(RSTREGB),             // 1-bit input: B port register set/reset
//         .WEBWE(WEBWE),                 // 4-bit input: B port write enable/Write enable
//         // Port B Data: 16-bit (each) input: Port B data
//         .DIBDI(DIBDI),                 // 16-bit input: B port data/MSB data
//         .DIPBDIP(DIPBDIP)              // 2-bit input: B port parity/MSB parity
//    );

//    // End of RAMB18E1_inst instantiation					
endmodule