// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Apr  8 16:59:38 2025
// Host        : nbellas-VirtualBox running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/nbellas/fpadd_arm_2/fpadd_arm_2.gen/sources_1/bd/lab2_simple_arm/ip/lab2_simple_arm_adder_ip_0_0/lab2_simple_arm_adder_ip_0_0_sim_netlist.v
// Design      : lab2_simple_arm_adder_ip_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "lab2_simple_arm_adder_ip_0_0,fpadd_ip_v1_0_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "fpadd_ip_v1_0_v1_0,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module lab2_simple_arm_adder_ip_0_0
   (leds_AXI,
    an0,
    a0,
    b0,
    c0,
    d0,
    e0,
    f0,
    g0,
    an1,
    a1,
    b1,
    c1,
    d1,
    e1,
    f1,
    g1,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  output [7:0]leds_AXI;
  output an0;
  output a0;
  output b0;
  output c0;
  output d0;
  output e0;
  output f0;
  output g0;
  output an1;
  output a1;
  output b1;
  output c1;
  output d1;
  output e1;
  output f1;
  output g1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 9.9e+07, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN lab2_simple_arm_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 9.9e+07, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN lab2_simple_arm_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire a0;
  wire a1;
  wire an1;
  wire b0;
  wire b1;
  wire c0;
  wire c1;
  wire d0;
  wire d1;
  wire e0;
  wire e1;
  wire f0;
  wire f1;
  wire g0;
  wire g1;
  wire [7:0]leds_AXI;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign an0 = an1;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  lab2_simple_arm_adder_ip_0_0_fpadd_ip_v1_0_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .a0(a0),
        .a1(a1),
        .an0(an1),
        .b0(b0),
        .b1(b1),
        .c0(c0),
        .c1(c1),
        .d0(d0),
        .d1(d1),
        .e0(e0),
        .e1(e1),
        .f0(f0),
        .f1(f1),
        .g0(g0),
        .g1(g1),
        .leds_AXI(leds_AXI),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "Data_mem" *) 
module lab2_simple_arm_adder_ip_0_0_Data_mem
   (D,
    \pointer_reg[1]_0 ,
    \pointer_reg[1]_1 ,
    \pointer_reg[2]_0 ,
    reg_A,
    \pointer_reg[2]_1 ,
    \pointer_reg[1]_2 ,
    \pointer_reg[2]_2 ,
    \pointer_reg[2]_3 ,
    current_state,
    s00_axi_aclk,
    AR);
  output [11:0]D;
  output [0:0]\pointer_reg[1]_0 ;
  output \pointer_reg[1]_1 ;
  output [0:0]\pointer_reg[2]_0 ;
  output [17:0]reg_A;
  output \pointer_reg[2]_1 ;
  output \pointer_reg[1]_2 ;
  output \pointer_reg[2]_2 ;
  output \pointer_reg[2]_3 ;
  input [1:0]current_state;
  input s00_axi_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [11:0]D;
  wire [1:0]current_state;
  wire [2:0]pointer;
  wire \pointer[0]_i_1_n_0 ;
  wire \pointer[1]_i_1_n_0 ;
  wire \pointer[2]_i_1_n_0 ;
  wire [0:0]\pointer_reg[1]_0 ;
  wire \pointer_reg[1]_1 ;
  wire \pointer_reg[1]_2 ;
  wire [0:0]\pointer_reg[2]_0 ;
  wire \pointer_reg[2]_1 ;
  wire \pointer_reg[2]_2 ;
  wire \pointer_reg[2]_3 ;
  wire [17:0]reg_A;
  wire s00_axi_aclk;

  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \A[0]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[0]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h42)) 
    \A[12]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[3]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h68)) 
    \A[13]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[4]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \A[14]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[5]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h74)) 
    \A[15]_i_1 
       (.I0(pointer[0]),
        .I1(pointer[2]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[6]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \A[16]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[7]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hA4)) 
    \A[17]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(reg_A[8]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h7C)) 
    \A[18]_i_1 
       (.I0(pointer[0]),
        .I1(pointer[2]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[9]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \A[20]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(reg_A[10]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \A[21]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[11]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \A[22]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .O(reg_A[12]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h37)) 
    \A[23]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(reg_A[13]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h6D)) 
    \A[24]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[14]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \A[25]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .O(\pointer_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hCB)) 
    \A[26]_i_1 
       (.I0(pointer[0]),
        .I1(pointer[2]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[15]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    \A[28]_i_1 
       (.I0(pointer[0]),
        .I1(pointer[2]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[16]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \A[29]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[17]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hC2)) 
    \A[4]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[1]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    \A[5]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(reg_A[2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B[11]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \B[12]_i_1 
       (.I0(pointer[0]),
        .I1(pointer[2]),
        .I2(\pointer_reg[1]_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \B[13]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \B[14]_i_1 
       (.I0(\pointer_reg[1]_0 ),
        .I1(pointer[0]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \B[15]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h2C)) 
    \B[16]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \B[17]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .O(\pointer_reg[2]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \B[21]_i_1 
       (.I0(\pointer_reg[1]_0 ),
        .I1(pointer[2]),
        .O(\pointer_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \B[22]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(\pointer_reg[2]_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \B[24]_i_1 
       (.I0(\pointer_reg[1]_0 ),
        .I1(pointer[0]),
        .O(\pointer_reg[1]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hBC)) 
    \B[26]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \B[28]_i_1 
       (.I0(pointer[0]),
        .I1(\pointer_reg[1]_0 ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h74)) 
    \B[29]_i_1 
       (.I0(\pointer_reg[1]_0 ),
        .I1(pointer[2]),
        .I2(pointer[0]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \B[2]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \B[30]_i_1 
       (.I0(\pointer_reg[1]_0 ),
        .I1(pointer[0]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \B[31]_i_1 
       (.I0(pointer[2]),
        .I1(\pointer_reg[1]_0 ),
        .I2(pointer[0]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'h4A)) 
    \B[4]_i_1 
       (.I0(pointer[2]),
        .I1(pointer[0]),
        .I2(\pointer_reg[1]_0 ),
        .O(\pointer_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \pointer[0]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(pointer[0]),
        .O(\pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \pointer[1]_i_1 
       (.I0(pointer[0]),
        .I1(current_state[0]),
        .I2(current_state[1]),
        .I3(\pointer_reg[1]_0 ),
        .O(\pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'hFF7F0080)) 
    \pointer[2]_i_1 
       (.I0(\pointer_reg[1]_0 ),
        .I1(pointer[0]),
        .I2(current_state[0]),
        .I3(current_state[1]),
        .I4(pointer[2]),
        .O(\pointer[2]_i_1_n_0 ));
  FDCE \pointer_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\pointer[0]_i_1_n_0 ),
        .Q(pointer[0]));
  FDCE \pointer_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\pointer[1]_i_1_n_0 ),
        .Q(\pointer_reg[1]_0 ));
  FDCE \pointer_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\pointer[2]_i_1_n_0 ),
        .Q(pointer[2]));
endmodule

(* ORIG_REF_NAME = "Debounce_L2P" *) 
module lab2_simple_arm_adder_ip_0_0_Debounce_L2P
   (current_state,
    s00_axi_aclk,
    signal_out_reg);
  output [1:0]current_state;
  input s00_axi_aclk;
  input [0:0]signal_out_reg;

  wire [1:0]current_state;
  wire debounced_sig;
  wire s00_axi_aclk;
  wire [0:0]signal_out_reg;

  lab2_simple_arm_adder_ip_0_0_Debouncer_1 DB
       (.debounced_sig(debounced_sig),
        .s00_axi_aclk(s00_axi_aclk),
        .signal_out_reg_0(signal_out_reg));
  lab2_simple_arm_adder_ip_0_0_L2P_2 L2P
       (.current_state(current_state),
        .debounced_sig(debounced_sig),
        .s00_axi_aclk(s00_axi_aclk));
endmodule

(* ORIG_REF_NAME = "Debounce_L2P" *) 
module lab2_simple_arm_adder_ip_0_0_Debounce_L2P_0
   (AR,
    s00_axi_aclk,
    s00_axi_aresetn,
    Q);
  output [0:0]AR;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [0:0]Q;

  wire [0:0]AR;
  wire [0:0]Q;
  wire debounced_sig;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;

  lab2_simple_arm_adder_ip_0_0_Debouncer DB
       (.Q(Q),
        .debounced_sig(debounced_sig),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn));
  lab2_simple_arm_adder_ip_0_0_L2P L2P
       (.AR(AR),
        .debounced_sig(debounced_sig),
        .s00_axi_aclk(s00_axi_aclk));
endmodule

(* ORIG_REF_NAME = "Debouncer" *) 
module lab2_simple_arm_adder_ip_0_0_Debouncer
   (debounced_sig,
    s00_axi_aclk,
    s00_axi_aresetn,
    Q);
  output debounced_sig;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [0:0]Q;

  wire [0:0]Q;
  wire clear;
  wire \counter[0]_i_2_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire \counter[0]_i_5_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[0]_i_7_n_0 ;
  wire [23:7]counter_reg;
  wire \counter_reg[0]_i_3_n_0 ;
  wire \counter_reg[0]_i_3_n_1 ;
  wire \counter_reg[0]_i_3_n_2 ;
  wire \counter_reg[0]_i_3_n_3 ;
  wire \counter_reg[0]_i_3_n_4 ;
  wire \counter_reg[0]_i_3_n_5 ;
  wire \counter_reg[0]_i_3_n_6 ;
  wire \counter_reg[0]_i_3_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire debounced_sig;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire signal_out_i_1_n_0;
  wire [3:3]\NLW_counter_reg[20]_i_1_CO_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h2)) 
    \counter[0]_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q),
        .O(clear));
  LUT6 #(
    .INIT(64'h000000F7FFFFFFFF)) 
    \counter[0]_i_2 
       (.I0(counter_reg[20]),
        .I1(counter_reg[19]),
        .I2(\counter[0]_i_4_n_0 ),
        .I3(counter_reg[21]),
        .I4(counter_reg[22]),
        .I5(counter_reg[23]),
        .O(\counter[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h222A2222)) 
    \counter[0]_i_4 
       (.I0(\counter[0]_i_6_n_0 ),
        .I1(counter_reg[15]),
        .I2(counter_reg[14]),
        .I3(counter_reg[13]),
        .I4(\counter[0]_i_7_n_0 ),
        .O(\counter[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_5 
       (.I0(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[0]_i_6 
       (.I0(counter_reg[18]),
        .I1(counter_reg[17]),
        .I2(counter_reg[16]),
        .O(\counter[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h15151555FFFFFFFF)) 
    \counter[0]_i_7 
       (.I0(counter_reg[11]),
        .I1(counter_reg[10]),
        .I2(counter_reg[9]),
        .I3(counter_reg[7]),
        .I4(counter_reg[8]),
        .I5(counter_reg[12]),
        .O(\counter[0]_i_7_n_0 ));
  FDRE \counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_7 ),
        .Q(\counter_reg_n_0_[0] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_3_n_0 ,\counter_reg[0]_i_3_n_1 ,\counter_reg[0]_i_3_n_2 ,\counter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_3_n_4 ,\counter_reg[0]_i_3_n_5 ,\counter_reg[0]_i_3_n_6 ,\counter_reg[0]_i_3_n_7 }),
        .S({\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] ,\counter[0]_i_5_n_0 }));
  FDRE \counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(clear));
  FDRE \counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(clear));
  FDRE \counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE \counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(clear));
  FDRE \counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(clear));
  FDRE \counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(clear));
  FDRE \counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE \counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(clear));
  FDRE \counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(clear));
  FDRE \counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(clear));
  FDRE \counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_6 ),
        .Q(\counter_reg_n_0_[1] ),
        .R(clear));
  FDRE \counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\NLW_counter_reg[20]_i_1_CO_UNCONNECTED [3],\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(clear));
  FDRE \counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(clear));
  FDRE \counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(clear));
  FDRE \counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_5 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(clear));
  FDRE \counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_4 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(clear));
  FDRE \counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[4] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_3_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S({counter_reg[7],\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] ,\counter_reg_n_0_[4] }));
  FDRE \counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[5] ),
        .R(clear));
  FDRE \counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[6] ),
        .R(clear));
  FDRE \counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(clear));
  FDRE \counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE \counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(clear));
  LUT3 #(
    .INIT(8'h0D)) 
    signal_out_i_1
       (.I0(s00_axi_aresetn),
        .I1(Q),
        .I2(\counter[0]_i_2_n_0 ),
        .O(signal_out_i_1_n_0));
  FDRE signal_out_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(signal_out_i_1_n_0),
        .Q(debounced_sig),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "Debouncer" *) 
module lab2_simple_arm_adder_ip_0_0_Debouncer_1
   (debounced_sig,
    s00_axi_aclk,
    signal_out_reg_0);
  output debounced_sig;
  input s00_axi_aclk;
  input [0:0]signal_out_reg_0;

  wire \counter[0]_i_1__0_n_0 ;
  wire \counter[0]_i_2__0_n_0 ;
  wire \counter[0]_i_4__0_n_0 ;
  wire \counter[0]_i_5__0_n_0 ;
  wire \counter[0]_i_6__0_n_0 ;
  wire \counter[0]_i_7__0_n_0 ;
  wire [23:7]counter_reg;
  wire \counter_reg[0]_i_3__0_n_0 ;
  wire \counter_reg[0]_i_3__0_n_1 ;
  wire \counter_reg[0]_i_3__0_n_2 ;
  wire \counter_reg[0]_i_3__0_n_3 ;
  wire \counter_reg[0]_i_3__0_n_4 ;
  wire \counter_reg[0]_i_3__0_n_5 ;
  wire \counter_reg[0]_i_3__0_n_6 ;
  wire \counter_reg[0]_i_3__0_n_7 ;
  wire \counter_reg[12]_i_1__0_n_0 ;
  wire \counter_reg[12]_i_1__0_n_1 ;
  wire \counter_reg[12]_i_1__0_n_2 ;
  wire \counter_reg[12]_i_1__0_n_3 ;
  wire \counter_reg[12]_i_1__0_n_4 ;
  wire \counter_reg[12]_i_1__0_n_5 ;
  wire \counter_reg[12]_i_1__0_n_6 ;
  wire \counter_reg[12]_i_1__0_n_7 ;
  wire \counter_reg[16]_i_1__0_n_0 ;
  wire \counter_reg[16]_i_1__0_n_1 ;
  wire \counter_reg[16]_i_1__0_n_2 ;
  wire \counter_reg[16]_i_1__0_n_3 ;
  wire \counter_reg[16]_i_1__0_n_4 ;
  wire \counter_reg[16]_i_1__0_n_5 ;
  wire \counter_reg[16]_i_1__0_n_6 ;
  wire \counter_reg[16]_i_1__0_n_7 ;
  wire \counter_reg[20]_i_1__0_n_1 ;
  wire \counter_reg[20]_i_1__0_n_2 ;
  wire \counter_reg[20]_i_1__0_n_3 ;
  wire \counter_reg[20]_i_1__0_n_4 ;
  wire \counter_reg[20]_i_1__0_n_5 ;
  wire \counter_reg[20]_i_1__0_n_6 ;
  wire \counter_reg[20]_i_1__0_n_7 ;
  wire \counter_reg[4]_i_1__0_n_0 ;
  wire \counter_reg[4]_i_1__0_n_1 ;
  wire \counter_reg[4]_i_1__0_n_2 ;
  wire \counter_reg[4]_i_1__0_n_3 ;
  wire \counter_reg[4]_i_1__0_n_4 ;
  wire \counter_reg[4]_i_1__0_n_5 ;
  wire \counter_reg[4]_i_1__0_n_6 ;
  wire \counter_reg[4]_i_1__0_n_7 ;
  wire \counter_reg[8]_i_1__0_n_0 ;
  wire \counter_reg[8]_i_1__0_n_1 ;
  wire \counter_reg[8]_i_1__0_n_2 ;
  wire \counter_reg[8]_i_1__0_n_3 ;
  wire \counter_reg[8]_i_1__0_n_4 ;
  wire \counter_reg[8]_i_1__0_n_5 ;
  wire \counter_reg[8]_i_1__0_n_6 ;
  wire \counter_reg[8]_i_1__0_n_7 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire debounced_sig;
  wire s00_axi_aclk;
  wire signal_out_i_1__0_n_0;
  wire [0:0]signal_out_reg_0;
  wire [3:3]\NLW_counter_reg[20]_i_1__0_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1__0 
       (.I0(signal_out_reg_0),
        .O(\counter[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h000000F7FFFFFFFF)) 
    \counter[0]_i_2__0 
       (.I0(counter_reg[20]),
        .I1(counter_reg[19]),
        .I2(\counter[0]_i_4__0_n_0 ),
        .I3(counter_reg[21]),
        .I4(counter_reg[22]),
        .I5(counter_reg[23]),
        .O(\counter[0]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h222A2222)) 
    \counter[0]_i_4__0 
       (.I0(\counter[0]_i_6__0_n_0 ),
        .I1(counter_reg[15]),
        .I2(counter_reg[14]),
        .I3(counter_reg[13]),
        .I4(\counter[0]_i_7__0_n_0 ),
        .O(\counter[0]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_5__0 
       (.I0(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_5__0_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[0]_i_6__0 
       (.I0(counter_reg[18]),
        .I1(counter_reg[17]),
        .I2(counter_reg[16]),
        .O(\counter[0]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'h15151555FFFFFFFF)) 
    \counter[0]_i_7__0 
       (.I0(counter_reg[11]),
        .I1(counter_reg[10]),
        .I2(counter_reg[9]),
        .I3(counter_reg[7]),
        .I4(counter_reg[8]),
        .I5(counter_reg[12]),
        .O(\counter[0]_i_7__0_n_0 ));
  FDRE \counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[0]_i_3__0_n_7 ),
        .Q(\counter_reg_n_0_[0] ),
        .R(\counter[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_3__0 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_3__0_n_0 ,\counter_reg[0]_i_3__0_n_1 ,\counter_reg[0]_i_3__0_n_2 ,\counter_reg[0]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_3__0_n_4 ,\counter_reg[0]_i_3__0_n_5 ,\counter_reg[0]_i_3__0_n_6 ,\counter_reg[0]_i_3__0_n_7 }),
        .S({\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] ,\counter[0]_i_5__0_n_0 }));
  FDRE \counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[8]_i_1__0_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[8]_i_1__0_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[12]_i_1__0_n_7 ),
        .Q(counter_reg[12]),
        .R(\counter[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1__0 
       (.CI(\counter_reg[8]_i_1__0_n_0 ),
        .CO({\counter_reg[12]_i_1__0_n_0 ,\counter_reg[12]_i_1__0_n_1 ,\counter_reg[12]_i_1__0_n_2 ,\counter_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1__0_n_4 ,\counter_reg[12]_i_1__0_n_5 ,\counter_reg[12]_i_1__0_n_6 ,\counter_reg[12]_i_1__0_n_7 }),
        .S(counter_reg[15:12]));
  FDRE \counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[12]_i_1__0_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[12]_i_1__0_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[12]_i_1__0_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[16]_i_1__0_n_7 ),
        .Q(counter_reg[16]),
        .R(\counter[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1__0 
       (.CI(\counter_reg[12]_i_1__0_n_0 ),
        .CO({\counter_reg[16]_i_1__0_n_0 ,\counter_reg[16]_i_1__0_n_1 ,\counter_reg[16]_i_1__0_n_2 ,\counter_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1__0_n_4 ,\counter_reg[16]_i_1__0_n_5 ,\counter_reg[16]_i_1__0_n_6 ,\counter_reg[16]_i_1__0_n_7 }),
        .S(counter_reg[19:16]));
  FDRE \counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[16]_i_1__0_n_6 ),
        .Q(counter_reg[17]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[16]_i_1__0_n_5 ),
        .Q(counter_reg[18]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[16]_i_1__0_n_4 ),
        .Q(counter_reg[19]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[0]_i_3__0_n_6 ),
        .Q(\counter_reg_n_0_[1] ),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[20]_i_1__0_n_7 ),
        .Q(counter_reg[20]),
        .R(\counter[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1__0 
       (.CI(\counter_reg[16]_i_1__0_n_0 ),
        .CO({\NLW_counter_reg[20]_i_1__0_CO_UNCONNECTED [3],\counter_reg[20]_i_1__0_n_1 ,\counter_reg[20]_i_1__0_n_2 ,\counter_reg[20]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1__0_n_4 ,\counter_reg[20]_i_1__0_n_5 ,\counter_reg[20]_i_1__0_n_6 ,\counter_reg[20]_i_1__0_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[20]_i_1__0_n_6 ),
        .Q(counter_reg[21]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[20]_i_1__0_n_5 ),
        .Q(counter_reg[22]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[20]_i_1__0_n_4 ),
        .Q(counter_reg[23]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[0]_i_3__0_n_5 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[0]_i_3__0_n_4 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[4]_i_1__0_n_7 ),
        .Q(\counter_reg_n_0_[4] ),
        .R(\counter[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1__0 
       (.CI(\counter_reg[0]_i_3__0_n_0 ),
        .CO({\counter_reg[4]_i_1__0_n_0 ,\counter_reg[4]_i_1__0_n_1 ,\counter_reg[4]_i_1__0_n_2 ,\counter_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1__0_n_4 ,\counter_reg[4]_i_1__0_n_5 ,\counter_reg[4]_i_1__0_n_6 ,\counter_reg[4]_i_1__0_n_7 }),
        .S({counter_reg[7],\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] ,\counter_reg_n_0_[4] }));
  FDRE \counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[4]_i_1__0_n_6 ),
        .Q(\counter_reg_n_0_[5] ),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[4]_i_1__0_n_5 ),
        .Q(\counter_reg_n_0_[6] ),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[4]_i_1__0_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1__0_n_0 ));
  FDRE \counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[8]_i_1__0_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1__0 
       (.CI(\counter_reg[4]_i_1__0_n_0 ),
        .CO({\counter_reg[8]_i_1__0_n_0 ,\counter_reg[8]_i_1__0_n_1 ,\counter_reg[8]_i_1__0_n_2 ,\counter_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1__0_n_4 ,\counter_reg[8]_i_1__0_n_5 ,\counter_reg[8]_i_1__0_n_6 ,\counter_reg[8]_i_1__0_n_7 }),
        .S(counter_reg[11:8]));
  FDRE \counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\counter[0]_i_2__0_n_0 ),
        .D(\counter_reg[8]_i_1__0_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    signal_out_i_1__0
       (.I0(signal_out_reg_0),
        .I1(\counter[0]_i_2__0_n_0 ),
        .O(signal_out_i_1__0_n_0));
  FDRE signal_out_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(signal_out_i_1__0_n_0),
        .Q(debounced_sig),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "L2P" *) 
module lab2_simple_arm_adder_ip_0_0_L2P
   (AR,
    debounced_sig,
    s00_axi_aclk);
  output [0:0]AR;
  input debounced_sig;
  input s00_axi_aclk;

  wire [0:0]AR;
  wire \FSM_sequential_current_state[0]_i_1_n_0 ;
  wire \FSM_sequential_current_state[1]_i_1_n_0 ;
  wire [1:0]current_state;
  wire debounced_sig;
  wire s00_axi_aclk;

  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \FSM_sequential_current_state[0]_i_1 
       (.I0(current_state[0]),
        .I1(current_state[1]),
        .I2(debounced_sig),
        .O(\FSM_sequential_current_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \FSM_sequential_current_state[1]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(debounced_sig),
        .O(\FSM_sequential_current_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01" *) 
  FDRE \FSM_sequential_current_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_current_state[0]_i_1_n_0 ),
        .Q(current_state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01" *) 
  FDRE \FSM_sequential_current_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_current_state[1]_i_1_n_0 ),
        .Q(current_state[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \out[7]_i_2 
       (.I0(current_state[0]),
        .I1(current_state[1]),
        .O(AR));
endmodule

(* ORIG_REF_NAME = "L2P" *) 
module lab2_simple_arm_adder_ip_0_0_L2P_2
   (current_state,
    debounced_sig,
    s00_axi_aclk);
  output [1:0]current_state;
  input debounced_sig;
  input s00_axi_aclk;

  wire \FSM_sequential_current_state[0]_i_1__0_n_0 ;
  wire \FSM_sequential_current_state[1]_i_1__0_n_0 ;
  wire [1:0]current_state;
  wire debounced_sig;
  wire s00_axi_aclk;

  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \FSM_sequential_current_state[0]_i_1__0 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(debounced_sig),
        .O(\FSM_sequential_current_state[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \FSM_sequential_current_state[1]_i_1__0 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(debounced_sig),
        .O(\FSM_sequential_current_state[1]_i_1__0_n_0 ));
  (* FSM_ENCODED_STATES = "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01" *) 
  FDRE \FSM_sequential_current_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_current_state[0]_i_1__0_n_0 ),
        .Q(current_state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01" *) 
  FDRE \FSM_sequential_current_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_current_state[1]_i_1__0_n_0 ),
        .Q(current_state[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "SevenSegDisplay" *) 
module lab2_simple_arm_adder_ip_0_0_SevenSegDisplay
   (\counter_reg[4]_0 ,
    s00_axi_aclk,
    AR);
  output [0:0]\counter_reg[4]_0 ;
  input s00_axi_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]\counter_reg[4]_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire [4:0]p_0_in;
  wire s00_axi_aclk;

  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1__1 
       (.I0(\counter_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter[2]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[2] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter[3]_i_1 
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[3] ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter[4]_i_1 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter_reg[4]_0 ),
        .O(p_0_in[4]));
  FDCE \counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[0]),
        .Q(\counter_reg_n_0_[0] ));
  FDCE \counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[1]),
        .Q(\counter_reg_n_0_[1] ));
  FDCE \counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[2]),
        .Q(\counter_reg_n_0_[2] ));
  FDCE \counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[3]),
        .Q(\counter_reg_n_0_[3] ));
  FDCE \counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[4]),
        .Q(\counter_reg[4]_0 ));
endmodule

(* ORIG_REF_NAME = "fpadd_ip_v1_0_v1_0" *) 
module lab2_simple_arm_adder_ip_0_0_fpadd_ip_v1_0_v1_0
   (leds_AXI,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    an0,
    c0,
    g0,
    f0,
    e0,
    d0,
    b0,
    a0,
    c1,
    g1,
    f1,
    e1,
    d1,
    b1,
    a1,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_wstrb,
    s00_axi_bready,
    s00_axi_rready);
  output [7:0]leds_AXI;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output an0;
  output c0;
  output g0;
  output f0;
  output e0;
  output d0;
  output b0;
  output a0;
  output c1;
  output g1;
  output f1;
  output e1;
  output d1;
  output b1;
  output a1;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire a0;
  wire a1;
  wire an0;
  wire aw_en_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire b0;
  wire b1;
  wire c0;
  wire c1;
  wire d0;
  wire d1;
  wire e0;
  wire e1;
  wire f0;
  wire f1;
  wire fpadd_ip_v1_0_v1_0_S00_AXI_inst_n_4;
  wire g0;
  wire g1;
  wire [7:0]leds_AXI;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(fpadd_ip_v1_0_v1_0_S00_AXI_inst_n_4),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(S_AXI_WREADY),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  lab2_simple_arm_adder_ip_0_0_fpadd_ip_v1_0_v1_0_S00_AXI fpadd_ip_v1_0_v1_0_S00_AXI_inst
       (.Q(an0),
        .a0(a0),
        .a1(a1),
        .aw_en_reg_0(fpadd_ip_v1_0_v1_0_S00_AXI_inst_n_4),
        .aw_en_reg_1(aw_en_i_1_n_0),
        .axi_arready_reg_0(S_AXI_ARREADY),
        .axi_awready_reg_0(S_AXI_AWREADY),
        .axi_bvalid_reg_0(axi_bvalid_i_1_n_0),
        .axi_rvalid_reg_0(axi_rvalid_i_1_n_0),
        .axi_wready_reg_0(S_AXI_WREADY),
        .b0(b0),
        .b1(b1),
        .c0(c0),
        .c1(c1),
        .d0(d0),
        .d1(d1),
        .e0(e0),
        .e1(e1),
        .f0(f0),
        .f1(f1),
        .g0(g0),
        .g1(g1),
        .leds_AXI(leds_AXI),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "fpadd_ip_v1_0_v1_0_S00_AXI" *) 
module lab2_simple_arm_adder_ip_0_0_fpadd_ip_v1_0_v1_0_S00_AXI
   (axi_wready_reg_0,
    axi_awready_reg_0,
    axi_arready_reg_0,
    s00_axi_bvalid,
    aw_en_reg_0,
    s00_axi_rvalid,
    leds_AXI,
    s00_axi_rdata,
    Q,
    c0,
    g0,
    f0,
    e0,
    d0,
    b0,
    a0,
    c1,
    g1,
    f1,
    e1,
    d1,
    b1,
    a1,
    s00_axi_aclk,
    axi_bvalid_reg_0,
    aw_en_reg_1,
    axi_rvalid_reg_0,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn);
  output axi_wready_reg_0;
  output axi_awready_reg_0;
  output axi_arready_reg_0;
  output s00_axi_bvalid;
  output aw_en_reg_0;
  output s00_axi_rvalid;
  output [7:0]leds_AXI;
  output [31:0]s00_axi_rdata;
  output [0:0]Q;
  output c0;
  output g0;
  output f0;
  output e0;
  output d0;
  output b0;
  output a0;
  output c1;
  output g1;
  output f1;
  output e1;
  output d1;
  output b1;
  output a1;
  input s00_axi_aclk;
  input axi_bvalid_reg_0;
  input aw_en_reg_1;
  input axi_rvalid_reg_0;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;

  wire [0:0]Q;
  wire a0;
  wire a1;
  wire aw_en_reg_0;
  wire aw_en_reg_1;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire axi_arready_reg_0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_reg_0;
  wire axi_rvalid_reg_0;
  wire axi_wready0;
  wire axi_wready_reg_0;
  wire b0;
  wire b1;
  wire c0;
  wire c1;
  wire d0;
  wire d1;
  wire e0;
  wire e1;
  wire f0;
  wire f1;
  wire g0;
  wire g1;
  wire [7:0]leds_AXI;
  wire [1:0]p_0_in_0;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [0:0]slv_reg0;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire [31:1]slv_reg0__0;
  wire [0:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:1]slv_reg1__0;
  wire [0:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:1]slv_reg2__0;
  wire [31:0]slv_reg3;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_reg_1),
        .Q(aw_en_reg_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(axi_arready_reg_0),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(axi_arready_reg_0),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(axi_arready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(axi_awready_reg_0),
        .I3(aw_en_reg_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in_0[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(axi_awready_reg_0),
        .I3(aw_en_reg_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in_0[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in_0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in_0[1]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(axi_awready_reg_0),
        .I2(aw_en_reg_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(axi_awready_reg_0),
        .R(axi_awready_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_reg_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[0]_i_1 
       (.I0(slv_reg2),
        .I1(slv_reg3[0]),
        .I2(slv_reg0),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg2__0[10]),
        .I1(slv_reg3[10]),
        .I2(slv_reg0__0[10]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[10]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg2__0[11]),
        .I1(slv_reg3[11]),
        .I2(slv_reg0__0[11]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[11]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg2__0[12]),
        .I1(slv_reg3[12]),
        .I2(slv_reg0__0[12]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[12]),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg2__0[13]),
        .I1(slv_reg3[13]),
        .I2(slv_reg0__0[13]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[13]),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg2__0[14]),
        .I1(slv_reg3[14]),
        .I2(slv_reg0__0[14]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[14]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg2__0[15]),
        .I1(slv_reg3[15]),
        .I2(slv_reg0__0[15]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[15]),
        .O(reg_data_out[15]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg2__0[16]),
        .I1(slv_reg3[16]),
        .I2(slv_reg0__0[16]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[16]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg2__0[17]),
        .I1(slv_reg3[17]),
        .I2(slv_reg0__0[17]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[17]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg2__0[18]),
        .I1(slv_reg3[18]),
        .I2(slv_reg0__0[18]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[18]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg2__0[19]),
        .I1(slv_reg3[19]),
        .I2(slv_reg0__0[19]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[1]_i_1 
       (.I0(slv_reg2__0[1]),
        .I1(slv_reg3[1]),
        .I2(slv_reg0__0[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[1]),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg2__0[20]),
        .I1(slv_reg3[20]),
        .I2(slv_reg0__0[20]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[20]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg2__0[21]),
        .I1(slv_reg3[21]),
        .I2(slv_reg0__0[21]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[21]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg2__0[22]),
        .I1(slv_reg3[22]),
        .I2(slv_reg0__0[22]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[22]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg2__0[23]),
        .I1(slv_reg3[23]),
        .I2(slv_reg0__0[23]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[23]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg2__0[24]),
        .I1(slv_reg3[24]),
        .I2(slv_reg0__0[24]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[24]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg2__0[25]),
        .I1(slv_reg3[25]),
        .I2(slv_reg0__0[25]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[25]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg2__0[26]),
        .I1(slv_reg3[26]),
        .I2(slv_reg0__0[26]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[26]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg2__0[27]),
        .I1(slv_reg3[27]),
        .I2(slv_reg0__0[27]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[27]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg2__0[28]),
        .I1(slv_reg3[28]),
        .I2(slv_reg0__0[28]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[28]),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg2__0[29]),
        .I1(slv_reg3[29]),
        .I2(slv_reg0__0[29]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[2]_i_1 
       (.I0(slv_reg2__0[2]),
        .I1(slv_reg3[2]),
        .I2(slv_reg0__0[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[2]),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg2__0[30]),
        .I1(slv_reg3[30]),
        .I2(slv_reg0__0[30]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[30]),
        .O(reg_data_out[30]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg2__0[31]),
        .I1(slv_reg3[31]),
        .I2(slv_reg0__0[31]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[3]_i_1 
       (.I0(slv_reg2__0[3]),
        .I1(slv_reg3[3]),
        .I2(slv_reg0__0[3]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[3]),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[4]_i_1 
       (.I0(slv_reg2__0[4]),
        .I1(slv_reg3[4]),
        .I2(slv_reg0__0[4]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[4]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[5]_i_1 
       (.I0(slv_reg2__0[5]),
        .I1(slv_reg3[5]),
        .I2(slv_reg0__0[5]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[5]),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[6]_i_1 
       (.I0(slv_reg2__0[6]),
        .I1(slv_reg3[6]),
        .I2(slv_reg0__0[6]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[6]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[7]_i_1 
       (.I0(slv_reg2__0[7]),
        .I1(slv_reg3[7]),
        .I2(slv_reg0__0[7]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[7]),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg2__0[8]),
        .I1(slv_reg3[8]),
        .I2(slv_reg0__0[8]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[8]),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg2__0[9]),
        .I1(slv_reg3[9]),
        .I2(slv_reg0__0[9]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1__0[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_reg_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(axi_wready_reg_0),
        .I3(aw_en_reg_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(axi_wready_reg_0),
        .R(axi_awready_i_1_n_0));
  lab2_simple_arm_adder_ip_0_0_fpadd_system fpadd
       (.Q(slv_reg2),
        .a0(a0),
        .a1(a1),
        .a1_0(slv_reg1),
        .b0(b0),
        .b1(b1),
        .c0(c0),
        .c1(c1),
        .\counter_reg[4] (Q),
        .d0(d0),
        .d1(d1),
        .e0(e0),
        .e1(e1),
        .f0(f0),
        .f1(f1),
        .g0(g0),
        .g1(g1),
        .leds_AXI(leds_AXI),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .signal_out_reg(slv_reg0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(p_0_in_0[0]),
        .I3(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(p_0_in_0[0]),
        .I3(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(p_0_in_0[0]),
        .I3(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(p_0_in_0[0]),
        .I3(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg0__0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg0__0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0__0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0__0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0__0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0__0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0__0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0__0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0__0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0__0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg0__0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0__0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0__0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0__0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0__0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0__0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0__0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0__0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0__0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0__0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0__0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg0__0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0__0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0__0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg0__0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg0__0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg0__0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg0__0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg0__0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg0__0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg0__0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1__0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1__0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1__0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1__0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1__0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1__0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1__0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1__0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1__0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1__0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1__0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1__0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1__0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1__0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1__0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1__0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1__0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1__0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1__0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1__0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1__0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1__0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1__0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1__0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1__0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1__0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1__0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1__0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1__0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1__0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1__0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg2[31]_i_2 
       (.I0(axi_wready_reg_0),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in_0[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in_0[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2__0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2__0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2__0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2__0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2__0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2__0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2__0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2__0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2__0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2__0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2__0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2__0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2__0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2__0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2__0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2__0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2__0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2__0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2__0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2__0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2__0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2__0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2__0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2__0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2__0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2__0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2__0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2__0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2__0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2__0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2__0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .O(p_1_in[7]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(axi_arready_reg_0),
        .O(slv_reg_rden__0));
endmodule

(* ORIG_REF_NAME = "fpadd_pipeline" *) 
module lab2_simple_arm_adder_ip_0_0_fpadd_pipeline
   (c0,
    g0,
    f0,
    e0,
    d0,
    b0,
    a0,
    c1,
    g1,
    f1,
    e1,
    d1,
    b1,
    a1,
    leds_AXI,
    s00_axi_aclk,
    AR,
    \B_reg[24]_0 ,
    reg_A,
    \B_reg[4]_0 ,
    \B_reg[17]_0 ,
    \B_reg[22]_0 ,
    \B_reg[21]_0 ,
    a1_0,
    Q,
    D,
    pointer,
    \A_reg[25]_0 );
  output c0;
  output g0;
  output f0;
  output e0;
  output d0;
  output b0;
  output a0;
  output c1;
  output g1;
  output f1;
  output e1;
  output d1;
  output b1;
  output a1;
  output [7:0]leds_AXI;
  input s00_axi_aclk;
  input [0:0]AR;
  input \B_reg[24]_0 ;
  input [17:0]reg_A;
  input \B_reg[4]_0 ;
  input \B_reg[17]_0 ;
  input \B_reg[22]_0 ;
  input \B_reg[21]_0 ;
  input [0:0]a1_0;
  input [0:0]Q;
  input [11:0]D;
  input [0:0]pointer;
  input [0:0]\A_reg[25]_0 ;

  wire [30:0]A;
  wire [0:0]AR;
  wire [0:0]\A_reg[25]_0 ;
  wire [31:2]B;
  wire \B_reg[17]_0 ;
  wire \B_reg[21]_0 ;
  wire \B_reg[22]_0 ;
  wire \B_reg[24]_0 ;
  wire \B_reg[4]_0 ;
  wire [11:0]D;
  wire [0:0]Q;
  wire [3:0]\SegDISPLAY_0/out__3 ;
  wire [3:0]\SegDISPLAY_1/out__3 ;
  wire \_inferred__2/i__carry__0_n_0 ;
  wire \_inferred__2/i__carry__0_n_1 ;
  wire \_inferred__2/i__carry__0_n_2 ;
  wire \_inferred__2/i__carry__0_n_3 ;
  wire \_inferred__2/i__carry__0_n_4 ;
  wire \_inferred__2/i__carry__0_n_5 ;
  wire \_inferred__2/i__carry__0_n_6 ;
  wire \_inferred__2/i__carry__0_n_7 ;
  wire \_inferred__2/i__carry__1_n_0 ;
  wire \_inferred__2/i__carry__1_n_1 ;
  wire \_inferred__2/i__carry__1_n_2 ;
  wire \_inferred__2/i__carry__1_n_3 ;
  wire \_inferred__2/i__carry__1_n_4 ;
  wire \_inferred__2/i__carry__1_n_5 ;
  wire \_inferred__2/i__carry__1_n_6 ;
  wire \_inferred__2/i__carry__1_n_7 ;
  wire \_inferred__2/i__carry__2_n_0 ;
  wire \_inferred__2/i__carry__2_n_1 ;
  wire \_inferred__2/i__carry__2_n_2 ;
  wire \_inferred__2/i__carry__2_n_3 ;
  wire \_inferred__2/i__carry__2_n_4 ;
  wire \_inferred__2/i__carry__2_n_5 ;
  wire \_inferred__2/i__carry__2_n_6 ;
  wire \_inferred__2/i__carry__2_n_7 ;
  wire \_inferred__2/i__carry__3_n_0 ;
  wire \_inferred__2/i__carry__3_n_1 ;
  wire \_inferred__2/i__carry__3_n_2 ;
  wire \_inferred__2/i__carry__3_n_3 ;
  wire \_inferred__2/i__carry__3_n_4 ;
  wire \_inferred__2/i__carry__3_n_5 ;
  wire \_inferred__2/i__carry__3_n_6 ;
  wire \_inferred__2/i__carry__3_n_7 ;
  wire \_inferred__2/i__carry__4_n_0 ;
  wire \_inferred__2/i__carry__4_n_1 ;
  wire \_inferred__2/i__carry__4_n_2 ;
  wire \_inferred__2/i__carry__4_n_3 ;
  wire \_inferred__2/i__carry__4_n_4 ;
  wire \_inferred__2/i__carry__4_n_5 ;
  wire \_inferred__2/i__carry__4_n_6 ;
  wire \_inferred__2/i__carry__4_n_7 ;
  wire \_inferred__2/i__carry_n_0 ;
  wire \_inferred__2/i__carry_n_1 ;
  wire \_inferred__2/i__carry_n_2 ;
  wire \_inferred__2/i__carry_n_3 ;
  wire \_inferred__2/i__carry_n_4 ;
  wire \_inferred__2/i__carry_n_5 ;
  wire \_inferred__2/i__carry_n_6 ;
  wire \_inferred__2/i__carry_n_7 ;
  wire a0;
  wire a1;
  wire [0:0]a1_0;
  wire b0;
  wire b1;
  wire bigger1_carry__0_i_1_n_0;
  wire bigger1_carry__0_i_2_n_0;
  wire bigger1_carry__0_i_3_n_0;
  wire bigger1_carry__0_i_4_n_0;
  wire bigger1_carry__0_i_5_n_0;
  wire bigger1_carry__0_i_6_n_0;
  wire bigger1_carry__0_i_7_n_0;
  wire bigger1_carry__0_i_8_n_0;
  wire bigger1_carry__0_n_0;
  wire bigger1_carry__0_n_1;
  wire bigger1_carry__0_n_2;
  wire bigger1_carry__0_n_3;
  wire bigger1_carry__1_i_1_n_0;
  wire bigger1_carry__1_i_2_n_0;
  wire bigger1_carry__1_i_3_n_0;
  wire bigger1_carry__1_i_4_n_0;
  wire bigger1_carry__1_i_5_n_0;
  wire bigger1_carry__1_i_6_n_0;
  wire bigger1_carry__1_i_7_n_0;
  wire bigger1_carry__1_i_8_n_0;
  wire bigger1_carry__1_n_0;
  wire bigger1_carry__1_n_1;
  wire bigger1_carry__1_n_2;
  wire bigger1_carry__1_n_3;
  wire bigger1_carry__2_i_1_n_0;
  wire bigger1_carry__2_i_2_n_0;
  wire bigger1_carry__2_i_3_n_0;
  wire bigger1_carry__2_i_4_n_0;
  wire bigger1_carry__2_i_5_n_0;
  wire bigger1_carry__2_i_6_n_0;
  wire bigger1_carry__2_i_7_n_0;
  wire bigger1_carry__2_i_8_n_0;
  wire bigger1_carry__2_n_1;
  wire bigger1_carry__2_n_2;
  wire bigger1_carry__2_n_3;
  wire bigger1_carry_i_1_n_0;
  wire bigger1_carry_i_2_n_0;
  wire bigger1_carry_i_3_n_0;
  wire bigger1_carry_i_4_n_0;
  wire bigger1_carry_i_5_n_0;
  wire bigger1_carry_i_6_n_0;
  wire bigger1_carry_i_7_n_0;
  wire bigger1_carry_i_8_n_0;
  wire bigger1_carry_n_0;
  wire bigger1_carry_n_1;
  wire bigger1_carry_n_2;
  wire bigger1_carry_n_3;
  wire bigger_sign;
  wire bigger_sign_2;
  wire c0;
  wire c1;
  wire carry;
  wire carry_2;
  wire d0;
  wire d1;
  wire e0;
  wire e1;
  wire [7:0]exponent_bigger;
  wire f0;
  wire f1;
  wire [7:0]final_exponent10_in;
  wire \final_exponent2_inferred__0/i__carry_n_0 ;
  wire \final_exponent2_inferred__0/i__carry_n_1 ;
  wire \final_exponent2_inferred__0/i__carry_n_2 ;
  wire \final_exponent2_inferred__0/i__carry_n_3 ;
  wire [7:0]final_exponent_reg;
  wire [31:16]fp_out;
  wire g0;
  wire g1;
  wire i__carry__0_i_10_n_0;
  wire i__carry__0_i_11_n_0;
  wire i__carry__0_i_15_n_0;
  wire i__carry__0_i_16_n_0;
  wire i__carry__0_i_17_n_0;
  wire i__carry__0_i_18_n_0;
  wire i__carry__0_i_19_n_0;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_20_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5__0_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6__0_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7__0_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry__0_i_9_n_0;
  wire i__carry__1_i_10_n_0;
  wire i__carry__1_i_11_n_0;
  wire i__carry__1_i_12_n_0;
  wire i__carry__1_i_16_n_0;
  wire i__carry__1_i_17_n_0;
  wire i__carry__1_i_18_n_0;
  wire i__carry__1_i_19_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_20_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__1_i_5_n_0;
  wire i__carry__1_i_6_n_0;
  wire i__carry__1_i_7_n_0;
  wire i__carry__1_i_8_n_0;
  wire i__carry__1_i_9_n_0;
  wire i__carry__2_i_10_n_0;
  wire i__carry__2_i_11_n_0;
  wire i__carry__2_i_12_n_0;
  wire i__carry__2_i_17_n_0;
  wire i__carry__2_i_18_n_0;
  wire i__carry__2_i_19_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_20_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__2_i_5_n_0;
  wire i__carry__2_i_6_n_0;
  wire i__carry__2_i_7_n_0;
  wire i__carry__2_i_8_n_0;
  wire i__carry__2_i_9_n_0;
  wire i__carry__3_i_10_n_0;
  wire i__carry__3_i_11_n_0;
  wire i__carry__3_i_14_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry__3_i_2_n_0;
  wire i__carry__3_i_3_n_0;
  wire i__carry__3_i_4_n_0;
  wire i__carry__3_i_5_n_0;
  wire i__carry__3_i_6_n_0;
  wire i__carry__3_i_7_n_0;
  wire i__carry__3_i_8_n_0;
  wire i__carry__3_i_9_n_0;
  wire i__carry__4_i_10_n_0;
  wire i__carry__4_i_1_n_0;
  wire i__carry__4_i_2_n_0;
  wire i__carry__4_i_3_n_0;
  wire i__carry__4_i_4_n_0;
  wire i__carry__4_i_5_n_0;
  wire i__carry__4_i_6_n_0;
  wire i__carry__4_i_7_n_0;
  wire i__carry__4_i_8_n_0;
  wire i__carry__4_i_9_n_0;
  wire i__carry__5_i_1_n_0;
  wire i__carry_i_10__0_n_0;
  wire i__carry_i_10_n_0;
  wire i__carry_i_11__0_n_0;
  wire i__carry_i_11_n_0;
  wire i__carry_i_12__0_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_13__0_n_0;
  wire i__carry_i_13_n_0;
  wire i__carry_i_14__0_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_15__0_n_0;
  wire i__carry_i_16__0_n_0;
  wire i__carry_i_17__0_n_0;
  wire i__carry_i_17_n_0;
  wire i__carry_i_18__0_n_0;
  wire i__carry_i_18_n_0;
  wire i__carry_i_19__0_n_0;
  wire i__carry_i_19_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_20__0_n_0;
  wire i__carry_i_20_n_0;
  wire i__carry_i_21__0_n_0;
  wire i__carry_i_21_n_0;
  wire i__carry_i_22__0_n_0;
  wire i__carry_i_22_n_0;
  wire i__carry_i_23__0_n_0;
  wire i__carry_i_23_n_0;
  wire i__carry_i_24__0_n_0;
  wire i__carry_i_24_n_0;
  wire i__carry_i_25__0_n_0;
  wire i__carry_i_25_n_0;
  wire i__carry_i_26__0_n_0;
  wire i__carry_i_26_n_0;
  wire i__carry_i_27__0_n_0;
  wire i__carry_i_27_n_0;
  wire i__carry_i_28__0_n_0;
  wire i__carry_i_28_n_0;
  wire i__carry_i_29_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_32_n_0;
  wire i__carry_i_33_n_0;
  wire i__carry_i_34_n_0;
  wire i__carry_i_35_n_0;
  wire i__carry_i_37_n_0;
  wire i__carry_i_38_n_0;
  wire i__carry_i_39_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_40_n_0;
  wire i__carry_i_41_n_0;
  wire i__carry_i_42_n_0;
  wire i__carry_i_43_n_0;
  wire i__carry_i_44_n_0;
  wire i__carry_i_45_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__1_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_5__1_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6__0_n_0;
  wire i__carry_i_6__1_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7__0_n_0;
  wire i__carry_i_7__1_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8__0_n_0;
  wire i__carry_i_8__1_n_0;
  wire i__carry_i_8_n_0;
  wire i__carry_i_9__0_n_0;
  wire i__carry_i_9_n_0;
  wire [7:0]leds_AXI;
  wire [17:0]mantissa_bigger;
  wire [22:16]mantissa_smaller;
  wire \mantissa_sum_2_reg_n_0_[0] ;
  wire \mantissa_sum_2_reg_n_0_[10] ;
  wire \mantissa_sum_2_reg_n_0_[11] ;
  wire \mantissa_sum_2_reg_n_0_[12] ;
  wire \mantissa_sum_2_reg_n_0_[13] ;
  wire \mantissa_sum_2_reg_n_0_[14] ;
  wire \mantissa_sum_2_reg_n_0_[15] ;
  wire \mantissa_sum_2_reg_n_0_[16] ;
  wire \mantissa_sum_2_reg_n_0_[17] ;
  wire \mantissa_sum_2_reg_n_0_[18] ;
  wire \mantissa_sum_2_reg_n_0_[19] ;
  wire \mantissa_sum_2_reg_n_0_[1] ;
  wire \mantissa_sum_2_reg_n_0_[20] ;
  wire \mantissa_sum_2_reg_n_0_[21] ;
  wire \mantissa_sum_2_reg_n_0_[22] ;
  wire \mantissa_sum_2_reg_n_0_[23] ;
  wire \mantissa_sum_2_reg_n_0_[2] ;
  wire \mantissa_sum_2_reg_n_0_[3] ;
  wire \mantissa_sum_2_reg_n_0_[4] ;
  wire \mantissa_sum_2_reg_n_0_[5] ;
  wire \mantissa_sum_2_reg_n_0_[6] ;
  wire \mantissa_sum_2_reg_n_0_[7] ;
  wire \mantissa_sum_2_reg_n_0_[8] ;
  wire \mantissa_sum_2_reg_n_0_[9] ;
  wire \out[16]_i_2_n_0 ;
  wire \out[16]_i_3_n_0 ;
  wire \out[17]_i_2_n_0 ;
  wire \out[17]_i_3_n_0 ;
  wire \out[18]_i_2_n_0 ;
  wire \out[18]_i_3_n_0 ;
  wire \out[19]_i_2_n_0 ;
  wire \out[19]_i_3_n_0 ;
  wire \out[1]_i_2_n_0 ;
  wire \out[20]_i_2_n_0 ;
  wire \out[20]_i_3_n_0 ;
  wire \out[21]_i_2_n_0 ;
  wire \out[21]_i_3_n_0 ;
  wire \out[22]_i_10_n_0 ;
  wire \out[22]_i_11_n_0 ;
  wire \out[22]_i_12_n_0 ;
  wire \out[22]_i_2_n_0 ;
  wire \out[22]_i_3_n_0 ;
  wire \out[22]_i_4_n_0 ;
  wire \out[22]_i_5_n_0 ;
  wire \out[22]_i_6_n_0 ;
  wire \out[22]_i_7_n_0 ;
  wire \out[22]_i_8_n_0 ;
  wire \out[22]_i_9_n_0 ;
  wire \out[23]_i_2_n_0 ;
  wire \out[23]_i_3_n_0 ;
  wire \out[26]_i_3_n_0 ;
  wire \out[26]_i_4_n_0 ;
  wire \out[26]_i_5_n_0 ;
  wire \out[26]_i_6_n_0 ;
  wire \out[26]_i_7_n_0 ;
  wire \out[27]_i_2_n_0 ;
  wire \out[27]_i_3_n_0 ;
  wire \out[28]_i_2_n_0 ;
  wire \out[2]_i_2_n_0 ;
  wire \out[30]_i_2_n_0 ;
  wire \out[30]_i_4_n_0 ;
  wire \out[30]_i_5_n_0 ;
  wire \out[30]_i_6_n_0 ;
  wire \out[30]_i_7_n_0 ;
  wire \out[30]_i_8_n_0 ;
  wire \out[30]_i_9_n_0 ;
  wire \out[3]_i_2_n_0 ;
  wire \out[4]_i_2_n_0 ;
  wire \out[5]_i_2_n_0 ;
  wire \out[6]_i_2_n_0 ;
  wire \out[7]_i_10_n_0 ;
  wire \out[7]_i_11_n_0 ;
  wire \out[7]_i_12_n_0 ;
  wire \out[7]_i_13_n_0 ;
  wire \out[7]_i_14_n_0 ;
  wire \out[7]_i_15_n_0 ;
  wire \out[7]_i_16_n_0 ;
  wire \out[7]_i_17_n_0 ;
  wire \out[7]_i_3_n_0 ;
  wire \out[7]_i_4_n_0 ;
  wire \out[7]_i_5_n_0 ;
  wire \out[7]_i_6_n_0 ;
  wire \out[7]_i_7_n_0 ;
  wire \out[7]_i_8_n_0 ;
  wire \out[7]_i_9_n_0 ;
  wire \out_reg[26]_i_2_n_0 ;
  wire \out_reg[26]_i_2_n_1 ;
  wire \out_reg[26]_i_2_n_2 ;
  wire \out_reg[26]_i_2_n_3 ;
  wire \out_reg[30]_i_3_n_1 ;
  wire \out_reg[30]_i_3_n_2 ;
  wire \out_reg[30]_i_3_n_3 ;
  wire p_0_in_0;
  wire [0:0]pointer;
  wire [17:0]reg_A;
  wire [30:0]result;
  wire s00_axi_aclk;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_1 ;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_2 ;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_3 ;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_4 ;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_5 ;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_6 ;
  wire \shifted_mantissa3_inferred__0/i__carry__0_n_7 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_0 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_1 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_2 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_3 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_4 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_5 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_6 ;
  wire \shifted_mantissa3_inferred__0/i__carry_n_7 ;
  wire [3:0]\NLW__inferred__2/i__carry__5_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__2/i__carry__5_O_UNCONNECTED ;
  wire [3:0]NLW_bigger1_carry_O_UNCONNECTED;
  wire [3:0]NLW_bigger1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_bigger1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_bigger1_carry__2_O_UNCONNECTED;
  wire [3:0]\NLW_final_exponent2_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:3]\NLW_out_reg[30]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_shifted_mantissa3_inferred__0/i__carry__0_CO_UNCONNECTED ;

  FDCE \A_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[0]),
        .Q(A[0]));
  FDCE \A_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[3]),
        .Q(A[12]));
  FDCE \A_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[4]),
        .Q(A[13]));
  FDCE \A_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[5]),
        .Q(A[14]));
  FDCE \A_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[6]),
        .Q(A[15]));
  FDCE \A_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[7]),
        .Q(A[16]));
  FDCE \A_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[8]),
        .Q(A[17]));
  FDCE \A_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[9]),
        .Q(A[18]));
  FDCE \A_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[10]),
        .Q(A[20]));
  FDCE \A_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[11]),
        .Q(A[21]));
  FDCE \A_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[12]),
        .Q(A[22]));
  FDCE \A_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[13]),
        .Q(A[23]));
  FDCE \A_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[14]),
        .Q(A[24]));
  FDCE \A_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\A_reg[25]_0 ),
        .Q(A[25]));
  FDCE \A_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[15]),
        .Q(A[26]));
  FDCE \A_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[16]),
        .Q(A[28]));
  FDCE \A_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[17]),
        .Q(A[29]));
  FDCE \A_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(pointer),
        .Q(A[30]));
  FDCE \A_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[1]),
        .Q(A[4]));
  FDCE \A_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(reg_A[2]),
        .Q(A[5]));
  FDCE \B_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[1]),
        .Q(B[11]));
  FDCE \B_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[2]),
        .Q(B[12]));
  FDCE \B_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[3]),
        .Q(B[13]));
  FDCE \B_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[4]),
        .Q(B[14]));
  FDCE \B_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[5]),
        .Q(B[15]));
  FDCE \B_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[6]),
        .Q(B[16]));
  FDCE \B_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\B_reg[17]_0 ),
        .Q(B[17]));
  FDCE \B_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\B_reg[21]_0 ),
        .Q(B[21]));
  FDCE \B_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\B_reg[22]_0 ),
        .Q(B[22]));
  FDCE \B_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\B_reg[24]_0 ),
        .Q(B[24]));
  FDCE \B_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[7]),
        .Q(B[26]));
  FDCE \B_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[8]),
        .Q(B[28]));
  FDCE \B_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[9]),
        .Q(B[29]));
  FDCE \B_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[0]),
        .Q(B[2]));
  FDCE \B_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[10]),
        .Q(B[30]));
  FDCE \B_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[11]),
        .Q(B[31]));
  FDCE \B_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\B_reg[4]_0 ),
        .Q(B[4]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__2/i__carry_n_0 ,\_inferred__2/i__carry_n_1 ,\_inferred__2/i__carry_n_2 ,\_inferred__2/i__carry_n_3 }),
        .CYINIT(mantissa_bigger[0]),
        .DI({B[21],i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4_n_0}),
        .O({\_inferred__2/i__carry_n_4 ,\_inferred__2/i__carry_n_5 ,\_inferred__2/i__carry_n_6 ,\_inferred__2/i__carry_n_7 }),
        .S({i__carry_i_5__1_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry__0 
       (.CI(\_inferred__2/i__carry_n_0 ),
        .CO({\_inferred__2/i__carry__0_n_0 ,\_inferred__2/i__carry__0_n_1 ,\_inferred__2/i__carry__0_n_2 ,\_inferred__2/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({B[21],i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0}),
        .O({\_inferred__2/i__carry__0_n_4 ,\_inferred__2/i__carry__0_n_5 ,\_inferred__2/i__carry__0_n_6 ,\_inferred__2/i__carry__0_n_7 }),
        .S({i__carry__0_i_4__0_n_0,i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry__1 
       (.CI(\_inferred__2/i__carry__0_n_0 ),
        .CO({\_inferred__2/i__carry__1_n_0 ,\_inferred__2/i__carry__1_n_1 ,\_inferred__2/i__carry__1_n_2 ,\_inferred__2/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}),
        .O({\_inferred__2/i__carry__1_n_4 ,\_inferred__2/i__carry__1_n_5 ,\_inferred__2/i__carry__1_n_6 ,\_inferred__2/i__carry__1_n_7 }),
        .S({i__carry__1_i_5_n_0,i__carry__1_i_6_n_0,i__carry__1_i_7_n_0,i__carry__1_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry__2 
       (.CI(\_inferred__2/i__carry__1_n_0 ),
        .CO({\_inferred__2/i__carry__2_n_0 ,\_inferred__2/i__carry__2_n_1 ,\_inferred__2/i__carry__2_n_2 ,\_inferred__2/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}),
        .O({\_inferred__2/i__carry__2_n_4 ,\_inferred__2/i__carry__2_n_5 ,\_inferred__2/i__carry__2_n_6 ,\_inferred__2/i__carry__2_n_7 }),
        .S({i__carry__2_i_5_n_0,i__carry__2_i_6_n_0,i__carry__2_i_7_n_0,i__carry__2_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry__3 
       (.CI(\_inferred__2/i__carry__2_n_0 ),
        .CO({\_inferred__2/i__carry__3_n_0 ,\_inferred__2/i__carry__3_n_1 ,\_inferred__2/i__carry__3_n_2 ,\_inferred__2/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__3_i_1_n_0,A[18],i__carry__3_i_2_n_0,i__carry__3_i_3_n_0}),
        .O({\_inferred__2/i__carry__3_n_4 ,\_inferred__2/i__carry__3_n_5 ,\_inferred__2/i__carry__3_n_6 ,\_inferred__2/i__carry__3_n_7 }),
        .S({i__carry__3_i_4_n_0,i__carry__3_i_5_n_0,i__carry__3_i_6_n_0,i__carry__3_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry__4 
       (.CI(\_inferred__2/i__carry__3_n_0 ),
        .CO({\_inferred__2/i__carry__4_n_0 ,\_inferred__2/i__carry__4_n_1 ,\_inferred__2/i__carry__4_n_2 ,\_inferred__2/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,i__carry__4_i_1_n_0,i__carry__4_i_2_n_0,A[20]}),
        .O({\_inferred__2/i__carry__4_n_4 ,\_inferred__2/i__carry__4_n_5 ,\_inferred__2/i__carry__4_n_6 ,\_inferred__2/i__carry__4_n_7 }),
        .S({i__carry__4_i_3_n_0,i__carry__4_i_4_n_0,i__carry__4_i_5_n_0,i__carry__4_i_6_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__2/i__carry__5 
       (.CI(\_inferred__2/i__carry__4_n_0 ),
        .CO(\NLW__inferred__2/i__carry__5_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__2/i__carry__5_O_UNCONNECTED [3:1],carry}),
        .S({1'b0,1'b0,1'b0,i__carry__5_i_1_n_0}));
  LUT5 #(
    .INIT(32'h82A88A8A)) 
    a0_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_0/out__3 [1]),
        .I2(\SegDISPLAY_0/out__3 [2]),
        .I3(\SegDISPLAY_0/out__3 [3]),
        .I4(\SegDISPLAY_0/out__3 [0]),
        .O(a0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a0_INST_0_i_1
       (.I0(fp_out[29]),
        .I1(Q),
        .I2(fp_out[25]),
        .O(\SegDISPLAY_0/out__3 [1]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a0_INST_0_i_2
       (.I0(fp_out[30]),
        .I1(Q),
        .I2(fp_out[26]),
        .O(\SegDISPLAY_0/out__3 [2]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a0_INST_0_i_3
       (.I0(fp_out[31]),
        .I1(Q),
        .I2(fp_out[27]),
        .O(\SegDISPLAY_0/out__3 [3]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a0_INST_0_i_4
       (.I0(fp_out[28]),
        .I1(Q),
        .I2(fp_out[24]),
        .O(\SegDISPLAY_0/out__3 [0]));
  LUT5 #(
    .INIT(32'h82A88A8A)) 
    a1_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_1/out__3 [1]),
        .I2(\SegDISPLAY_1/out__3 [2]),
        .I3(\SegDISPLAY_1/out__3 [3]),
        .I4(\SegDISPLAY_1/out__3 [0]),
        .O(a1));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a1_INST_0_i_1
       (.I0(fp_out[21]),
        .I1(Q),
        .I2(fp_out[17]),
        .O(\SegDISPLAY_1/out__3 [1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a1_INST_0_i_2
       (.I0(fp_out[22]),
        .I1(Q),
        .I2(fp_out[18]),
        .O(\SegDISPLAY_1/out__3 [2]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a1_INST_0_i_3
       (.I0(fp_out[23]),
        .I1(Q),
        .I2(fp_out[19]),
        .O(\SegDISPLAY_1/out__3 [3]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    a1_INST_0_i_4
       (.I0(fp_out[20]),
        .I1(Q),
        .I2(fp_out[16]),
        .O(\SegDISPLAY_1/out__3 [0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h082A82AA)) 
    b0_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_0/out__3 [0]),
        .I2(\SegDISPLAY_0/out__3 [3]),
        .I3(\SegDISPLAY_0/out__3 [2]),
        .I4(\SegDISPLAY_0/out__3 [1]),
        .O(b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h082A82AA)) 
    b1_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_1/out__3 [0]),
        .I2(\SegDISPLAY_1/out__3 [3]),
        .I3(\SegDISPLAY_1/out__3 [2]),
        .I4(\SegDISPLAY_1/out__3 [1]),
        .O(b1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bigger1_carry
       (.CI(1'b0),
        .CO({bigger1_carry_n_0,bigger1_carry_n_1,bigger1_carry_n_2,bigger1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({bigger1_carry_i_1_n_0,bigger1_carry_i_2_n_0,bigger1_carry_i_3_n_0,bigger1_carry_i_4_n_0}),
        .O(NLW_bigger1_carry_O_UNCONNECTED[3:0]),
        .S({bigger1_carry_i_5_n_0,bigger1_carry_i_6_n_0,bigger1_carry_i_7_n_0,bigger1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bigger1_carry__0
       (.CI(bigger1_carry_n_0),
        .CO({bigger1_carry__0_n_0,bigger1_carry__0_n_1,bigger1_carry__0_n_2,bigger1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({bigger1_carry__0_i_1_n_0,bigger1_carry__0_i_2_n_0,bigger1_carry__0_i_3_n_0,bigger1_carry__0_i_4_n_0}),
        .O(NLW_bigger1_carry__0_O_UNCONNECTED[3:0]),
        .S({bigger1_carry__0_i_5_n_0,bigger1_carry__0_i_6_n_0,bigger1_carry__0_i_7_n_0,bigger1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__0_i_1
       (.I0(A[14]),
        .I1(B[14]),
        .I2(B[15]),
        .I3(A[15]),
        .O(bigger1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__0_i_2
       (.I0(A[12]),
        .I1(B[12]),
        .I2(B[13]),
        .I3(A[13]),
        .O(bigger1_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h32)) 
    bigger1_carry__0_i_3
       (.I0(A[14]),
        .I1(B[11]),
        .I2(B[21]),
        .O(bigger1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    bigger1_carry__0_i_4
       (.I0(B[22]),
        .I1(A[18]),
        .O(bigger1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__0_i_5
       (.I0(B[15]),
        .I1(A[15]),
        .I2(B[14]),
        .I3(A[14]),
        .O(bigger1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__0_i_6
       (.I0(B[13]),
        .I1(A[13]),
        .I2(B[12]),
        .I3(A[12]),
        .O(bigger1_carry__0_i_6_n_0));
  LUT3 #(
    .INIT(8'h81)) 
    bigger1_carry__0_i_7
       (.I0(B[11]),
        .I1(B[21]),
        .I2(A[14]),
        .O(bigger1_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    bigger1_carry__0_i_8
       (.I0(A[18]),
        .I1(B[22]),
        .O(bigger1_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bigger1_carry__1
       (.CI(bigger1_carry__0_n_0),
        .CO({bigger1_carry__1_n_0,bigger1_carry__1_n_1,bigger1_carry__1_n_2,bigger1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({bigger1_carry__1_i_1_n_0,bigger1_carry__1_i_2_n_0,bigger1_carry__1_i_3_n_0,bigger1_carry__1_i_4_n_0}),
        .O(NLW_bigger1_carry__1_O_UNCONNECTED[3:0]),
        .S({bigger1_carry__1_i_5_n_0,bigger1_carry__1_i_6_n_0,bigger1_carry__1_i_7_n_0,bigger1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__1_i_1
       (.I0(A[22]),
        .I1(B[22]),
        .I2(B[29]),
        .I3(A[23]),
        .O(bigger1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    bigger1_carry__1_i_2
       (.I0(A[21]),
        .I1(B[21]),
        .O(bigger1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    bigger1_carry__1_i_3
       (.I0(A[20]),
        .I1(B[31]),
        .O(bigger1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__1_i_4
       (.I0(A[16]),
        .I1(B[16]),
        .I2(B[17]),
        .I3(A[17]),
        .O(bigger1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__1_i_5
       (.I0(B[29]),
        .I1(A[23]),
        .I2(B[22]),
        .I3(A[22]),
        .O(bigger1_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    bigger1_carry__1_i_6
       (.I0(B[21]),
        .I1(A[21]),
        .O(bigger1_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    bigger1_carry__1_i_7
       (.I0(B[31]),
        .I1(A[20]),
        .O(bigger1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__1_i_8
       (.I0(B[17]),
        .I1(A[17]),
        .I2(B[16]),
        .I3(A[16]),
        .O(bigger1_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bigger1_carry__2
       (.CI(bigger1_carry__1_n_0),
        .CO({p_0_in_0,bigger1_carry__2_n_1,bigger1_carry__2_n_2,bigger1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({bigger1_carry__2_i_1_n_0,bigger1_carry__2_i_2_n_0,bigger1_carry__2_i_3_n_0,bigger1_carry__2_i_4_n_0}),
        .O(NLW_bigger1_carry__2_O_UNCONNECTED[3:0]),
        .S({bigger1_carry__2_i_5_n_0,bigger1_carry__2_i_6_n_0,bigger1_carry__2_i_7_n_0,bigger1_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    bigger1_carry__2_i_1
       (.I0(A[30]),
        .I1(B[30]),
        .O(bigger1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__2_i_2
       (.I0(A[28]),
        .I1(B[28]),
        .I2(B[29]),
        .I3(A[29]),
        .O(bigger1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__2_i_3
       (.I0(A[26]),
        .I1(B[26]),
        .I2(B[29]),
        .I3(A[29]),
        .O(bigger1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry__2_i_4
       (.I0(A[24]),
        .I1(B[24]),
        .I2(B[29]),
        .I3(A[25]),
        .O(bigger1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    bigger1_carry__2_i_5
       (.I0(B[30]),
        .I1(A[30]),
        .O(bigger1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__2_i_6
       (.I0(B[29]),
        .I1(A[29]),
        .I2(B[28]),
        .I3(A[28]),
        .O(bigger1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__2_i_7
       (.I0(B[29]),
        .I1(A[29]),
        .I2(B[26]),
        .I3(A[26]),
        .O(bigger1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry__2_i_8
       (.I0(B[29]),
        .I1(A[25]),
        .I2(B[24]),
        .I3(A[24]),
        .O(bigger1_carry__2_i_8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    bigger1_carry_i_1
       (.I0(B[17]),
        .I1(B[31]),
        .O(bigger1_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hF4)) 
    bigger1_carry_i_2
       (.I0(B[4]),
        .I1(A[4]),
        .I2(A[5]),
        .O(bigger1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    bigger1_carry_i_3
       (.I0(B[4]),
        .I1(B[2]),
        .O(bigger1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    bigger1_carry_i_4
       (.I0(A[0]),
        .I1(B[31]),
        .I2(A[16]),
        .I3(A[14]),
        .O(bigger1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    bigger1_carry_i_5
       (.I0(B[31]),
        .I1(B[17]),
        .O(bigger1_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    bigger1_carry_i_6
       (.I0(B[4]),
        .I1(A[4]),
        .I2(A[5]),
        .O(bigger1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    bigger1_carry_i_7
       (.I0(B[2]),
        .I1(B[4]),
        .O(bigger1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bigger1_carry_i_8
       (.I0(A[16]),
        .I1(A[14]),
        .I2(B[31]),
        .I3(A[0]),
        .O(bigger1_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    bigger_sign_2_i_1
       (.I0(B[24]),
        .I1(B[31]),
        .I2(p_0_in_0),
        .O(bigger_sign));
  FDCE bigger_sign_2_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(bigger_sign),
        .Q(bigger_sign_2));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h2A28AA2A)) 
    c0_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_0/out__3 [2]),
        .I2(\SegDISPLAY_0/out__3 [3]),
        .I3(\SegDISPLAY_0/out__3 [0]),
        .I4(\SegDISPLAY_0/out__3 [1]),
        .O(c0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h2A28AA2A)) 
    c1_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_1/out__3 [2]),
        .I2(\SegDISPLAY_1/out__3 [3]),
        .I3(\SegDISPLAY_1/out__3 [0]),
        .I4(\SegDISPLAY_1/out__3 [1]),
        .O(c1));
  FDCE carry_2_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(carry),
        .Q(carry_2));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h22A88AA2)) 
    d0_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_0/out__3 [2]),
        .I2(\SegDISPLAY_0/out__3 [3]),
        .I3(\SegDISPLAY_0/out__3 [1]),
        .I4(\SegDISPLAY_0/out__3 [0]),
        .O(d0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h22A88AA2)) 
    d1_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_1/out__3 [2]),
        .I2(\SegDISPLAY_1/out__3 [3]),
        .I3(\SegDISPLAY_1/out__3 [1]),
        .I4(\SegDISPLAY_1/out__3 [0]),
        .O(d1));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h8880AA8A)) 
    e0_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_0/out__3 [3]),
        .I2(\SegDISPLAY_0/out__3 [2]),
        .I3(\SegDISPLAY_0/out__3 [1]),
        .I4(\SegDISPLAY_0/out__3 [0]),
        .O(e0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h8880AA8A)) 
    e1_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_1/out__3 [3]),
        .I2(\SegDISPLAY_1/out__3 [2]),
        .I3(\SegDISPLAY_1/out__3 [1]),
        .I4(\SegDISPLAY_1/out__3 [0]),
        .O(e1));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hA208A28A)) 
    f0_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_0/out__3 [2]),
        .I2(\SegDISPLAY_0/out__3 [1]),
        .I3(\SegDISPLAY_0/out__3 [3]),
        .I4(\SegDISPLAY_0/out__3 [0]),
        .O(f0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hA208A28A)) 
    f1_INST_0
       (.I0(a1_0),
        .I1(\SegDISPLAY_1/out__3 [2]),
        .I2(\SegDISPLAY_1/out__3 [1]),
        .I3(\SegDISPLAY_1/out__3 [3]),
        .I4(\SegDISPLAY_1/out__3 [0]),
        .O(f1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \final_exponent2_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\final_exponent2_inferred__0/i__carry_n_0 ,\final_exponent2_inferred__0/i__carry_n_1 ,\final_exponent2_inferred__0/i__carry_n_2 ,\final_exponent2_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({i__carry_i_1__1_n_0,i__carry_i_2__1_n_0,i__carry_i_3__1_n_0,i__carry_i_4__1_n_0}),
        .O(\NLW_final_exponent2_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5_n_0,i__carry_i_6__1_n_0,i__carry_i_7__0_n_0,i__carry_i_8_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \final_exponent_reg[0]_i_1 
       (.I0(A[23]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(exponent_bigger[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \final_exponent_reg[1]_i_1 
       (.I0(A[24]),
        .I1(p_0_in_0),
        .I2(B[24]),
        .O(exponent_bigger[1]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \final_exponent_reg[2]_i_1 
       (.I0(A[25]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(exponent_bigger[2]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \final_exponent_reg[3]_i_1 
       (.I0(A[26]),
        .I1(p_0_in_0),
        .I2(B[26]),
        .O(exponent_bigger[3]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \final_exponent_reg[4]_i_1 
       (.I0(A[29]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(exponent_bigger[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \final_exponent_reg[5]_i_1 
       (.I0(A[28]),
        .I1(p_0_in_0),
        .I2(B[28]),
        .O(exponent_bigger[5]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \final_exponent_reg[7]_i_1 
       (.I0(A[30]),
        .I1(p_0_in_0),
        .I2(B[30]),
        .O(exponent_bigger[7]));
  FDCE \final_exponent_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[0]),
        .Q(final_exponent_reg[0]));
  FDCE \final_exponent_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[1]),
        .Q(final_exponent_reg[1]));
  FDCE \final_exponent_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[2]),
        .Q(final_exponent_reg[2]));
  FDCE \final_exponent_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[3]),
        .Q(final_exponent_reg[3]));
  FDCE \final_exponent_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[6]),
        .Q(final_exponent_reg[4]));
  FDCE \final_exponent_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[5]),
        .Q(final_exponent_reg[5]));
  FDCE \final_exponent_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(exponent_bigger[7]),
        .Q(final_exponent_reg[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBFFFFBFB)) 
    g0_INST_0
       (.I0(\SegDISPLAY_0/out__3 [3]),
        .I1(a1_0),
        .I2(\SegDISPLAY_0/out__3 [2]),
        .I3(\SegDISPLAY_0/out__3 [0]),
        .I4(\SegDISPLAY_0/out__3 [1]),
        .O(g0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hBFFFFBFB)) 
    g1_INST_0
       (.I0(\SegDISPLAY_1/out__3 [3]),
        .I1(a1_0),
        .I2(\SegDISPLAY_1/out__3 [2]),
        .I3(\SegDISPLAY_1/out__3 [0]),
        .I4(\SegDISPLAY_1/out__3 [1]),
        .O(g1));
  LUT3 #(
    .INIT(8'hAC)) 
    i__carry__0_i_1
       (.I0(A[29]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(i__carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    i__carry__0_i_10
       (.I0(i__carry__0_i_16_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry_i_18_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I4(i__carry_i_19_n_0),
        .O(i__carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_11
       (.I0(i__carry__0_i_18_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__0_i_17_n_0),
        .O(i__carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    i__carry__0_i_12
       (.I0(B[17]),
        .I1(B[31]),
        .I2(p_0_in_0),
        .O(mantissa_bigger[6]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__0_i_13
       (.I0(A[5]),
        .I1(p_0_in_0),
        .O(mantissa_bigger[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_14
       (.I0(A[4]),
        .I1(p_0_in_0),
        .I2(B[4]),
        .O(mantissa_bigger[4]));
  LUT6 #(
    .INIT(64'h0000B8B80000BB88)) 
    i__carry__0_i_15
       (.I0(mantissa_smaller[21]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(B[13]),
        .I3(A[13]),
        .I4(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I5(p_0_in_0),
        .O(i__carry__0_i_15_n_0));
  LUT6 #(
    .INIT(64'h2F20FFFF2F200000)) 
    i__carry__0_i_16
       (.I0(mantissa_smaller[19]),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I3(i__carry_i_35_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I5(i__carry_i_33_n_0),
        .O(i__carry__0_i_16_n_0));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    i__carry__0_i_17
       (.I0(i__carry__0_i_19_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry__0_i_20_n_0),
        .I3(A[16]),
        .I4(p_0_in_0),
        .I5(B[16]),
        .O(i__carry__0_i_17_n_0));
  LUT6 #(
    .INIT(64'h2F20FFFF2F200000)) 
    i__carry__0_i_18
       (.I0(mantissa_smaller[22]),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I3(i__carry_i_41_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I5(i__carry_i_45_n_0),
        .O(i__carry__0_i_18_n_0));
  LUT6 #(
    .INIT(64'h0000B8B80000BB88)) 
    i__carry__0_i_19
       (.I0(A[20]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(B[12]),
        .I3(A[12]),
        .I4(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I5(p_0_in_0),
        .O(i__carry__0_i_19_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__0_i_1__0
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__0_i_8_n_0),
        .I3(i__carry__0_i_9_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__0_i_1__0_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_2
       (.I0(A[28]),
        .I1(p_0_in_0),
        .I2(B[28]),
        .O(i__carry__0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__0_i_20
       (.I0(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry__0_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_21
       (.I0(B[22]),
        .I1(p_0_in_0),
        .I2(A[22]),
        .O(mantissa_smaller[22]));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__0_i_2__0
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__0_i_9_n_0),
        .I3(i__carry__0_i_10_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__0_i_2__0_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    i__carry__0_i_3
       (.I0(A[29]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(i__carry__0_i_3_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__0_i_3__0
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__0_i_10_n_0),
        .I3(i__carry_i_14_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__0_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_4
       (.I0(A[30]),
        .I1(B[30]),
        .O(i__carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h99AA9A9A66556565)) 
    i__carry__0_i_4__0
       (.I0(B[21]),
        .I1(i__carry_i_12_n_0),
        .I2(i__carry__0_i_8_n_0),
        .I3(i__carry__0_i_11_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I5(i__carry_i_9_n_0),
        .O(i__carry__0_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__0_i_5
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__0_i_9_n_0),
        .I2(i__carry__0_i_8_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[6]),
        .O(i__carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_5__0
       (.I0(B[29]),
        .I1(A[29]),
        .O(i__carry__0_i_5__0_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__0_i_6
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__0_i_10_n_0),
        .I2(i__carry__0_i_9_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[5]),
        .O(i__carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_6__0
       (.I0(A[28]),
        .I1(B[28]),
        .O(i__carry__0_i_6__0_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__0_i_7
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry_i_14_n_0),
        .I2(i__carry__0_i_10_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[4]),
        .O(i__carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_7__0
       (.I0(B[29]),
        .I1(A[29]),
        .O(i__carry__0_i_7__0_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    i__carry__0_i_8
       (.I0(i__carry__0_i_15_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry_i_18_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I4(i__carry__0_i_16_n_0),
        .O(i__carry__0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_9
       (.I0(i__carry__0_i_17_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry_i_27_n_0),
        .O(i__carry__0_i_9_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__1_i_1
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__1_i_9_n_0),
        .I3(i__carry__1_i_10_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__1_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_10
       (.I0(i__carry__1_i_18_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__1_i_19_n_0),
        .O(i__carry__1_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_11
       (.I0(i__carry__1_i_17_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__0_i_18_n_0),
        .O(i__carry__1_i_11_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    i__carry__1_i_12
       (.I0(i__carry__1_i_19_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__0_i_15_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I4(i__carry_i_18_n_0),
        .O(i__carry__1_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    i__carry__1_i_13
       (.I0(B[11]),
        .I1(p_0_in_0),
        .I2(B[21]),
        .O(mantissa_bigger[11]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    i__carry__1_i_14
       (.I0(B[11]),
        .I1(p_0_in_0),
        .I2(A[14]),
        .O(mantissa_bigger[10]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_15
       (.I0(B[22]),
        .I1(p_0_in_0),
        .I2(A[18]),
        .O(mantissa_bigger[9]));
  LUT6 #(
    .INIT(64'h00000000B8BBB888)) 
    i__carry__1_i_16
       (.I0(mantissa_smaller[22]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(B[14]),
        .I3(p_0_in_0),
        .I4(A[14]),
        .I5(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry__1_i_16_n_0));
  LUT6 #(
    .INIT(64'hA808FFFFA8080000)) 
    i__carry__1_i_17
       (.I0(i__carry__4_i_10_n_0),
        .I1(A[16]),
        .I2(p_0_in_0),
        .I3(B[16]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I5(i__carry__0_i_19_n_0),
        .O(i__carry__1_i_17_n_0));
  LUT6 #(
    .INIT(64'h003033BB00300088)) 
    i__carry__1_i_18
       (.I0(mantissa_smaller[17]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(mantissa_smaller[21]),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(i__carry_i_32_n_0),
        .O(i__carry__1_i_18_n_0));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    i__carry__1_i_19
       (.I0(i__carry__1_i_20_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(mantissa_smaller[19]),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(i__carry_i_35_n_0),
        .O(i__carry__1_i_19_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__1_i_2
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__1_i_10_n_0),
        .I3(i__carry__1_i_11_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__1_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00FF00AC)) 
    i__carry__1_i_20
       (.I0(B[15]),
        .I1(A[15]),
        .I2(p_0_in_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .O(i__carry__1_i_20_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__1_i_3
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__1_i_11_n_0),
        .I3(i__carry__1_i_12_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__1_i_3_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__1_i_4
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__1_i_12_n_0),
        .I3(i__carry__0_i_11_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__1_i_5
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__1_i_10_n_0),
        .I2(i__carry__1_i_9_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[11]),
        .O(i__carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__1_i_6
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__1_i_11_n_0),
        .I2(i__carry__1_i_10_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[10]),
        .O(i__carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__1_i_7
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__1_i_12_n_0),
        .I2(i__carry__1_i_11_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[9]),
        .O(i__carry__1_i_7_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__1_i_8
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__1_i_12_n_0),
        .I3(i__carry__0_i_11_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__1_i_8_n_0));
  LUT6 #(
    .INIT(64'h8F80FFFF8F800000)) 
    i__carry__1_i_9
       (.I0(i__carry__4_i_10_n_0),
        .I1(A[18]),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I3(i__carry__1_i_16_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I5(i__carry__1_i_17_n_0),
        .O(i__carry__1_i_9_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__2_i_1
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__2_i_9_n_0),
        .I3(i__carry__2_i_10_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__2_i_10
       (.I0(i__carry__2_i_19_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__2_i_20_n_0),
        .O(i__carry__2_i_10_n_0));
  LUT6 #(
    .INIT(64'hB888BBBBB8888888)) 
    i__carry__2_i_11
       (.I0(i__carry__2_i_18_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__4_i_10_n_0),
        .I3(A[18]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I5(i__carry__1_i_16_n_0),
        .O(i__carry__2_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__2_i_12
       (.I0(i__carry__2_i_20_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__1_i_18_n_0),
        .O(i__carry__2_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__2_i_13
       (.I0(A[15]),
        .I1(p_0_in_0),
        .I2(B[15]),
        .O(mantissa_bigger[15]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    i__carry__2_i_14
       (.I0(B[14]),
        .I1(p_0_in_0),
        .I2(A[14]),
        .O(mantissa_bigger[14]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__2_i_15
       (.I0(A[13]),
        .I1(p_0_in_0),
        .I2(B[13]),
        .O(mantissa_bigger[13]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__2_i_16
       (.I0(A[12]),
        .I1(p_0_in_0),
        .I2(B[12]),
        .O(mantissa_bigger[12]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h11100010)) 
    i__carry__2_i_17
       (.I0(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(A[22]),
        .I3(p_0_in_0),
        .I4(B[22]),
        .O(i__carry__2_i_17_n_0));
  LUT6 #(
    .INIT(64'hB0B0B0808080B080)) 
    i__carry__2_i_18
       (.I0(A[20]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry__4_i_10_n_0),
        .I3(A[16]),
        .I4(p_0_in_0),
        .I5(B[16]),
        .O(i__carry__2_i_18_n_0));
  LUT6 #(
    .INIT(64'hB8FF0000B8000000)) 
    i__carry__2_i_19
       (.I0(B[21]),
        .I1(p_0_in_0),
        .I2(A[21]),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I4(i__carry__4_i_10_n_0),
        .I5(mantissa_smaller[17]),
        .O(i__carry__2_i_19_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__2_i_2
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__2_i_10_n_0),
        .I3(i__carry__2_i_11_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__2_i_2_n_0));
  LUT6 #(
    .INIT(64'h8A80FFFF8A800000)) 
    i__carry__2_i_20
       (.I0(i__carry__4_i_10_n_0),
        .I1(B[31]),
        .I2(p_0_in_0),
        .I3(A[20]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I5(i__carry__1_i_20_n_0),
        .O(i__carry__2_i_20_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__2_i_3
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__2_i_11_n_0),
        .I3(i__carry__2_i_12_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__2_i_3_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__2_i_4
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__2_i_12_n_0),
        .I3(i__carry__1_i_9_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__2_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__2_i_5
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__2_i_10_n_0),
        .I2(i__carry__2_i_9_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[15]),
        .O(i__carry__2_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__2_i_6
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__2_i_11_n_0),
        .I2(i__carry__2_i_10_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[14]),
        .O(i__carry__2_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__2_i_7
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__2_i_12_n_0),
        .I2(i__carry__2_i_11_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[13]),
        .O(i__carry__2_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__2_i_8
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__1_i_9_n_0),
        .I2(i__carry__2_i_12_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[12]),
        .O(i__carry__2_i_8_n_0));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    i__carry__2_i_9
       (.I0(i__carry__2_i_17_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry__4_i_10_n_0),
        .I3(A[18]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I5(i__carry__2_i_18_n_0),
        .O(i__carry__2_i_9_n_0));
  LUT5 #(
    .INIT(32'h5555A959)) 
    i__carry__3_i_1
       (.I0(i__carry_i_9_n_0),
        .I1(i__carry__3_i_8_n_0),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I3(i__carry__3_i_9_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__3_i_1_n_0));
  LUT6 #(
    .INIT(64'h30BB300030883000)) 
    i__carry__3_i_10
       (.I0(A[20]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry__2_i_17_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I4(i__carry__4_i_10_n_0),
        .I5(A[18]),
        .O(i__carry__3_i_10_n_0));
  LUT6 #(
    .INIT(64'h0302FFFF03020000)) 
    i__carry__3_i_11
       (.I0(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I3(mantissa_smaller[19]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I5(i__carry__2_i_19_n_0),
        .O(i__carry__3_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__3_i_12
       (.I0(A[17]),
        .I1(p_0_in_0),
        .I2(B[17]),
        .O(mantissa_bigger[17]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__3_i_13
       (.I0(A[16]),
        .I1(p_0_in_0),
        .I2(B[16]),
        .O(mantissa_bigger[16]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h10111000)) 
    i__carry__3_i_14
       (.I0(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(B[21]),
        .I3(p_0_in_0),
        .I4(A[21]),
        .O(i__carry__3_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    i__carry__3_i_15
       (.I0(A[20]),
        .I1(p_0_in_0),
        .I2(B[31]),
        .O(mantissa_smaller[19]));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__3_i_2
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__3_i_10_n_0),
        .I3(i__carry__3_i_11_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__3_i_2_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__3_i_3
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__3_i_11_n_0),
        .I3(i__carry__2_i_9_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__3_i_3_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__3_i_4
       (.I0(i__carry__3_i_1_n_0),
        .I1(p_0_in_0),
        .I2(B[31]),
        .I3(A[20]),
        .O(i__carry__3_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__3_i_5
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__3_i_10_n_0),
        .I2(i__carry__3_i_8_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(A[18]),
        .O(i__carry__3_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__3_i_6
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__3_i_11_n_0),
        .I2(i__carry__3_i_10_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[17]),
        .O(i__carry__3_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__3_i_7
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__2_i_9_n_0),
        .I2(i__carry__3_i_11_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[16]),
        .O(i__carry__3_i_7_n_0));
  LUT6 #(
    .INIT(64'h0808083B08080838)) 
    i__carry__3_i_8
       (.I0(i__carry__3_i_14_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(mantissa_smaller[19]),
        .O(i__carry__3_i_8_n_0));
  LUT6 #(
    .INIT(64'h00000000AAAA0300)) 
    i__carry__3_i_9
       (.I0(i__carry__2_i_17_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I3(A[20]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I5(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .O(i__carry__3_i_9_n_0));
  LUT5 #(
    .INIT(32'h55556A65)) 
    i__carry__4_i_1
       (.I0(i__carry_i_9_n_0),
        .I1(i__carry__4_i_7_n_0),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I3(i__carry__4_i_8_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__4_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__4_i_10
       (.I0(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry__4_i_10_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry__4_i_2
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry__4_i_8_n_0),
        .I3(i__carry__4_i_9_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry__4_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA9AA)) 
    i__carry__4_i_3
       (.I0(i__carry_i_9_n_0),
        .I1(i__carry_i_12_n_0),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I3(i__carry__4_i_10_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I5(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .O(i__carry__4_i_3_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    i__carry__4_i_4
       (.I0(i__carry__4_i_1_n_0),
        .I1(B[22]),
        .I2(p_0_in_0),
        .I3(A[22]),
        .O(i__carry__4_i_4_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__4_i_5
       (.I0(i__carry__4_i_2_n_0),
        .I1(p_0_in_0),
        .I2(B[21]),
        .I3(A[21]),
        .O(i__carry__4_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry__4_i_6
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry__3_i_9_n_0),
        .I2(i__carry__4_i_9_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(A[20]),
        .O(i__carry__4_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__carry__4_i_7
       (.I0(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry__4_i_7_n_0));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    i__carry__4_i_8
       (.I0(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(B[22]),
        .I3(p_0_in_0),
        .I4(A[22]),
        .I5(i__carry__4_i_10_n_0),
        .O(i__carry__4_i_8_n_0));
  LUT6 #(
    .INIT(64'h00000000AAAA8A80)) 
    i__carry__4_i_9
       (.I0(i__carry__4_i_10_n_0),
        .I1(B[21]),
        .I2(p_0_in_0),
        .I3(A[21]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I5(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .O(i__carry__4_i_9_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__5_i_1
       (.I0(B[24]),
        .I1(B[31]),
        .O(i__carry__5_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    i__carry_i_1
       (.I0(A[0]),
        .I1(B[31]),
        .I2(p_0_in_0),
        .O(mantissa_bigger[0]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    i__carry_i_10
       (.I0(i__carry_i_18_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry_i_19_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I4(i__carry_i_20_n_0),
        .O(i__carry_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    i__carry_i_10__0
       (.I0(i__carry_i_14__0_n_0),
        .I1(i__carry_i_13__0_n_0),
        .I2(\out[7]_i_6_n_0 ),
        .O(i__carry_i_10__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_11
       (.I0(i__carry_i_21_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry_i_22_n_0),
        .O(i__carry_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFBFBBBBAAAAAAAA)) 
    i__carry_i_11__0
       (.I0(i__carry_i_15__0_n_0),
        .I1(i__carry_i_16__0_n_0),
        .I2(i__carry_i_17__0_n_0),
        .I3(\out[30]_i_9_n_0 ),
        .I4(i__carry_i_18__0_n_0),
        .I5(i__carry_i_19__0_n_0),
        .O(i__carry_i_11__0_n_0));
  LUT6 #(
    .INIT(64'hFFFEFEFEFEFEFEFE)) 
    i__carry_i_12
       (.I0(\shifted_mantissa3_inferred__0/i__carry__0_n_6 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry__0_n_5 ),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_4 ),
        .I3(i__carry_i_23_n_0),
        .I4(i__carry_i_24_n_0),
        .I5(i__carry_i_25_n_0),
        .O(i__carry_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF0EFFFFFFFF)) 
    i__carry_i_12__0
       (.I0(\mantissa_sum_2_reg_n_0_[18] ),
        .I1(\mantissa_sum_2_reg_n_0_[19] ),
        .I2(i__carry_i_20__0_n_0),
        .I3(\mantissa_sum_2_reg_n_0_[23] ),
        .I4(\mantissa_sum_2_reg_n_0_[22] ),
        .I5(i__carry_i_21__0_n_0),
        .O(i__carry_i_12__0_n_0));
  LUT5 #(
    .INIT(32'hBBB8B8B8)) 
    i__carry_i_13
       (.I0(i__carry_i_20_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry_i_26_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I4(i__carry_i_19_n_0),
        .O(i__carry_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    i__carry_i_13__0
       (.I0(\mantissa_sum_2_reg_n_0_[11] ),
        .I1(\mantissa_sum_2_reg_n_0_[10] ),
        .I2(\mantissa_sum_2_reg_n_0_[9] ),
        .I3(\mantissa_sum_2_reg_n_0_[8] ),
        .I4(i__carry_i_16__0_n_0),
        .O(i__carry_i_13__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_14
       (.I0(i__carry_i_27_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I2(i__carry_i_21_n_0),
        .O(i__carry_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    i__carry_i_14__0
       (.I0(\mantissa_sum_2_reg_n_0_[3] ),
        .I1(\mantissa_sum_2_reg_n_0_[2] ),
        .I2(\mantissa_sum_2_reg_n_0_[1] ),
        .I3(\mantissa_sum_2_reg_n_0_[0] ),
        .I4(\out[30]_i_9_n_0 ),
        .O(i__carry_i_14__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_15
       (.I0(B[4]),
        .I1(p_0_in_0),
        .I2(B[2]),
        .O(mantissa_bigger[2]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__carry_i_15__0
       (.I0(\mantissa_sum_2_reg_n_0_[20] ),
        .I1(\mantissa_sum_2_reg_n_0_[21] ),
        .I2(\mantissa_sum_2_reg_n_0_[22] ),
        .I3(\mantissa_sum_2_reg_n_0_[23] ),
        .O(i__carry_i_15__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    i__carry_i_16
       (.I0(A[16]),
        .I1(p_0_in_0),
        .I2(A[14]),
        .O(mantissa_bigger[1]));
  LUT4 #(
    .INIT(16'h0001)) 
    i__carry_i_16__0
       (.I0(\mantissa_sum_2_reg_n_0_[12] ),
        .I1(\mantissa_sum_2_reg_n_0_[13] ),
        .I2(\mantissa_sum_2_reg_n_0_[14] ),
        .I3(\mantissa_sum_2_reg_n_0_[15] ),
        .O(i__carry_i_16__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFDC100000DC10)) 
    i__carry_i_17
       (.I0(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry_i_28_n_0),
        .I3(i__carry_i_29_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_6 ),
        .I5(i__carry_i_22_n_0),
        .O(i__carry_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__carry_i_17__0
       (.I0(\mantissa_sum_2_reg_n_0_[0] ),
        .I1(\mantissa_sum_2_reg_n_0_[1] ),
        .I2(\mantissa_sum_2_reg_n_0_[2] ),
        .I3(\mantissa_sum_2_reg_n_0_[3] ),
        .O(i__carry_i_17__0_n_0));
  LUT6 #(
    .INIT(64'h0000B8B80000BB88)) 
    i__carry_i_18
       (.I0(mantissa_smaller[17]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(A[18]),
        .I3(B[22]),
        .I4(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I5(p_0_in_0),
        .O(i__carry_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    i__carry_i_18__0
       (.I0(\mantissa_sum_2_reg_n_0_[8] ),
        .I1(\mantissa_sum_2_reg_n_0_[9] ),
        .I2(\mantissa_sum_2_reg_n_0_[10] ),
        .I3(\mantissa_sum_2_reg_n_0_[11] ),
        .O(i__carry_i_18__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFF4040000F404)) 
    i__carry_i_19
       (.I0(p_0_in_0),
        .I1(A[5]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(mantissa_smaller[21]),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(i__carry_i_32_n_0),
        .O(i__carry_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    i__carry_i_19__0
       (.I0(\mantissa_sum_2_reg_n_0_[16] ),
        .I1(\mantissa_sum_2_reg_n_0_[17] ),
        .I2(\mantissa_sum_2_reg_n_0_[18] ),
        .I3(\mantissa_sum_2_reg_n_0_[19] ),
        .O(i__carry_i_19__0_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_1__0
       (.I0(A[26]),
        .I1(p_0_in_0),
        .I2(B[26]),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_1__1
       (.I0(final_exponent_reg[7]),
        .I1(final_exponent_reg[4]),
        .O(i__carry_i_1__1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    i__carry_i_2
       (.I0(A[25]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(i__carry_i_2_n_0));
  LUT5 #(
    .INIT(32'hBBB8B8B8)) 
    i__carry_i_20
       (.I0(i__carry_i_33_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry_i_34_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I4(i__carry_i_35_n_0),
        .O(i__carry_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_20__0
       (.I0(\mantissa_sum_2_reg_n_0_[21] ),
        .I1(\mantissa_sum_2_reg_n_0_[20] ),
        .O(i__carry_i_20__0_n_0));
  LUT6 #(
    .INIT(64'h4F400F0F4F400000)) 
    i__carry_i_21
       (.I0(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I1(mantissa_smaller[16]),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I3(i__carry_i_37_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(i__carry_i_38_n_0),
        .O(i__carry_i_21_n_0));
  LUT6 #(
    .INIT(64'hFFBBFFB0FFBBFFBB)) 
    i__carry_i_21__0
       (.I0(i__carry_i_22__0_n_0),
        .I1(i__carry_i_23__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[0] ),
        .I3(\mantissa_sum_2_reg_n_0_[16] ),
        .I4(\mantissa_sum_2_reg_n_0_[17] ),
        .I5(i__carry_i_24__0_n_0),
        .O(i__carry_i_21__0_n_0));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    i__carry_i_22
       (.I0(i__carry_i_39_n_0),
        .I1(i__carry_i_40_n_0),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I3(i__carry_i_41_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(i__carry_i_42_n_0),
        .O(i__carry_i_22_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0302)) 
    i__carry_i_22__0
       (.I0(\mantissa_sum_2_reg_n_0_[12] ),
        .I1(\mantissa_sum_2_reg_n_0_[14] ),
        .I2(\mantissa_sum_2_reg_n_0_[15] ),
        .I3(\mantissa_sum_2_reg_n_0_[13] ),
        .I4(i__carry_i_20__0_n_0),
        .I5(\mantissa_sum_2_reg_n_0_[17] ),
        .O(i__carry_i_22__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    i__carry_i_23
       (.I0(A[28]),
        .I1(B[28]),
        .I2(A[26]),
        .I3(p_0_in_0),
        .I4(B[26]),
        .O(i__carry_i_23_n_0));
  LUT6 #(
    .INIT(64'hFFFF0302FFFFFFFF)) 
    i__carry_i_23__0
       (.I0(\mantissa_sum_2_reg_n_0_[6] ),
        .I1(\mantissa_sum_2_reg_n_0_[8] ),
        .I2(\mantissa_sum_2_reg_n_0_[9] ),
        .I3(\mantissa_sum_2_reg_n_0_[7] ),
        .I4(i__carry_i_25__0_n_0),
        .I5(i__carry_i_26__0_n_0),
        .O(i__carry_i_23__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    i__carry_i_24
       (.I0(A[24]),
        .I1(B[24]),
        .I2(A[30]),
        .I3(p_0_in_0),
        .I4(B[30]),
        .O(i__carry_i_24_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    i__carry_i_24__0
       (.I0(i__carry_i_27__0_n_0),
        .I1(\mantissa_sum_2_reg_n_0_[1] ),
        .I2(i__carry_i_20__0_n_0),
        .I3(\mantissa_sum_2_reg_n_0_[13] ),
        .I4(\mantissa_sum_2_reg_n_0_[12] ),
        .I5(i__carry_i_28__0_n_0),
        .O(i__carry_i_24__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h0F000F11)) 
    i__carry_i_25
       (.I0(A[23]),
        .I1(A[25]),
        .I2(B[29]),
        .I3(p_0_in_0),
        .I4(A[29]),
        .O(i__carry_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__carry_i_25__0
       (.I0(\mantissa_sum_2_reg_n_0_[10] ),
        .I1(\mantissa_sum_2_reg_n_0_[11] ),
        .I2(\mantissa_sum_2_reg_n_0_[14] ),
        .I3(\mantissa_sum_2_reg_n_0_[15] ),
        .O(i__carry_i_25__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    i__carry_i_26
       (.I0(i__carry_i_43_n_0),
        .I1(i__carry_i_44_n_0),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .O(i__carry_i_26_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEEF)) 
    i__carry_i_26__0
       (.I0(\mantissa_sum_2_reg_n_0_[9] ),
        .I1(\mantissa_sum_2_reg_n_0_[8] ),
        .I2(\mantissa_sum_2_reg_n_0_[2] ),
        .I3(\mantissa_sum_2_reg_n_0_[3] ),
        .I4(\mantissa_sum_2_reg_n_0_[5] ),
        .I5(\mantissa_sum_2_reg_n_0_[4] ),
        .O(i__carry_i_26__0_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    i__carry_i_27
       (.I0(i__carry_i_45_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_5 ),
        .I2(i__carry_i_41_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I4(i__carry_i_42_n_0),
        .O(i__carry_i_27_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_27__0
       (.I0(\mantissa_sum_2_reg_n_0_[5] ),
        .I1(\mantissa_sum_2_reg_n_0_[4] ),
        .O(i__carry_i_27__0_n_0));
  LUT6 #(
    .INIT(64'hFA0AFCFCFA0A0C0C)) 
    i__carry_i_28
       (.I0(B[31]),
        .I1(A[0]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(B[16]),
        .I4(p_0_in_0),
        .I5(A[16]),
        .O(i__carry_i_28_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_28__0
       (.I0(\mantissa_sum_2_reg_n_0_[9] ),
        .I1(\mantissa_sum_2_reg_n_0_[8] ),
        .O(i__carry_i_28__0_n_0));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    i__carry_i_29
       (.I0(B[12]),
        .I1(A[12]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(p_0_in_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(i__carry_i_38_n_0),
        .O(i__carry_i_29_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry_i_2__0
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry_i_10_n_0),
        .I3(i__carry_i_11_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry_i_2__0_n_0));
  LUT3 #(
    .INIT(8'hEC)) 
    i__carry_i_2__1
       (.I0(i__carry_i_9__0_n_0),
        .I1(final_exponent_reg[5]),
        .I2(final_exponent_reg[4]),
        .O(i__carry_i_2__1_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_3
       (.I0(A[24]),
        .I1(p_0_in_0),
        .I2(B[24]),
        .O(i__carry_i_3_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_30
       (.I0(B[17]),
        .I1(p_0_in_0),
        .I2(A[17]),
        .O(mantissa_smaller[17]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    i__carry_i_31
       (.I0(A[21]),
        .I1(p_0_in_0),
        .I2(B[21]),
        .O(mantissa_smaller[21]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    i__carry_i_32
       (.I0(B[13]),
        .I1(A[13]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(p_0_in_0),
        .O(i__carry_i_32_n_0));
  LUT6 #(
    .INIT(64'h3333E2E23333EE22)) 
    i__carry_i_33
       (.I0(B[21]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(B[15]),
        .I3(A[15]),
        .I4(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I5(p_0_in_0),
        .O(i__carry_i_33_n_0));
  LUT6 #(
    .INIT(64'h0000CCAA0000F0F0)) 
    i__carry_i_34
       (.I0(A[20]),
        .I1(B[31]),
        .I2(B[21]),
        .I3(p_0_in_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I5(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    i__carry_i_35
       (.I0(B[11]),
        .I1(p_0_in_0),
        .I2(B[21]),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_36
       (.I0(B[16]),
        .I1(p_0_in_0),
        .I2(A[16]),
        .O(mantissa_smaller[16]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    i__carry_i_37
       (.I0(B[12]),
        .I1(A[12]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(p_0_in_0),
        .O(i__carry_i_37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFF00E4E4)) 
    i__carry_i_38
       (.I0(p_0_in_0),
        .I1(A[4]),
        .I2(B[4]),
        .I3(A[20]),
        .I4(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFF00E4E4)) 
    i__carry_i_39
       (.I0(p_0_in_0),
        .I1(B[4]),
        .I2(B[2]),
        .I3(A[18]),
        .I4(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_39_n_0));
  LUT5 #(
    .INIT(32'h5555A695)) 
    i__carry_i_3__0
       (.I0(i__carry_i_9_n_0),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I2(i__carry_i_11_n_0),
        .I3(i__carry_i_13_n_0),
        .I4(i__carry_i_12_n_0),
        .O(i__carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'hE888)) 
    i__carry_i_3__1
       (.I0(final_exponent_reg[3]),
        .I1(i__carry_i_10__0_n_0),
        .I2(final_exponent_reg[2]),
        .I3(i__carry_i_11__0_n_0),
        .O(i__carry_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4
       (.I0(B[24]),
        .I1(B[31]),
        .O(i__carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    i__carry_i_40
       (.I0(B[11]),
        .I1(p_0_in_0),
        .I2(A[14]),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    i__carry_i_41
       (.I0(B[14]),
        .I1(p_0_in_0),
        .I2(A[14]),
        .I3(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_41_n_0));
  LUT6 #(
    .INIT(64'hFA0AFCFCFA0A0C0C)) 
    i__carry_i_42
       (.I0(B[31]),
        .I1(B[17]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(B[22]),
        .I4(p_0_in_0),
        .I5(A[22]),
        .O(i__carry_i_42_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    i__carry_i_43
       (.I0(A[18]),
        .I1(B[22]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(p_0_in_0),
        .O(i__carry_i_43_n_0));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    i__carry_i_44
       (.I0(A[14]),
        .I1(A[16]),
        .I2(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .I3(B[17]),
        .I4(p_0_in_0),
        .I5(A[17]),
        .O(i__carry_i_44_n_0));
  LUT6 #(
    .INIT(64'h00000000B8BBB888)) 
    i__carry_i_45
       (.I0(A[18]),
        .I1(\shifted_mantissa3_inferred__0/i__carry_n_4 ),
        .I2(B[11]),
        .I3(p_0_in_0),
        .I4(A[14]),
        .I5(\shifted_mantissa3_inferred__0/i__carry__0_n_7 ),
        .O(i__carry_i_45_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    i__carry_i_4__0
       (.I0(A[23]),
        .I1(B[29]),
        .I2(p_0_in_0),
        .O(i__carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'hE888)) 
    i__carry_i_4__1
       (.I0(final_exponent_reg[1]),
        .I1(i__carry_i_12__0_n_0),
        .I2(final_exponent_reg[0]),
        .I3(\out[7]_i_4_n_0 ),
        .O(i__carry_i_4__1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_5
       (.I0(final_exponent_reg[4]),
        .I1(final_exponent_reg[7]),
        .O(i__carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_5__0
       (.I0(A[26]),
        .I1(B[26]),
        .O(i__carry_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h99AA9A9A66556565)) 
    i__carry_i_5__1
       (.I0(B[21]),
        .I1(i__carry_i_12_n_0),
        .I2(i__carry_i_10_n_0),
        .I3(i__carry_i_14_n_0),
        .I4(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I5(i__carry_i_9_n_0),
        .O(i__carry_i_5__1_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry_i_6
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry_i_11_n_0),
        .I2(i__carry_i_10_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[2]),
        .O(i__carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_6__0
       (.I0(B[29]),
        .I1(A[25]),
        .O(i__carry_i_6__0_n_0));
  LUT3 #(
    .INIT(8'h12)) 
    i__carry_i_6__1
       (.I0(i__carry_i_9__0_n_0),
        .I1(final_exponent_reg[5]),
        .I2(final_exponent_reg[4]),
        .O(i__carry_i_6__1_n_0));
  LUT6 #(
    .INIT(64'hAFBB50445044AFBB)) 
    i__carry_i_7
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry_i_13_n_0),
        .I2(i__carry_i_11_n_0),
        .I3(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I4(i__carry_i_9_n_0),
        .I5(mantissa_bigger[1]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    i__carry_i_7__0
       (.I0(i__carry_i_10__0_n_0),
        .I1(final_exponent_reg[3]),
        .I2(i__carry_i_11__0_n_0),
        .I3(final_exponent_reg[2]),
        .O(i__carry_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_7__1
       (.I0(A[24]),
        .I1(B[24]),
        .O(i__carry_i_7__1_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    i__carry_i_8
       (.I0(i__carry_i_12__0_n_0),
        .I1(final_exponent_reg[1]),
        .I2(\out[7]_i_4_n_0 ),
        .I3(final_exponent_reg[0]),
        .O(i__carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h4540)) 
    i__carry_i_8__0
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry_i_13_n_0),
        .I2(\shifted_mantissa3_inferred__0/i__carry_n_7 ),
        .I3(i__carry_i_17_n_0),
        .O(i__carry_i_8__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_8__1
       (.I0(B[29]),
        .I1(A[23]),
        .O(i__carry_i_8__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_9
       (.I0(B[31]),
        .I1(B[24]),
        .O(i__carry_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h7)) 
    i__carry_i_9__0
       (.I0(i__carry_i_13__0_n_0),
        .I1(\out[7]_i_6_n_0 ),
        .O(i__carry_i_9__0_n_0));
  FDCE \mantissa_sum_2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry_n_7 ),
        .Q(\mantissa_sum_2_reg_n_0_[0] ));
  FDCE \mantissa_sum_2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__1_n_5 ),
        .Q(\mantissa_sum_2_reg_n_0_[10] ));
  FDCE \mantissa_sum_2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__1_n_4 ),
        .Q(\mantissa_sum_2_reg_n_0_[11] ));
  FDCE \mantissa_sum_2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__2_n_7 ),
        .Q(\mantissa_sum_2_reg_n_0_[12] ));
  FDCE \mantissa_sum_2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__2_n_6 ),
        .Q(\mantissa_sum_2_reg_n_0_[13] ));
  FDCE \mantissa_sum_2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__2_n_5 ),
        .Q(\mantissa_sum_2_reg_n_0_[14] ));
  FDCE \mantissa_sum_2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__2_n_4 ),
        .Q(\mantissa_sum_2_reg_n_0_[15] ));
  FDCE \mantissa_sum_2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__3_n_7 ),
        .Q(\mantissa_sum_2_reg_n_0_[16] ));
  FDCE \mantissa_sum_2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__3_n_6 ),
        .Q(\mantissa_sum_2_reg_n_0_[17] ));
  FDCE \mantissa_sum_2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__3_n_5 ),
        .Q(\mantissa_sum_2_reg_n_0_[18] ));
  FDCE \mantissa_sum_2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__3_n_4 ),
        .Q(\mantissa_sum_2_reg_n_0_[19] ));
  FDCE \mantissa_sum_2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry_n_6 ),
        .Q(\mantissa_sum_2_reg_n_0_[1] ));
  FDCE \mantissa_sum_2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__4_n_7 ),
        .Q(\mantissa_sum_2_reg_n_0_[20] ));
  FDCE \mantissa_sum_2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__4_n_6 ),
        .Q(\mantissa_sum_2_reg_n_0_[21] ));
  FDCE \mantissa_sum_2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__4_n_5 ),
        .Q(\mantissa_sum_2_reg_n_0_[22] ));
  FDCE \mantissa_sum_2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__4_n_4 ),
        .Q(\mantissa_sum_2_reg_n_0_[23] ));
  FDCE \mantissa_sum_2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry_n_5 ),
        .Q(\mantissa_sum_2_reg_n_0_[2] ));
  FDCE \mantissa_sum_2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry_n_4 ),
        .Q(\mantissa_sum_2_reg_n_0_[3] ));
  FDCE \mantissa_sum_2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__0_n_7 ),
        .Q(\mantissa_sum_2_reg_n_0_[4] ));
  FDCE \mantissa_sum_2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__0_n_6 ),
        .Q(\mantissa_sum_2_reg_n_0_[5] ));
  FDCE \mantissa_sum_2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__0_n_5 ),
        .Q(\mantissa_sum_2_reg_n_0_[6] ));
  FDCE \mantissa_sum_2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__0_n_4 ),
        .Q(\mantissa_sum_2_reg_n_0_[7] ));
  FDCE \mantissa_sum_2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__1_n_7 ),
        .Q(\mantissa_sum_2_reg_n_0_[8] ));
  FDCE \mantissa_sum_2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\_inferred__2/i__carry__1_n_6 ),
        .Q(\mantissa_sum_2_reg_n_0_[9] ));
  LUT4 #(
    .INIT(16'hB888)) 
    \out[0]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[1] ),
        .I1(carry_2),
        .I2(\out[1]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .O(result[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[16]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[17] ),
        .I1(carry_2),
        .I2(\out[17]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[16]_i_2_n_0 ),
        .O(result[16]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[16]_i_2 
       (.I0(\out[18]_i_3_n_0 ),
        .I1(i__carry_i_12__0_n_0),
        .I2(\out[20]_i_3_n_0 ),
        .I3(i__carry_i_11__0_n_0),
        .I4(\out[16]_i_3_n_0 ),
        .O(\out[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hAAC0)) 
    \out[16]_i_3 
       (.I0(\mantissa_sum_2_reg_n_0_[9] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[1] ),
        .I3(i__carry_i_10__0_n_0),
        .O(\out[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[17]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[18] ),
        .I1(carry_2),
        .I2(\out[18]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[17]_i_2_n_0 ),
        .O(result[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out[17]_i_2 
       (.I0(\out[22]_i_7_n_0 ),
        .I1(\out[19]_i_3_n_0 ),
        .I2(i__carry_i_12__0_n_0),
        .I3(\out[21]_i_3_n_0 ),
        .I4(i__carry_i_11__0_n_0),
        .I5(\out[17]_i_3_n_0 ),
        .O(\out[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \out[17]_i_3 
       (.I0(\mantissa_sum_2_reg_n_0_[10] ),
        .I1(i__carry_i_10__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[2] ),
        .I3(i__carry_i_9__0_n_0),
        .O(\out[17]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[18]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[19] ),
        .I1(carry_2),
        .I2(\out[19]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[18]_i_2_n_0 ),
        .O(result[18]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \out[18]_i_2 
       (.I0(\out[22]_i_8_n_0 ),
        .I1(i__carry_i_11__0_n_0),
        .I2(\out[20]_i_3_n_0 ),
        .I3(i__carry_i_12__0_n_0),
        .I4(\out[18]_i_3_n_0 ),
        .O(\out[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    \out[18]_i_3 
       (.I0(\out[22]_i_12_n_0 ),
        .I1(i__carry_i_11__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[11] ),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[3] ),
        .I5(i__carry_i_9__0_n_0),
        .O(\out[18]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[19]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[20] ),
        .I1(carry_2),
        .I2(\out[20]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[19]_i_2_n_0 ),
        .O(result[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out[19]_i_2 
       (.I0(\out[22]_i_5_n_0 ),
        .I1(\out[21]_i_3_n_0 ),
        .I2(i__carry_i_12__0_n_0),
        .I3(\out[22]_i_7_n_0 ),
        .I4(i__carry_i_11__0_n_0),
        .I5(\out[19]_i_3_n_0 ),
        .O(\out[19]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \out[19]_i_3 
       (.I0(\mantissa_sum_2_reg_n_0_[4] ),
        .I1(i__carry_i_13__0_n_0),
        .I2(\out[7]_i_6_n_0 ),
        .I3(\mantissa_sum_2_reg_n_0_[12] ),
        .O(\out[19]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[1]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[2] ),
        .I1(carry_2),
        .I2(\out[2]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[1]_i_2_n_0 ),
        .O(result[1]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \out[1]_i_2 
       (.I0(i__carry_i_10__0_n_0),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[0] ),
        .I3(i__carry_i_11__0_n_0),
        .I4(i__carry_i_12__0_n_0),
        .O(\out[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[20]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[21] ),
        .I1(carry_2),
        .I2(\out[21]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[20]_i_2_n_0 ),
        .O(result[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[20]_i_2 
       (.I0(\out[22]_i_10_n_0 ),
        .I1(i__carry_i_12__0_n_0),
        .I2(\out[22]_i_8_n_0 ),
        .I3(i__carry_i_11__0_n_0),
        .I4(\out[20]_i_3_n_0 ),
        .O(\out[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hF808)) 
    \out[20]_i_3 
       (.I0(\mantissa_sum_2_reg_n_0_[5] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(i__carry_i_10__0_n_0),
        .I3(\mantissa_sum_2_reg_n_0_[13] ),
        .O(\out[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[21]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[22] ),
        .I1(carry_2),
        .I2(\out[22]_i_3_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[21]_i_2_n_0 ),
        .O(result[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out[21]_i_2 
       (.I0(\out[22]_i_6_n_0 ),
        .I1(\out[22]_i_7_n_0 ),
        .I2(i__carry_i_12__0_n_0),
        .I3(\out[22]_i_5_n_0 ),
        .I4(i__carry_i_11__0_n_0),
        .I5(\out[21]_i_3_n_0 ),
        .O(\out[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \out[21]_i_3 
       (.I0(\mantissa_sum_2_reg_n_0_[14] ),
        .I1(i__carry_i_10__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[6] ),
        .I3(i__carry_i_9__0_n_0),
        .O(\out[21]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[22]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[23] ),
        .I1(carry_2),
        .I2(\out[22]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[22]_i_3_n_0 ),
        .O(result[22]));
  LUT5 #(
    .INIT(32'hBAFFBA00)) 
    \out[22]_i_10 
       (.I0(\out[22]_i_11_n_0 ),
        .I1(i__carry_i_10__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[11] ),
        .I3(i__carry_i_11__0_n_0),
        .I4(\out[22]_i_12_n_0 ),
        .O(\out[22]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hEAAA)) 
    \out[22]_i_11 
       (.I0(\mantissa_sum_2_reg_n_0_[19] ),
        .I1(i__carry_i_13__0_n_0),
        .I2(\out[7]_i_6_n_0 ),
        .I3(\mantissa_sum_2_reg_n_0_[3] ),
        .O(\out[22]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \out[22]_i_12 
       (.I0(\mantissa_sum_2_reg_n_0_[7] ),
        .I1(i__carry_i_13__0_n_0),
        .I2(\out[7]_i_6_n_0 ),
        .I3(\mantissa_sum_2_reg_n_0_[15] ),
        .O(\out[22]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFAAEFEFAFAAEEEE)) 
    \out[22]_i_2 
       (.I0(\out[22]_i_4_n_0 ),
        .I1(\out[22]_i_5_n_0 ),
        .I2(i__carry_i_12__0_n_0),
        .I3(\out[22]_i_6_n_0 ),
        .I4(i__carry_i_11__0_n_0),
        .I5(\out[22]_i_7_n_0 ),
        .O(\out[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF4FFF400)) 
    \out[22]_i_3 
       (.I0(i__carry_i_11__0_n_0),
        .I1(\out[22]_i_8_n_0 ),
        .I2(\out[22]_i_9_n_0 ),
        .I3(i__carry_i_12__0_n_0),
        .I4(\out[22]_i_10_n_0 ),
        .O(\out[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hE2FFE2E2)) 
    \out[22]_i_4 
       (.I0(\mantissa_sum_2_reg_n_0_[6] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[22] ),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[14] ),
        .O(\out[22]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hE2FFE2E2)) 
    \out[22]_i_5 
       (.I0(\mantissa_sum_2_reg_n_0_[2] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[18] ),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[10] ),
        .O(\out[22]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hE2FFE2E2)) 
    \out[22]_i_6 
       (.I0(\mantissa_sum_2_reg_n_0_[4] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[20] ),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[12] ),
        .O(\out[22]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF44F4)) 
    \out[22]_i_7 
       (.I0(i__carry_i_10__0_n_0),
        .I1(\mantissa_sum_2_reg_n_0_[8] ),
        .I2(\mantissa_sum_2_reg_n_0_[0] ),
        .I3(i__carry_i_9__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[16] ),
        .O(\out[22]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hB8FFB8B8)) 
    \out[22]_i_8 
       (.I0(\mantissa_sum_2_reg_n_0_[17] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[1] ),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[9] ),
        .O(\out[22]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hF2FFF2F2)) 
    \out[22]_i_9 
       (.I0(\mantissa_sum_2_reg_n_0_[5] ),
        .I1(i__carry_i_9__0_n_0),
        .I2(\mantissa_sum_2_reg_n_0_[21] ),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[13] ),
        .O(\out[22]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \out[23]_i_1 
       (.I0(final_exponent_reg[0]),
        .I1(carry_2),
        .I2(\out[23]_i_2_n_0 ),
        .I3(\out[27]_i_2_n_0 ),
        .I4(final_exponent10_in[0]),
        .O(result[23]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \out[23]_i_2 
       (.I0(final_exponent_reg[2]),
        .I1(final_exponent_reg[3]),
        .I2(final_exponent_reg[5]),
        .I3(final_exponent_reg[0]),
        .I4(final_exponent_reg[1]),
        .I5(\out[23]_i_3_n_0 ),
        .O(\out[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \out[23]_i_3 
       (.I0(final_exponent_reg[4]),
        .I1(final_exponent_reg[7]),
        .O(\out[23]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h44F4F444)) 
    \out[24]_i_1 
       (.I0(\out[27]_i_2_n_0 ),
        .I1(final_exponent10_in[1]),
        .I2(carry_2),
        .I3(final_exponent_reg[0]),
        .I4(final_exponent_reg[1]),
        .O(result[24]));
  LUT6 #(
    .INIT(64'h4FF4F4F444444444)) 
    \out[25]_i_1 
       (.I0(\out[27]_i_2_n_0 ),
        .I1(final_exponent10_in[2]),
        .I2(final_exponent_reg[2]),
        .I3(final_exponent_reg[1]),
        .I4(final_exponent_reg[0]),
        .I5(carry_2),
        .O(result[25]));
  LUT5 #(
    .INIT(32'h4FF44444)) 
    \out[26]_i_1 
       (.I0(\out[27]_i_2_n_0 ),
        .I1(final_exponent10_in[3]),
        .I2(final_exponent_reg[3]),
        .I3(\out[26]_i_3_n_0 ),
        .I4(carry_2),
        .O(result[26]));
  LUT3 #(
    .INIT(8'h80)) 
    \out[26]_i_3 
       (.I0(final_exponent_reg[1]),
        .I1(final_exponent_reg[0]),
        .I2(final_exponent_reg[2]),
        .O(\out[26]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out[26]_i_4 
       (.I0(final_exponent_reg[3]),
        .I1(i__carry_i_10__0_n_0),
        .O(\out[26]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out[26]_i_5 
       (.I0(i__carry_i_11__0_n_0),
        .I1(final_exponent_reg[2]),
        .O(\out[26]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out[26]_i_6 
       (.I0(final_exponent_reg[1]),
        .I1(i__carry_i_12__0_n_0),
        .O(\out[26]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out[26]_i_7 
       (.I0(\out[7]_i_4_n_0 ),
        .I1(final_exponent_reg[0]),
        .O(\out[26]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h4FF44444)) 
    \out[27]_i_1 
       (.I0(\out[27]_i_2_n_0 ),
        .I1(final_exponent10_in[4]),
        .I2(final_exponent_reg[4]),
        .I3(\out[27]_i_3_n_0 ),
        .I4(carry_2),
        .O(result[27]));
  LUT3 #(
    .INIT(8'hFD)) 
    \out[27]_i_2 
       (.I0(\final_exponent2_inferred__0/i__carry_n_0 ),
        .I1(\out[30]_i_4_n_0 ),
        .I2(carry_2),
        .O(\out[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \out[27]_i_3 
       (.I0(final_exponent_reg[2]),
        .I1(final_exponent_reg[0]),
        .I2(final_exponent_reg[1]),
        .I3(final_exponent_reg[3]),
        .O(\out[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h606060606F606060)) 
    \out[28]_i_1 
       (.I0(final_exponent_reg[5]),
        .I1(\out[28]_i_2_n_0 ),
        .I2(carry_2),
        .I3(final_exponent10_in[5]),
        .I4(\final_exponent2_inferred__0/i__carry_n_0 ),
        .I5(\out[30]_i_4_n_0 ),
        .O(result[28]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \out[28]_i_2 
       (.I0(final_exponent_reg[3]),
        .I1(final_exponent_reg[1]),
        .I2(final_exponent_reg[0]),
        .I3(final_exponent_reg[2]),
        .I4(final_exponent_reg[4]),
        .O(\out[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h202020202F202020)) 
    \out[29]_i_1 
       (.I0(final_exponent_reg[4]),
        .I1(\out[30]_i_2_n_0 ),
        .I2(carry_2),
        .I3(final_exponent10_in[6]),
        .I4(\final_exponent2_inferred__0/i__carry_n_0 ),
        .I5(\out[30]_i_4_n_0 ),
        .O(result[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[2]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[3] ),
        .I1(carry_2),
        .I2(\out[3]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[2]_i_2_n_0 ),
        .O(result[2]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \out[2]_i_2 
       (.I0(i__carry_i_9__0_n_0),
        .I1(i__carry_i_11__0_n_0),
        .I2(i__carry_i_10__0_n_0),
        .I3(\mantissa_sum_2_reg_n_0_[1] ),
        .I4(i__carry_i_12__0_n_0),
        .O(\out[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h606060606F606060)) 
    \out[30]_i_1 
       (.I0(final_exponent_reg[7]),
        .I1(\out[30]_i_2_n_0 ),
        .I2(carry_2),
        .I3(final_exponent10_in[7]),
        .I4(\final_exponent2_inferred__0/i__carry_n_0 ),
        .I5(\out[30]_i_4_n_0 ),
        .O(result[30]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \out[30]_i_2 
       (.I0(final_exponent_reg[4]),
        .I1(final_exponent_reg[2]),
        .I2(final_exponent_reg[0]),
        .I3(final_exponent_reg[1]),
        .I4(final_exponent_reg[3]),
        .I5(final_exponent_reg[5]),
        .O(\out[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \out[30]_i_4 
       (.I0(\out[30]_i_9_n_0 ),
        .I1(\mantissa_sum_2_reg_n_0_[0] ),
        .I2(\mantissa_sum_2_reg_n_0_[1] ),
        .I3(\mantissa_sum_2_reg_n_0_[2] ),
        .I4(\mantissa_sum_2_reg_n_0_[3] ),
        .I5(i__carry_i_9__0_n_0),
        .O(\out[30]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out[30]_i_5 
       (.I0(final_exponent_reg[7]),
        .O(\out[30]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out[30]_i_6 
       (.I0(final_exponent_reg[4]),
        .O(\out[30]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out[30]_i_7 
       (.I0(final_exponent_reg[5]),
        .O(\out[30]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out[30]_i_8 
       (.I0(final_exponent_reg[4]),
        .I1(i__carry_i_9__0_n_0),
        .O(\out[30]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out[30]_i_9 
       (.I0(\mantissa_sum_2_reg_n_0_[4] ),
        .I1(\mantissa_sum_2_reg_n_0_[5] ),
        .I2(\mantissa_sum_2_reg_n_0_[6] ),
        .I3(\mantissa_sum_2_reg_n_0_[7] ),
        .O(\out[30]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[3]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[4] ),
        .I1(carry_2),
        .I2(\out[4]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[3]_i_2_n_0 ),
        .O(result[3]));
  LUT6 #(
    .INIT(64'hB080000000000000)) 
    \out[3]_i_2 
       (.I0(\mantissa_sum_2_reg_n_0_[2] ),
        .I1(i__carry_i_12__0_n_0),
        .I2(i__carry_i_11__0_n_0),
        .I3(\mantissa_sum_2_reg_n_0_[0] ),
        .I4(i__carry_i_9__0_n_0),
        .I5(i__carry_i_10__0_n_0),
        .O(\out[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[4]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[5] ),
        .I1(carry_2),
        .I2(\out[5]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[4]_i_2_n_0 ),
        .O(result[4]));
  LUT6 #(
    .INIT(64'h8A80000000000000)) 
    \out[4]_i_2 
       (.I0(i__carry_i_9__0_n_0),
        .I1(\mantissa_sum_2_reg_n_0_[3] ),
        .I2(i__carry_i_12__0_n_0),
        .I3(\mantissa_sum_2_reg_n_0_[1] ),
        .I4(i__carry_i_10__0_n_0),
        .I5(i__carry_i_11__0_n_0),
        .O(\out[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[5]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[6] ),
        .I1(carry_2),
        .I2(\out[6]_i_2_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[5]_i_2_n_0 ),
        .O(result[5]));
  LUT6 #(
    .INIT(64'hCAC0C0C0C0C0C0C0)) 
    \out[5]_i_2 
       (.I0(i__carry_i_9__0_n_0),
        .I1(\out[7]_i_14_n_0 ),
        .I2(i__carry_i_12__0_n_0),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[2] ),
        .I5(i__carry_i_11__0_n_0),
        .O(\out[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[6]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[7] ),
        .I1(carry_2),
        .I2(\out[7]_i_5_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[6]_i_2_n_0 ),
        .O(result[6]));
  LUT6 #(
    .INIT(64'hCAC0C0C0C0C0C0C0)) 
    \out[6]_i_2 
       (.I0(i__carry_i_9__0_n_0),
        .I1(\out[7]_i_8_n_0 ),
        .I2(i__carry_i_12__0_n_0),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[3] ),
        .I5(i__carry_i_11__0_n_0),
        .O(\out[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out[7]_i_1 
       (.I0(\mantissa_sum_2_reg_n_0_[8] ),
        .I1(carry_2),
        .I2(\out[7]_i_3_n_0 ),
        .I3(\out[7]_i_4_n_0 ),
        .I4(\out[7]_i_5_n_0 ),
        .O(result[7]));
  LUT6 #(
    .INIT(64'h00FF00FF000000F2)) 
    \out[7]_i_10 
       (.I0(\out[7]_i_15_n_0 ),
        .I1(\mantissa_sum_2_reg_n_0_[6] ),
        .I2(\mantissa_sum_2_reg_n_0_[7] ),
        .I3(\out[7]_i_16_n_0 ),
        .I4(\mantissa_sum_2_reg_n_0_[8] ),
        .I5(\out[7]_i_17_n_0 ),
        .O(\out[7]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    \out[7]_i_11 
       (.I0(\mantissa_sum_2_reg_n_0_[16] ),
        .I1(\mantissa_sum_2_reg_n_0_[15] ),
        .I2(\mantissa_sum_2_reg_n_0_[21] ),
        .I3(\mantissa_sum_2_reg_n_0_[19] ),
        .I4(\mantissa_sum_2_reg_n_0_[17] ),
        .O(\out[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \out[7]_i_12 
       (.I0(\mantissa_sum_2_reg_n_0_[14] ),
        .I1(\mantissa_sum_2_reg_n_0_[16] ),
        .O(\out[7]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[7]_i_13 
       (.I0(i__carry_i_9__0_n_0),
        .I1(\mantissa_sum_2_reg_n_0_[2] ),
        .I2(i__carry_i_10__0_n_0),
        .O(\out[7]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h2F20202020202020)) 
    \out[7]_i_14 
       (.I0(\mantissa_sum_2_reg_n_0_[4] ),
        .I1(\out[7]_i_6_n_0 ),
        .I2(i__carry_i_11__0_n_0),
        .I3(i__carry_i_10__0_n_0),
        .I4(i__carry_i_9__0_n_0),
        .I5(\mantissa_sum_2_reg_n_0_[0] ),
        .O(\out[7]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAEEEEFFEF)) 
    \out[7]_i_15 
       (.I0(\mantissa_sum_2_reg_n_0_[5] ),
        .I1(\mantissa_sum_2_reg_n_0_[3] ),
        .I2(\mantissa_sum_2_reg_n_0_[0] ),
        .I3(\mantissa_sum_2_reg_n_0_[1] ),
        .I4(\mantissa_sum_2_reg_n_0_[2] ),
        .I5(\mantissa_sum_2_reg_n_0_[4] ),
        .O(\out[7]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hFFFFEEFE)) 
    \out[7]_i_16 
       (.I0(\mantissa_sum_2_reg_n_0_[16] ),
        .I1(\mantissa_sum_2_reg_n_0_[14] ),
        .I2(\mantissa_sum_2_reg_n_0_[10] ),
        .I3(\mantissa_sum_2_reg_n_0_[11] ),
        .I4(\mantissa_sum_2_reg_n_0_[12] ),
        .O(\out[7]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \out[7]_i_17 
       (.I0(\mantissa_sum_2_reg_n_0_[11] ),
        .I1(\mantissa_sum_2_reg_n_0_[9] ),
        .O(\out[7]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h2F20FFFF2F200000)) 
    \out[7]_i_3 
       (.I0(\mantissa_sum_2_reg_n_0_[7] ),
        .I1(\out[7]_i_6_n_0 ),
        .I2(i__carry_i_11__0_n_0),
        .I3(\out[7]_i_7_n_0 ),
        .I4(i__carry_i_12__0_n_0),
        .I5(\out[7]_i_8_n_0 ),
        .O(\out[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBABBBBBBBA)) 
    \out[7]_i_4 
       (.I0(\mantissa_sum_2_reg_n_0_[23] ),
        .I1(\out[7]_i_9_n_0 ),
        .I2(\out[7]_i_10_n_0 ),
        .I3(\out[7]_i_11_n_0 ),
        .I4(\mantissa_sum_2_reg_n_0_[13] ),
        .I5(\out[7]_i_12_n_0 ),
        .O(\out[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h2F20FFFF2F200000)) 
    \out[7]_i_5 
       (.I0(\mantissa_sum_2_reg_n_0_[6] ),
        .I1(\out[7]_i_6_n_0 ),
        .I2(i__carry_i_11__0_n_0),
        .I3(\out[7]_i_13_n_0 ),
        .I4(i__carry_i_12__0_n_0),
        .I5(\out[7]_i_14_n_0 ),
        .O(\out[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \out[7]_i_6 
       (.I0(\mantissa_sum_2_reg_n_0_[19] ),
        .I1(\mantissa_sum_2_reg_n_0_[18] ),
        .I2(\mantissa_sum_2_reg_n_0_[17] ),
        .I3(\mantissa_sum_2_reg_n_0_[16] ),
        .I4(i__carry_i_15__0_n_0),
        .O(\out[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[7]_i_7 
       (.I0(i__carry_i_9__0_n_0),
        .I1(\mantissa_sum_2_reg_n_0_[3] ),
        .I2(i__carry_i_10__0_n_0),
        .O(\out[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h2F20202020202020)) 
    \out[7]_i_8 
       (.I0(\mantissa_sum_2_reg_n_0_[5] ),
        .I1(\out[7]_i_6_n_0 ),
        .I2(i__carry_i_11__0_n_0),
        .I3(i__carry_i_10__0_n_0),
        .I4(\mantissa_sum_2_reg_n_0_[1] ),
        .I5(i__carry_i_9__0_n_0),
        .O(\out[7]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hBABBBABA)) 
    \out[7]_i_9 
       (.I0(\mantissa_sum_2_reg_n_0_[22] ),
        .I1(\mantissa_sum_2_reg_n_0_[21] ),
        .I2(\mantissa_sum_2_reg_n_0_[20] ),
        .I3(\mantissa_sum_2_reg_n_0_[19] ),
        .I4(\mantissa_sum_2_reg_n_0_[18] ),
        .O(\out[7]_i_9_n_0 ));
  FDCE \out_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[0]),
        .Q(leds_AXI[0]));
  FDCE \out_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[16]),
        .Q(fp_out[16]));
  FDCE \out_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[17]),
        .Q(fp_out[17]));
  FDCE \out_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[18]),
        .Q(fp_out[18]));
  FDCE \out_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[19]),
        .Q(fp_out[19]));
  FDCE \out_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[1]),
        .Q(leds_AXI[1]));
  FDCE \out_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[20]),
        .Q(fp_out[20]));
  FDCE \out_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[21]),
        .Q(fp_out[21]));
  FDCE \out_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[22]),
        .Q(fp_out[22]));
  FDCE \out_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[23]),
        .Q(fp_out[23]));
  FDCE \out_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[24]),
        .Q(fp_out[24]));
  FDCE \out_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[25]),
        .Q(fp_out[25]));
  FDCE \out_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[26]),
        .Q(fp_out[26]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_reg[26]_i_2 
       (.CI(1'b0),
        .CO({\out_reg[26]_i_2_n_0 ,\out_reg[26]_i_2_n_1 ,\out_reg[26]_i_2_n_2 ,\out_reg[26]_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI(final_exponent_reg[3:0]),
        .O(final_exponent10_in[3:0]),
        .S({\out[26]_i_4_n_0 ,\out[26]_i_5_n_0 ,\out[26]_i_6_n_0 ,\out[26]_i_7_n_0 }));
  FDCE \out_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[27]),
        .Q(fp_out[27]));
  FDCE \out_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[28]),
        .Q(fp_out[28]));
  FDCE \out_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[29]),
        .Q(fp_out[29]));
  FDCE \out_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[2]),
        .Q(leds_AXI[2]));
  FDCE \out_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[30]),
        .Q(fp_out[30]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_reg[30]_i_3 
       (.CI(\out_reg[26]_i_2_n_0 ),
        .CO({\NLW_out_reg[30]_i_3_CO_UNCONNECTED [3],\out_reg[30]_i_3_n_1 ,\out_reg[30]_i_3_n_2 ,\out_reg[30]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,final_exponent_reg[4],final_exponent_reg[5:4]}),
        .O(final_exponent10_in[7:4]),
        .S({\out[30]_i_5_n_0 ,\out[30]_i_6_n_0 ,\out[30]_i_7_n_0 ,\out[30]_i_8_n_0 }));
  FDCE \out_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(bigger_sign_2),
        .Q(fp_out[31]));
  FDCE \out_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[3]),
        .Q(leds_AXI[3]));
  FDCE \out_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[4]),
        .Q(leds_AXI[4]));
  FDCE \out_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[5]),
        .Q(leds_AXI[5]));
  FDCE \out_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[6]),
        .Q(leds_AXI[6]));
  FDCE \out_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(result[7]),
        .Q(leds_AXI[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \shifted_mantissa3_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\shifted_mantissa3_inferred__0/i__carry_n_0 ,\shifted_mantissa3_inferred__0/i__carry_n_1 ,\shifted_mantissa3_inferred__0/i__carry_n_2 ,\shifted_mantissa3_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({i__carry_i_1__0_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4__0_n_0}),
        .O({\shifted_mantissa3_inferred__0/i__carry_n_4 ,\shifted_mantissa3_inferred__0/i__carry_n_5 ,\shifted_mantissa3_inferred__0/i__carry_n_6 ,\shifted_mantissa3_inferred__0/i__carry_n_7 }),
        .S({i__carry_i_5__0_n_0,i__carry_i_6__0_n_0,i__carry_i_7__1_n_0,i__carry_i_8__1_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \shifted_mantissa3_inferred__0/i__carry__0 
       (.CI(\shifted_mantissa3_inferred__0/i__carry_n_0 ),
        .CO({\NLW_shifted_mantissa3_inferred__0/i__carry__0_CO_UNCONNECTED [3],\shifted_mantissa3_inferred__0/i__carry__0_n_1 ,\shifted_mantissa3_inferred__0/i__carry__0_n_2 ,\shifted_mantissa3_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0}),
        .O({\shifted_mantissa3_inferred__0/i__carry__0_n_4 ,\shifted_mantissa3_inferred__0/i__carry__0_n_5 ,\shifted_mantissa3_inferred__0/i__carry__0_n_6 ,\shifted_mantissa3_inferred__0/i__carry__0_n_7 }),
        .S({i__carry__0_i_4_n_0,i__carry__0_i_5__0_n_0,i__carry__0_i_6__0_n_0,i__carry__0_i_7__0_n_0}));
endmodule

(* ORIG_REF_NAME = "fpadd_system" *) 
module lab2_simple_arm_adder_ip_0_0_fpadd_system
   (\counter_reg[4] ,
    c0,
    g0,
    f0,
    e0,
    d0,
    b0,
    a0,
    c1,
    g1,
    f1,
    e1,
    d1,
    b1,
    a1,
    leds_AXI,
    s00_axi_aclk,
    s00_axi_aresetn,
    Q,
    signal_out_reg,
    a1_0);
  output [0:0]\counter_reg[4] ;
  output c0;
  output g0;
  output f0;
  output e0;
  output d0;
  output b0;
  output a0;
  output c1;
  output g1;
  output f1;
  output e1;
  output d1;
  output b1;
  output a1;
  output [7:0]leds_AXI;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [0:0]Q;
  input [0:0]signal_out_reg;
  input [0:0]a1_0;

  wire [1:0]\L2P/current_state ;
  wire MEM_n_0;
  wire MEM_n_1;
  wire MEM_n_10;
  wire MEM_n_11;
  wire MEM_n_13;
  wire MEM_n_14;
  wire MEM_n_2;
  wire MEM_n_3;
  wire MEM_n_33;
  wire MEM_n_34;
  wire MEM_n_35;
  wire MEM_n_36;
  wire MEM_n_4;
  wire MEM_n_5;
  wire MEM_n_6;
  wire MEM_n_7;
  wire MEM_n_8;
  wire MEM_n_9;
  wire [0:0]Q;
  wire a0;
  wire a1;
  wire [0:0]a1_0;
  wire b0;
  wire b1;
  wire c0;
  wire c1;
  wire [0:0]\counter_reg[4] ;
  wire d0;
  wire d1;
  wire e0;
  wire e1;
  wire f0;
  wire f1;
  wire g0;
  wire g1;
  wire [7:0]leds_AXI;
  wire [1:1]pointer;
  wire [29:0]reg_A;
  wire reset_db;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [0:0]signal_out_reg;

  lab2_simple_arm_adder_ip_0_0_fpadd_pipeline ADDER
       (.AR(reset_db),
        .\A_reg[25]_0 (MEM_n_14),
        .\B_reg[17]_0 (MEM_n_36),
        .\B_reg[21]_0 (MEM_n_13),
        .\B_reg[22]_0 (MEM_n_35),
        .\B_reg[24]_0 (MEM_n_34),
        .\B_reg[4]_0 (MEM_n_33),
        .D({MEM_n_0,MEM_n_1,MEM_n_2,MEM_n_3,MEM_n_4,MEM_n_5,MEM_n_6,MEM_n_7,MEM_n_8,MEM_n_9,MEM_n_10,MEM_n_11}),
        .Q(\counter_reg[4] ),
        .a0(a0),
        .a1(a1),
        .a1_0(a1_0),
        .b0(b0),
        .b1(b1),
        .c0(c0),
        .c1(c1),
        .d0(d0),
        .d1(d1),
        .e0(e0),
        .e1(e1),
        .f0(f0),
        .f1(f1),
        .g0(g0),
        .g1(g1),
        .leds_AXI(leds_AXI),
        .pointer(pointer),
        .reg_A({reg_A[29:28],reg_A[26],reg_A[24:20],reg_A[18:12],reg_A[5:4],reg_A[0]}),
        .s00_axi_aclk(s00_axi_aclk));
  lab2_simple_arm_adder_ip_0_0_Debounce_L2P DB_noisy_signal
       (.current_state(\L2P/current_state ),
        .s00_axi_aclk(s00_axi_aclk),
        .signal_out_reg(signal_out_reg));
  lab2_simple_arm_adder_ip_0_0_Debounce_L2P_0 DB_reset
       (.AR(reset_db),
        .Q(Q),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn));
  lab2_simple_arm_adder_ip_0_0_Data_mem MEM
       (.AR(reset_db),
        .D({MEM_n_0,MEM_n_1,MEM_n_2,MEM_n_3,MEM_n_4,MEM_n_5,MEM_n_6,MEM_n_7,MEM_n_8,MEM_n_9,MEM_n_10,MEM_n_11}),
        .current_state(\L2P/current_state ),
        .\pointer_reg[1]_0 (pointer),
        .\pointer_reg[1]_1 (MEM_n_13),
        .\pointer_reg[1]_2 (MEM_n_34),
        .\pointer_reg[2]_0 (MEM_n_14),
        .\pointer_reg[2]_1 (MEM_n_33),
        .\pointer_reg[2]_2 (MEM_n_35),
        .\pointer_reg[2]_3 (MEM_n_36),
        .reg_A({reg_A[29:28],reg_A[26],reg_A[24:20],reg_A[18:12],reg_A[5:4],reg_A[0]}),
        .s00_axi_aclk(s00_axi_aclk));
  lab2_simple_arm_adder_ip_0_0_SevenSegDisplay SegDISPLAY_0
       (.AR(reset_db),
        .\counter_reg[4]_0 (\counter_reg[4] ),
        .s00_axi_aclk(s00_axi_aclk));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
