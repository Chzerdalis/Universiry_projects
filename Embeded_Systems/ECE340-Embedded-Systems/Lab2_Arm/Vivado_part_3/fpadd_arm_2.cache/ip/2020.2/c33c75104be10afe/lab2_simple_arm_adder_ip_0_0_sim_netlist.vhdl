-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Apr  8 16:59:38 2025
-- Host        : nbellas-VirtualBox running 64-bit Ubuntu 18.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ lab2_simple_arm_adder_ip_0_0_sim_netlist.vhdl
-- Design      : lab2_simple_arm_adder_ip_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Data_mem is
  port (
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \pointer_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pointer_reg[1]_1\ : out STD_LOGIC;
    \pointer_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    reg_A : out STD_LOGIC_VECTOR ( 17 downto 0 );
    \pointer_reg[2]_1\ : out STD_LOGIC;
    \pointer_reg[1]_2\ : out STD_LOGIC;
    \pointer_reg[2]_2\ : out STD_LOGIC;
    \pointer_reg[2]_3\ : out STD_LOGIC;
    current_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Data_mem;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Data_mem is
  signal pointer : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \pointer[0]_i_1_n_0\ : STD_LOGIC;
  signal \pointer[1]_i_1_n_0\ : STD_LOGIC;
  signal \pointer[2]_i_1_n_0\ : STD_LOGIC;
  signal \^pointer_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \A[0]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \A[12]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \A[13]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \A[14]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \A[15]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \A[16]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \A[17]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \A[18]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \A[20]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \A[21]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \A[22]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \A[23]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \A[24]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \A[25]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \A[26]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \A[28]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \A[29]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \A[4]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \A[5]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \B[11]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \B[12]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \B[13]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \B[14]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \B[15]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \B[16]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \B[17]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \B[21]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \B[22]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \B[26]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \B[28]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \B[29]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \B[2]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \B[30]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \B[31]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \B[4]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \pointer[0]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \pointer[1]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \pointer[2]_i_1\ : label is "soft_lutpair53";
begin
  \pointer_reg[1]_0\(0) <= \^pointer_reg[1]_0\(0);
\A[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(0)
    );
\A[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(3)
    );
\A[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"68"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(4)
    );
\A[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(5)
    );
\A[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => pointer(0),
      I1 => pointer(2),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(6)
    );
\A[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(7)
    );
\A[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A4"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => reg_A(8)
    );
\A[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7C"
    )
        port map (
      I0 => pointer(0),
      I1 => pointer(2),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(9)
    );
\A[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => reg_A(10)
    );
\A[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(11)
    );
\A[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      O => reg_A(12)
    );
\A[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"37"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => reg_A(13)
    );
\A[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6D"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(14)
    );
\A[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      O => \pointer_reg[2]_0\(0)
    );
\A[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CB"
    )
        port map (
      I0 => pointer(0),
      I1 => pointer(2),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(15)
    );
\A[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0B"
    )
        port map (
      I0 => pointer(0),
      I1 => pointer(2),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(16)
    );
\A[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(17)
    );
\A[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C2"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(1)
    );
\A[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => reg_A(2)
    );
\B[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => D(1)
    );
\B[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => pointer(0),
      I1 => pointer(2),
      I2 => \^pointer_reg[1]_0\(0),
      O => D(2)
    );
\B[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => D(3)
    );
\B[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^pointer_reg[1]_0\(0),
      I1 => pointer(0),
      O => D(4)
    );
\B[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => D(5)
    );
\B[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2C"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => D(6)
    );
\B[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      O => \pointer_reg[2]_3\
    );
\B[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^pointer_reg[1]_0\(0),
      I1 => pointer(2),
      O => \pointer_reg[1]_1\
    );
\B[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => \pointer_reg[2]_2\
    );
\B[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^pointer_reg[1]_0\(0),
      I1 => pointer(0),
      O => \pointer_reg[1]_2\
    );
\B[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BC"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => D(7)
    );
\B[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pointer(0),
      I1 => \^pointer_reg[1]_0\(0),
      O => D(8)
    );
\B[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \^pointer_reg[1]_0\(0),
      I1 => pointer(2),
      I2 => pointer(0),
      O => D(9)
    );
\B[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => D(0)
    );
\B[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^pointer_reg[1]_0\(0),
      I1 => pointer(0),
      O => D(10)
    );
\B[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => pointer(2),
      I1 => \^pointer_reg[1]_0\(0),
      I2 => pointer(0),
      O => D(11)
    );
\B[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4A"
    )
        port map (
      I0 => pointer(2),
      I1 => pointer(0),
      I2 => \^pointer_reg[1]_0\(0),
      O => \pointer_reg[2]_1\
    );
\pointer[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => pointer(0),
      O => \pointer[0]_i_1_n_0\
    );
\pointer[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F708"
    )
        port map (
      I0 => pointer(0),
      I1 => current_state(0),
      I2 => current_state(1),
      I3 => \^pointer_reg[1]_0\(0),
      O => \pointer[1]_i_1_n_0\
    );
\pointer[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0080"
    )
        port map (
      I0 => \^pointer_reg[1]_0\(0),
      I1 => pointer(0),
      I2 => current_state(0),
      I3 => current_state(1),
      I4 => pointer(2),
      O => \pointer[2]_i_1_n_0\
    );
\pointer_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \pointer[0]_i_1_n_0\,
      Q => pointer(0)
    );
\pointer_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \pointer[1]_i_1_n_0\,
      Q => \^pointer_reg[1]_0\(0)
    );
\pointer_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \pointer[2]_i_1_n_0\,
      Q => pointer(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer is
  port (
    debounced_sig : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer is
  signal clear : STD_LOGIC;
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter[0]_i_7_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 23 downto 7 );
  signal \counter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal signal_out_i_1_n_0 : STD_LOGIC;
  signal \NLW_counter_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
begin
\counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => Q(0),
      O => clear
    );
\counter[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F7FFFFFFFF"
    )
        port map (
      I0 => counter_reg(20),
      I1 => counter_reg(19),
      I2 => \counter[0]_i_4_n_0\,
      I3 => counter_reg(21),
      I4 => counter_reg(22),
      I5 => counter_reg(23),
      O => \counter[0]_i_2_n_0\
    );
\counter[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"222A2222"
    )
        port map (
      I0 => \counter[0]_i_6_n_0\,
      I1 => counter_reg(15),
      I2 => counter_reg(14),
      I3 => counter_reg(13),
      I4 => \counter[0]_i_7_n_0\,
      O => \counter[0]_i_4_n_0\
    );
\counter[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_5_n_0\
    );
\counter[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => counter_reg(18),
      I1 => counter_reg(17),
      I2 => counter_reg(16),
      O => \counter[0]_i_6_n_0\
    );
\counter[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15151555FFFFFFFF"
    )
        port map (
      I0 => counter_reg(11),
      I1 => counter_reg(10),
      I2 => counter_reg(9),
      I3 => counter_reg(7),
      I4 => counter_reg(8),
      I5 => counter_reg(12),
      O => \counter[0]_i_7_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_7\,
      Q => \counter_reg_n_0_[0]\,
      R => clear
    );
\counter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_3_n_0\,
      CO(2) => \counter_reg[0]_i_3_n_1\,
      CO(1) => \counter_reg[0]_i_3_n_2\,
      CO(0) => \counter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_3_n_4\,
      O(2) => \counter_reg[0]_i_3_n_5\,
      O(1) => \counter_reg[0]_i_3_n_6\,
      O(0) => \counter_reg[0]_i_3_n_7\,
      S(3) => \counter_reg_n_0_[3]\,
      S(2) => \counter_reg_n_0_[2]\,
      S(1) => \counter_reg_n_0_[1]\,
      S(0) => \counter[0]_i_5_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => clear
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => clear
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => clear
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => clear
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => clear
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => clear
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => clear
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => clear
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => clear
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => clear
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_6\,
      Q => \counter_reg_n_0_[1]\,
      R => clear
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => clear
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[20]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => clear
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => clear
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => clear
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_5\,
      Q => \counter_reg_n_0_[2]\,
      R => clear
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_4\,
      Q => \counter_reg_n_0_[3]\,
      R => clear
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_7\,
      Q => \counter_reg_n_0_[4]\,
      R => clear
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_3_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => counter_reg(7),
      S(2) => \counter_reg_n_0_[6]\,
      S(1) => \counter_reg_n_0_[5]\,
      S(0) => \counter_reg_n_0_[4]\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_6\,
      Q => \counter_reg_n_0_[5]\,
      R => clear
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_5\,
      Q => \counter_reg_n_0_[6]\,
      R => clear
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => clear
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => clear
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => clear
    );
signal_out_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => Q(0),
      I2 => \counter[0]_i_2_n_0\,
      O => signal_out_i_1_n_0
    );
signal_out_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => signal_out_i_1_n_0,
      Q => debounced_sig,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer_1 is
  port (
    debounced_sig : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    signal_out_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer_1 : entity is "Debouncer";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer_1 is
  signal \counter[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \counter[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \counter[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \counter[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \counter[0]_i_7__0_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 23 downto 7 );
  signal \counter_reg[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_3__0_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \signal_out_i_1__0_n_0\ : STD_LOGIC;
  signal \NLW_counter_reg[20]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_3__0\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1__0\ : label is 11;
begin
\counter[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => signal_out_reg_0(0),
      O => \counter[0]_i_1__0_n_0\
    );
\counter[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F7FFFFFFFF"
    )
        port map (
      I0 => counter_reg(20),
      I1 => counter_reg(19),
      I2 => \counter[0]_i_4__0_n_0\,
      I3 => counter_reg(21),
      I4 => counter_reg(22),
      I5 => counter_reg(23),
      O => \counter[0]_i_2__0_n_0\
    );
\counter[0]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"222A2222"
    )
        port map (
      I0 => \counter[0]_i_6__0_n_0\,
      I1 => counter_reg(15),
      I2 => counter_reg(14),
      I3 => counter_reg(13),
      I4 => \counter[0]_i_7__0_n_0\,
      O => \counter[0]_i_4__0_n_0\
    );
\counter[0]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_5__0_n_0\
    );
\counter[0]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => counter_reg(18),
      I1 => counter_reg(17),
      I2 => counter_reg(16),
      O => \counter[0]_i_6__0_n_0\
    );
\counter[0]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15151555FFFFFFFF"
    )
        port map (
      I0 => counter_reg(11),
      I1 => counter_reg(10),
      I2 => counter_reg(9),
      I3 => counter_reg(7),
      I4 => counter_reg(8),
      I5 => counter_reg(12),
      O => \counter[0]_i_7__0_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[0]_i_3__0_n_7\,
      Q => \counter_reg_n_0_[0]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_3__0_n_0\,
      CO(2) => \counter_reg[0]_i_3__0_n_1\,
      CO(1) => \counter_reg[0]_i_3__0_n_2\,
      CO(0) => \counter_reg[0]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_3__0_n_4\,
      O(2) => \counter_reg[0]_i_3__0_n_5\,
      O(1) => \counter_reg[0]_i_3__0_n_6\,
      O(0) => \counter_reg[0]_i_3__0_n_7\,
      S(3) => \counter_reg_n_0_[3]\,
      S(2) => \counter_reg_n_0_[2]\,
      S(1) => \counter_reg_n_0_[1]\,
      S(0) => \counter[0]_i_5__0_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[8]_i_1__0_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[8]_i_1__0_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[12]_i_1__0_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1__0_n_0\,
      CO(3) => \counter_reg[12]_i_1__0_n_0\,
      CO(2) => \counter_reg[12]_i_1__0_n_1\,
      CO(1) => \counter_reg[12]_i_1__0_n_2\,
      CO(0) => \counter_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1__0_n_4\,
      O(2) => \counter_reg[12]_i_1__0_n_5\,
      O(1) => \counter_reg[12]_i_1__0_n_6\,
      O(0) => \counter_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[12]_i_1__0_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[12]_i_1__0_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[12]_i_1__0_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[16]_i_1__0_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1__0_n_0\,
      CO(3) => \counter_reg[16]_i_1__0_n_0\,
      CO(2) => \counter_reg[16]_i_1__0_n_1\,
      CO(1) => \counter_reg[16]_i_1__0_n_2\,
      CO(0) => \counter_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1__0_n_4\,
      O(2) => \counter_reg[16]_i_1__0_n_5\,
      O(1) => \counter_reg[16]_i_1__0_n_6\,
      O(0) => \counter_reg[16]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[16]_i_1__0_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[16]_i_1__0_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[16]_i_1__0_n_4\,
      Q => counter_reg(19),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[0]_i_3__0_n_6\,
      Q => \counter_reg_n_0_[1]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[20]_i_1__0_n_7\,
      Q => counter_reg(20),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[20]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1__0_n_0\,
      CO(3) => \NLW_counter_reg[20]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[20]_i_1__0_n_1\,
      CO(1) => \counter_reg[20]_i_1__0_n_2\,
      CO(0) => \counter_reg[20]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1__0_n_4\,
      O(2) => \counter_reg[20]_i_1__0_n_5\,
      O(1) => \counter_reg[20]_i_1__0_n_6\,
      O(0) => \counter_reg[20]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[20]_i_1__0_n_6\,
      Q => counter_reg(21),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[20]_i_1__0_n_5\,
      Q => counter_reg(22),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[20]_i_1__0_n_4\,
      Q => counter_reg(23),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[0]_i_3__0_n_5\,
      Q => \counter_reg_n_0_[2]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[0]_i_3__0_n_4\,
      Q => \counter_reg_n_0_[3]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[4]_i_1__0_n_7\,
      Q => \counter_reg_n_0_[4]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_3__0_n_0\,
      CO(3) => \counter_reg[4]_i_1__0_n_0\,
      CO(2) => \counter_reg[4]_i_1__0_n_1\,
      CO(1) => \counter_reg[4]_i_1__0_n_2\,
      CO(0) => \counter_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1__0_n_4\,
      O(2) => \counter_reg[4]_i_1__0_n_5\,
      O(1) => \counter_reg[4]_i_1__0_n_6\,
      O(0) => \counter_reg[4]_i_1__0_n_7\,
      S(3) => counter_reg(7),
      S(2) => \counter_reg_n_0_[6]\,
      S(1) => \counter_reg_n_0_[5]\,
      S(0) => \counter_reg_n_0_[4]\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[4]_i_1__0_n_6\,
      Q => \counter_reg_n_0_[5]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[4]_i_1__0_n_5\,
      Q => \counter_reg_n_0_[6]\,
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[4]_i_1__0_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[8]_i_1__0_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1__0_n_0\,
      CO(3) => \counter_reg[8]_i_1__0_n_0\,
      CO(2) => \counter_reg[8]_i_1__0_n_1\,
      CO(1) => \counter_reg[8]_i_1__0_n_2\,
      CO(0) => \counter_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1__0_n_4\,
      O(2) => \counter_reg[8]_i_1__0_n_5\,
      O(1) => \counter_reg[8]_i_1__0_n_6\,
      O(0) => \counter_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \counter[0]_i_2__0_n_0\,
      D => \counter_reg[8]_i_1__0_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1__0_n_0\
    );
\signal_out_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => signal_out_reg_0(0),
      I1 => \counter[0]_i_2__0_n_0\,
      O => \signal_out_i_1__0_n_0\
    );
signal_out_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \signal_out_i_1__0_n_0\,
      Q => debounced_sig,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    debounced_sig : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P is
  signal \FSM_sequential_current_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[1]_i_1_n_0\ : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[0]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[1]_i_1\ : label is "soft_lutpair52";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01";
begin
\FSM_sequential_current_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => debounced_sig,
      O => \FSM_sequential_current_state[0]_i_1_n_0\
    );
\FSM_sequential_current_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => debounced_sig,
      O => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_current_state[0]_i_1_n_0\,
      Q => current_state(0),
      R => '0'
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_current_state[1]_i_1_n_0\,
      Q => current_state(1),
      R => '0'
    );
\out[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      O => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P_2 is
  port (
    current_state : out STD_LOGIC_VECTOR ( 1 downto 0 );
    debounced_sig : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P_2 : entity is "L2P";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P_2 is
  signal \FSM_sequential_current_state[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \^current_state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[0]_i_1__0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[1]_i_1__0\ : label is "soft_lutpair51";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "WAIT_SIG_STOP:10,WAIT_FOR_SIGNAL:00,GEN_SINGLE_CYCLE:01";
begin
  current_state(1 downto 0) <= \^current_state\(1 downto 0);
\FSM_sequential_current_state[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^current_state\(1),
      I1 => \^current_state\(0),
      I2 => debounced_sig,
      O => \FSM_sequential_current_state[0]_i_1__0_n_0\
    );
\FSM_sequential_current_state[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^current_state\(1),
      I1 => \^current_state\(0),
      I2 => debounced_sig,
      O => \FSM_sequential_current_state[1]_i_1__0_n_0\
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_current_state[0]_i_1__0_n_0\,
      Q => \^current_state\(0),
      R => '0'
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_current_state[1]_i_1__0_n_0\,
      Q => \^current_state\(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SevenSegDisplay is
  port (
    \counter_reg[4]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SevenSegDisplay;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SevenSegDisplay is
  signal \^counter_reg[4]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair72";
begin
  \counter_reg[4]_0\(0) <= \^counter_reg[4]_0\(0);
\counter[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      I1 => \counter_reg_n_0_[1]\,
      O => p_0_in(1)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      I1 => \counter_reg_n_0_[1]\,
      I2 => \counter_reg_n_0_[2]\,
      O => p_0_in(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \counter_reg_n_0_[1]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter_reg_n_0_[2]\,
      I3 => \counter_reg_n_0_[3]\,
      O => p_0_in(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \counter_reg_n_0_[2]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter_reg_n_0_[1]\,
      I3 => \counter_reg_n_0_[3]\,
      I4 => \^counter_reg[4]_0\(0),
      O => p_0_in(4)
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => p_0_in(0),
      Q => \counter_reg_n_0_[0]\
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => p_0_in(1),
      Q => \counter_reg_n_0_[1]\
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => p_0_in(2),
      Q => \counter_reg_n_0_[2]\
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => p_0_in(3),
      Q => \counter_reg_n_0_[3]\
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => p_0_in(4),
      Q => \^counter_reg[4]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_pipeline is
  port (
    c0 : out STD_LOGIC;
    g0 : out STD_LOGIC;
    f0 : out STD_LOGIC;
    e0 : out STD_LOGIC;
    d0 : out STD_LOGIC;
    b0 : out STD_LOGIC;
    a0 : out STD_LOGIC;
    c1 : out STD_LOGIC;
    g1 : out STD_LOGIC;
    f1 : out STD_LOGIC;
    e1 : out STD_LOGIC;
    d1 : out STD_LOGIC;
    b1 : out STD_LOGIC;
    a1 : out STD_LOGIC;
    leds_AXI : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \B_reg[24]_0\ : in STD_LOGIC;
    reg_A : in STD_LOGIC_VECTOR ( 17 downto 0 );
    \B_reg[4]_0\ : in STD_LOGIC;
    \B_reg[17]_0\ : in STD_LOGIC;
    \B_reg[22]_0\ : in STD_LOGIC;
    \B_reg[21]_0\ : in STD_LOGIC;
    a1_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 11 downto 0 );
    pointer : in STD_LOGIC_VECTOR ( 0 to 0 );
    \A_reg[25]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_pipeline;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_pipeline is
  signal A : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal B : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal \SegDISPLAY_0/out__3\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \SegDISPLAY_1/out__3\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \_inferred__2/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_4\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_5\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_6\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_7\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_4\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_5\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_6\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_7\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_4\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_5\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_6\ : STD_LOGIC;
  signal \_inferred__2/i__carry__3_n_7\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_4\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_5\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_6\ : STD_LOGIC;
  signal \_inferred__2/i__carry__4_n_7\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_7\ : STD_LOGIC;
  signal \bigger1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_n_0\ : STD_LOGIC;
  signal \bigger1_carry__0_n_1\ : STD_LOGIC;
  signal \bigger1_carry__0_n_2\ : STD_LOGIC;
  signal \bigger1_carry__0_n_3\ : STD_LOGIC;
  signal \bigger1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_n_0\ : STD_LOGIC;
  signal \bigger1_carry__1_n_1\ : STD_LOGIC;
  signal \bigger1_carry__1_n_2\ : STD_LOGIC;
  signal \bigger1_carry__1_n_3\ : STD_LOGIC;
  signal \bigger1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \bigger1_carry__2_n_1\ : STD_LOGIC;
  signal \bigger1_carry__2_n_2\ : STD_LOGIC;
  signal \bigger1_carry__2_n_3\ : STD_LOGIC;
  signal bigger1_carry_i_1_n_0 : STD_LOGIC;
  signal bigger1_carry_i_2_n_0 : STD_LOGIC;
  signal bigger1_carry_i_3_n_0 : STD_LOGIC;
  signal bigger1_carry_i_4_n_0 : STD_LOGIC;
  signal bigger1_carry_i_5_n_0 : STD_LOGIC;
  signal bigger1_carry_i_6_n_0 : STD_LOGIC;
  signal bigger1_carry_i_7_n_0 : STD_LOGIC;
  signal bigger1_carry_i_8_n_0 : STD_LOGIC;
  signal bigger1_carry_n_0 : STD_LOGIC;
  signal bigger1_carry_n_1 : STD_LOGIC;
  signal bigger1_carry_n_2 : STD_LOGIC;
  signal bigger1_carry_n_3 : STD_LOGIC;
  signal bigger_sign : STD_LOGIC;
  signal bigger_sign_2 : STD_LOGIC;
  signal carry : STD_LOGIC;
  signal carry_2 : STD_LOGIC;
  signal exponent_bigger : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal final_exponent10_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \final_exponent2_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \final_exponent2_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \final_exponent2_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \final_exponent2_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal final_exponent_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal fp_out : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \i__carry__0_i_10_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_11_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_15_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_16_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_17_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_18_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_19_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_20_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_9_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_10_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_11_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_12_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_16_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_17_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_18_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_19_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_20_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_9_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_10_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_11_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_12_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_17_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_18_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_19_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_20_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_9_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_10_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_11_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_14_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_9_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_10_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_9_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_10__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_10_n_0\ : STD_LOGIC;
  signal \i__carry_i_11__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_11_n_0\ : STD_LOGIC;
  signal \i__carry_i_12__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_12_n_0\ : STD_LOGIC;
  signal \i__carry_i_13__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_13_n_0\ : STD_LOGIC;
  signal \i__carry_i_14__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_14_n_0\ : STD_LOGIC;
  signal \i__carry_i_15__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_16__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_17__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_17_n_0\ : STD_LOGIC;
  signal \i__carry_i_18__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_18_n_0\ : STD_LOGIC;
  signal \i__carry_i_19__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_19_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_20__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_20_n_0\ : STD_LOGIC;
  signal \i__carry_i_21__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_21_n_0\ : STD_LOGIC;
  signal \i__carry_i_22__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_22_n_0\ : STD_LOGIC;
  signal \i__carry_i_23__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_23_n_0\ : STD_LOGIC;
  signal \i__carry_i_24__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_24_n_0\ : STD_LOGIC;
  signal \i__carry_i_25__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_25_n_0\ : STD_LOGIC;
  signal \i__carry_i_26__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_26_n_0\ : STD_LOGIC;
  signal \i__carry_i_27__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_27_n_0\ : STD_LOGIC;
  signal \i__carry_i_28__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_28_n_0\ : STD_LOGIC;
  signal \i__carry_i_29_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_32_n_0\ : STD_LOGIC;
  signal \i__carry_i_33_n_0\ : STD_LOGIC;
  signal \i__carry_i_34_n_0\ : STD_LOGIC;
  signal \i__carry_i_35_n_0\ : STD_LOGIC;
  signal \i__carry_i_37_n_0\ : STD_LOGIC;
  signal \i__carry_i_38_n_0\ : STD_LOGIC;
  signal \i__carry_i_39_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_40_n_0\ : STD_LOGIC;
  signal \i__carry_i_41_n_0\ : STD_LOGIC;
  signal \i__carry_i_42_n_0\ : STD_LOGIC;
  signal \i__carry_i_43_n_0\ : STD_LOGIC;
  signal \i__carry_i_44_n_0\ : STD_LOGIC;
  signal \i__carry_i_45_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_5__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_6__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_7__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_8__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal \i__carry_i_9__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_9_n_0\ : STD_LOGIC;
  signal mantissa_bigger : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal mantissa_smaller : STD_LOGIC_VECTOR ( 22 downto 16 );
  signal \mantissa_sum_2_reg_n_0_[0]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[10]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[11]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[12]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[13]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[14]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[15]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[16]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[17]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[18]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[19]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[1]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[20]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[21]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[22]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[23]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[2]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[3]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[4]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[5]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[6]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[7]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[8]\ : STD_LOGIC;
  signal \mantissa_sum_2_reg_n_0_[9]\ : STD_LOGIC;
  signal \out[16]_i_2_n_0\ : STD_LOGIC;
  signal \out[16]_i_3_n_0\ : STD_LOGIC;
  signal \out[17]_i_2_n_0\ : STD_LOGIC;
  signal \out[17]_i_3_n_0\ : STD_LOGIC;
  signal \out[18]_i_2_n_0\ : STD_LOGIC;
  signal \out[18]_i_3_n_0\ : STD_LOGIC;
  signal \out[19]_i_2_n_0\ : STD_LOGIC;
  signal \out[19]_i_3_n_0\ : STD_LOGIC;
  signal \out[1]_i_2_n_0\ : STD_LOGIC;
  signal \out[20]_i_2_n_0\ : STD_LOGIC;
  signal \out[20]_i_3_n_0\ : STD_LOGIC;
  signal \out[21]_i_2_n_0\ : STD_LOGIC;
  signal \out[21]_i_3_n_0\ : STD_LOGIC;
  signal \out[22]_i_10_n_0\ : STD_LOGIC;
  signal \out[22]_i_11_n_0\ : STD_LOGIC;
  signal \out[22]_i_12_n_0\ : STD_LOGIC;
  signal \out[22]_i_2_n_0\ : STD_LOGIC;
  signal \out[22]_i_3_n_0\ : STD_LOGIC;
  signal \out[22]_i_4_n_0\ : STD_LOGIC;
  signal \out[22]_i_5_n_0\ : STD_LOGIC;
  signal \out[22]_i_6_n_0\ : STD_LOGIC;
  signal \out[22]_i_7_n_0\ : STD_LOGIC;
  signal \out[22]_i_8_n_0\ : STD_LOGIC;
  signal \out[22]_i_9_n_0\ : STD_LOGIC;
  signal \out[23]_i_2_n_0\ : STD_LOGIC;
  signal \out[23]_i_3_n_0\ : STD_LOGIC;
  signal \out[26]_i_3_n_0\ : STD_LOGIC;
  signal \out[26]_i_4_n_0\ : STD_LOGIC;
  signal \out[26]_i_5_n_0\ : STD_LOGIC;
  signal \out[26]_i_6_n_0\ : STD_LOGIC;
  signal \out[26]_i_7_n_0\ : STD_LOGIC;
  signal \out[27]_i_2_n_0\ : STD_LOGIC;
  signal \out[27]_i_3_n_0\ : STD_LOGIC;
  signal \out[28]_i_2_n_0\ : STD_LOGIC;
  signal \out[2]_i_2_n_0\ : STD_LOGIC;
  signal \out[30]_i_2_n_0\ : STD_LOGIC;
  signal \out[30]_i_4_n_0\ : STD_LOGIC;
  signal \out[30]_i_5_n_0\ : STD_LOGIC;
  signal \out[30]_i_6_n_0\ : STD_LOGIC;
  signal \out[30]_i_7_n_0\ : STD_LOGIC;
  signal \out[30]_i_8_n_0\ : STD_LOGIC;
  signal \out[30]_i_9_n_0\ : STD_LOGIC;
  signal \out[3]_i_2_n_0\ : STD_LOGIC;
  signal \out[4]_i_2_n_0\ : STD_LOGIC;
  signal \out[5]_i_2_n_0\ : STD_LOGIC;
  signal \out[6]_i_2_n_0\ : STD_LOGIC;
  signal \out[7]_i_10_n_0\ : STD_LOGIC;
  signal \out[7]_i_11_n_0\ : STD_LOGIC;
  signal \out[7]_i_12_n_0\ : STD_LOGIC;
  signal \out[7]_i_13_n_0\ : STD_LOGIC;
  signal \out[7]_i_14_n_0\ : STD_LOGIC;
  signal \out[7]_i_15_n_0\ : STD_LOGIC;
  signal \out[7]_i_16_n_0\ : STD_LOGIC;
  signal \out[7]_i_17_n_0\ : STD_LOGIC;
  signal \out[7]_i_3_n_0\ : STD_LOGIC;
  signal \out[7]_i_4_n_0\ : STD_LOGIC;
  signal \out[7]_i_5_n_0\ : STD_LOGIC;
  signal \out[7]_i_6_n_0\ : STD_LOGIC;
  signal \out[7]_i_7_n_0\ : STD_LOGIC;
  signal \out[7]_i_8_n_0\ : STD_LOGIC;
  signal \out[7]_i_9_n_0\ : STD_LOGIC;
  signal \out_reg[26]_i_2_n_0\ : STD_LOGIC;
  signal \out_reg[26]_i_2_n_1\ : STD_LOGIC;
  signal \out_reg[26]_i_2_n_2\ : STD_LOGIC;
  signal \out_reg[26]_i_2_n_3\ : STD_LOGIC;
  signal \out_reg[30]_i_3_n_1\ : STD_LOGIC;
  signal \out_reg[30]_i_3_n_2\ : STD_LOGIC;
  signal \out_reg[30]_i_3_n_3\ : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC;
  signal result : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \shifted_mantissa3_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \NLW__inferred__2/i__carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__2/i__carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_bigger1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bigger1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bigger1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bigger1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_final_exponent2_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_out_reg[30]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_shifted_mantissa3_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry__0\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry__1\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry__1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry__2\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry__2\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry__3\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry__3\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry__4\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry__4\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \_inferred__2/i__carry__5\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__2/i__carry__5\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of a0_INST_0_i_1 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of a0_INST_0_i_2 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of a0_INST_0_i_3 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of a0_INST_0_i_4 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of a1_INST_0_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of a1_INST_0_i_2 : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of a1_INST_0_i_3 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of a1_INST_0_i_4 : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of b0_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of b1_INST_0 : label is "soft_lutpair6";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of bigger1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \bigger1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \bigger1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \bigger1_carry__2\ : label is 11;
  attribute SOFT_HLUTNM of bigger_sign_2_i_1 : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of c0_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of c1_INST_0 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of d0_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of d1_INST_0 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of e0_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of e1_INST_0 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of f0_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of f1_INST_0 : label is "soft_lutpair5";
  attribute COMPARATOR_THRESHOLD of \final_exponent2_inferred__0/i__carry\ : label is 11;
  attribute SOFT_HLUTNM of \final_exponent_reg[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \final_exponent_reg[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \final_exponent_reg[2]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \final_exponent_reg[3]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \final_exponent_reg[4]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \final_exponent_reg[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \final_exponent_reg[7]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of g0_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g1_INST_0 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \i__carry__0_i_11\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \i__carry__0_i_12\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \i__carry__0_i_13\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \i__carry__0_i_14\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \i__carry__0_i_20\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \i__carry__0_i_21\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \i__carry__0_i_9\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \i__carry__1_i_10\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \i__carry__1_i_11\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \i__carry__1_i_13\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \i__carry__1_i_14\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \i__carry__1_i_15\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \i__carry__1_i_20\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \i__carry__2_i_10\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \i__carry__2_i_12\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \i__carry__2_i_13\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \i__carry__2_i_14\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \i__carry__2_i_15\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \i__carry__2_i_16\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \i__carry__2_i_17\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \i__carry__3_i_12\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \i__carry__3_i_13\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \i__carry__3_i_14\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \i__carry__3_i_15\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \i__carry__4_i_10\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \i__carry__4_i_7\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \i__carry_i_10__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \i__carry_i_11\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \i__carry_i_13__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \i__carry_i_14\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \i__carry_i_14__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \i__carry_i_15\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \i__carry_i_16\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \i__carry_i_17__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \i__carry_i_18__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \i__carry_i_19__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \i__carry_i_20__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \i__carry_i_23\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \i__carry_i_24\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \i__carry_i_25\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \i__carry_i_25__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \i__carry_i_26\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \i__carry_i_27__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \i__carry_i_31\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \i__carry_i_32\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \i__carry_i_35\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \i__carry_i_36\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \i__carry_i_37\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \i__carry_i_38\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \i__carry_i_39\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \i__carry_i_40\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \i__carry_i_41\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \i__carry_i_43\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \i__carry_i_9__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \out[16]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \out[17]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \out[19]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \out[20]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \out[21]_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \out[22]_i_12\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \out[22]_i_4\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \out[22]_i_5\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \out[22]_i_8\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \out[22]_i_9\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \out[27]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out[28]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out[30]_i_9\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \out[7]_i_12\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \out[7]_i_13\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \out[7]_i_16\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \out[7]_i_17\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \out[7]_i_6\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \out[7]_i_7\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \out[7]_i_9\ : label is "soft_lutpair22";
  attribute ADDER_THRESHOLD of \out_reg[26]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \out_reg[30]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \shifted_mantissa3_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \shifted_mantissa3_inferred__0/i__carry__0\ : label is 35;
begin
\A_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(0),
      Q => A(0)
    );
\A_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(3),
      Q => A(12)
    );
\A_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(4),
      Q => A(13)
    );
\A_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(5),
      Q => A(14)
    );
\A_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(6),
      Q => A(15)
    );
\A_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(7),
      Q => A(16)
    );
\A_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(8),
      Q => A(17)
    );
\A_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(9),
      Q => A(18)
    );
\A_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(10),
      Q => A(20)
    );
\A_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(11),
      Q => A(21)
    );
\A_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(12),
      Q => A(22)
    );
\A_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(13),
      Q => A(23)
    );
\A_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(14),
      Q => A(24)
    );
\A_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \A_reg[25]_0\(0),
      Q => A(25)
    );
\A_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(15),
      Q => A(26)
    );
\A_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(16),
      Q => A(28)
    );
\A_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(17),
      Q => A(29)
    );
\A_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => pointer(0),
      Q => A(30)
    );
\A_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(1),
      Q => A(4)
    );
\A_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => reg_A(2),
      Q => A(5)
    );
\B_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(1),
      Q => B(11)
    );
\B_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(2),
      Q => B(12)
    );
\B_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(3),
      Q => B(13)
    );
\B_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(4),
      Q => B(14)
    );
\B_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(5),
      Q => B(15)
    );
\B_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(6),
      Q => B(16)
    );
\B_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \B_reg[17]_0\,
      Q => B(17)
    );
\B_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \B_reg[21]_0\,
      Q => B(21)
    );
\B_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \B_reg[22]_0\,
      Q => B(22)
    );
\B_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \B_reg[24]_0\,
      Q => B(24)
    );
\B_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(7),
      Q => B(26)
    );
\B_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(8),
      Q => B(28)
    );
\B_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(9),
      Q => B(29)
    );
\B_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(0),
      Q => B(2)
    );
\B_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(10),
      Q => B(30)
    );
\B_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => D(11),
      Q => B(31)
    );
\B_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \B_reg[4]_0\,
      Q => B(4)
    );
\_inferred__2/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__2/i__carry_n_0\,
      CO(2) => \_inferred__2/i__carry_n_1\,
      CO(1) => \_inferred__2/i__carry_n_2\,
      CO(0) => \_inferred__2/i__carry_n_3\,
      CYINIT => mantissa_bigger(0),
      DI(3) => B(21),
      DI(2) => \i__carry_i_2__0_n_0\,
      DI(1) => \i__carry_i_3__0_n_0\,
      DI(0) => \i__carry_i_4_n_0\,
      O(3) => \_inferred__2/i__carry_n_4\,
      O(2) => \_inferred__2/i__carry_n_5\,
      O(1) => \_inferred__2/i__carry_n_6\,
      O(0) => \_inferred__2/i__carry_n_7\,
      S(3) => \i__carry_i_5__1_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8__0_n_0\
    );
\_inferred__2/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry_n_0\,
      CO(3) => \_inferred__2/i__carry__0_n_0\,
      CO(2) => \_inferred__2/i__carry__0_n_1\,
      CO(1) => \_inferred__2/i__carry__0_n_2\,
      CO(0) => \_inferred__2/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => B(21),
      DI(2) => \i__carry__0_i_1__0_n_0\,
      DI(1) => \i__carry__0_i_2__0_n_0\,
      DI(0) => \i__carry__0_i_3__0_n_0\,
      O(3) => \_inferred__2/i__carry__0_n_4\,
      O(2) => \_inferred__2/i__carry__0_n_5\,
      O(1) => \_inferred__2/i__carry__0_n_6\,
      O(0) => \_inferred__2/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_4__0_n_0\,
      S(2) => \i__carry__0_i_5_n_0\,
      S(1) => \i__carry__0_i_6_n_0\,
      S(0) => \i__carry__0_i_7_n_0\
    );
\_inferred__2/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__0_n_0\,
      CO(3) => \_inferred__2/i__carry__1_n_0\,
      CO(2) => \_inferred__2/i__carry__1_n_1\,
      CO(1) => \_inferred__2/i__carry__1_n_2\,
      CO(0) => \_inferred__2/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__1_i_1_n_0\,
      DI(2) => \i__carry__1_i_2_n_0\,
      DI(1) => \i__carry__1_i_3_n_0\,
      DI(0) => \i__carry__1_i_4_n_0\,
      O(3) => \_inferred__2/i__carry__1_n_4\,
      O(2) => \_inferred__2/i__carry__1_n_5\,
      O(1) => \_inferred__2/i__carry__1_n_6\,
      O(0) => \_inferred__2/i__carry__1_n_7\,
      S(3) => \i__carry__1_i_5_n_0\,
      S(2) => \i__carry__1_i_6_n_0\,
      S(1) => \i__carry__1_i_7_n_0\,
      S(0) => \i__carry__1_i_8_n_0\
    );
\_inferred__2/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__1_n_0\,
      CO(3) => \_inferred__2/i__carry__2_n_0\,
      CO(2) => \_inferred__2/i__carry__2_n_1\,
      CO(1) => \_inferred__2/i__carry__2_n_2\,
      CO(0) => \_inferred__2/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__2_i_1_n_0\,
      DI(2) => \i__carry__2_i_2_n_0\,
      DI(1) => \i__carry__2_i_3_n_0\,
      DI(0) => \i__carry__2_i_4_n_0\,
      O(3) => \_inferred__2/i__carry__2_n_4\,
      O(2) => \_inferred__2/i__carry__2_n_5\,
      O(1) => \_inferred__2/i__carry__2_n_6\,
      O(0) => \_inferred__2/i__carry__2_n_7\,
      S(3) => \i__carry__2_i_5_n_0\,
      S(2) => \i__carry__2_i_6_n_0\,
      S(1) => \i__carry__2_i_7_n_0\,
      S(0) => \i__carry__2_i_8_n_0\
    );
\_inferred__2/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__2_n_0\,
      CO(3) => \_inferred__2/i__carry__3_n_0\,
      CO(2) => \_inferred__2/i__carry__3_n_1\,
      CO(1) => \_inferred__2/i__carry__3_n_2\,
      CO(0) => \_inferred__2/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__3_i_1_n_0\,
      DI(2) => A(18),
      DI(1) => \i__carry__3_i_2_n_0\,
      DI(0) => \i__carry__3_i_3_n_0\,
      O(3) => \_inferred__2/i__carry__3_n_4\,
      O(2) => \_inferred__2/i__carry__3_n_5\,
      O(1) => \_inferred__2/i__carry__3_n_6\,
      O(0) => \_inferred__2/i__carry__3_n_7\,
      S(3) => \i__carry__3_i_4_n_0\,
      S(2) => \i__carry__3_i_5_n_0\,
      S(1) => \i__carry__3_i_6_n_0\,
      S(0) => \i__carry__3_i_7_n_0\
    );
\_inferred__2/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__3_n_0\,
      CO(3) => \_inferred__2/i__carry__4_n_0\,
      CO(2) => \_inferred__2/i__carry__4_n_1\,
      CO(1) => \_inferred__2/i__carry__4_n_2\,
      CO(0) => \_inferred__2/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3) => '1',
      DI(2) => \i__carry__4_i_1_n_0\,
      DI(1) => \i__carry__4_i_2_n_0\,
      DI(0) => A(20),
      O(3) => \_inferred__2/i__carry__4_n_4\,
      O(2) => \_inferred__2/i__carry__4_n_5\,
      O(1) => \_inferred__2/i__carry__4_n_6\,
      O(0) => \_inferred__2/i__carry__4_n_7\,
      S(3) => \i__carry__4_i_3_n_0\,
      S(2) => \i__carry__4_i_4_n_0\,
      S(1) => \i__carry__4_i_5_n_0\,
      S(0) => \i__carry__4_i_6_n_0\
    );
\_inferred__2/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__4_n_0\,
      CO(3 downto 0) => \NLW__inferred__2/i__carry__5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__2/i__carry__5_O_UNCONNECTED\(3 downto 1),
      O(0) => carry,
      S(3 downto 1) => B"000",
      S(0) => \i__carry__5_i_1_n_0\
    );
a0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"82A88A8A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_0/out__3\(1),
      I2 => \SegDISPLAY_0/out__3\(2),
      I3 => \SegDISPLAY_0/out__3\(3),
      I4 => \SegDISPLAY_0/out__3\(0),
      O => a0
    );
a0_INST_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(29),
      I1 => Q(0),
      I2 => fp_out(25),
      O => \SegDISPLAY_0/out__3\(1)
    );
a0_INST_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(30),
      I1 => Q(0),
      I2 => fp_out(26),
      O => \SegDISPLAY_0/out__3\(2)
    );
a0_INST_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(31),
      I1 => Q(0),
      I2 => fp_out(27),
      O => \SegDISPLAY_0/out__3\(3)
    );
a0_INST_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(28),
      I1 => Q(0),
      I2 => fp_out(24),
      O => \SegDISPLAY_0/out__3\(0)
    );
a1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"82A88A8A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_1/out__3\(1),
      I2 => \SegDISPLAY_1/out__3\(2),
      I3 => \SegDISPLAY_1/out__3\(3),
      I4 => \SegDISPLAY_1/out__3\(0),
      O => a1
    );
a1_INST_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(21),
      I1 => Q(0),
      I2 => fp_out(17),
      O => \SegDISPLAY_1/out__3\(1)
    );
a1_INST_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(22),
      I1 => Q(0),
      I2 => fp_out(18),
      O => \SegDISPLAY_1/out__3\(2)
    );
a1_INST_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(23),
      I1 => Q(0),
      I2 => fp_out(19),
      O => \SegDISPLAY_1/out__3\(3)
    );
a1_INST_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fp_out(20),
      I1 => Q(0),
      I2 => fp_out(16),
      O => \SegDISPLAY_1/out__3\(0)
    );
b0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"082A82AA"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_0/out__3\(0),
      I2 => \SegDISPLAY_0/out__3\(3),
      I3 => \SegDISPLAY_0/out__3\(2),
      I4 => \SegDISPLAY_0/out__3\(1),
      O => b0
    );
b1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"082A82AA"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_1/out__3\(0),
      I2 => \SegDISPLAY_1/out__3\(3),
      I3 => \SegDISPLAY_1/out__3\(2),
      I4 => \SegDISPLAY_1/out__3\(1),
      O => b1
    );
bigger1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => bigger1_carry_n_0,
      CO(2) => bigger1_carry_n_1,
      CO(1) => bigger1_carry_n_2,
      CO(0) => bigger1_carry_n_3,
      CYINIT => '0',
      DI(3) => bigger1_carry_i_1_n_0,
      DI(2) => bigger1_carry_i_2_n_0,
      DI(1) => bigger1_carry_i_3_n_0,
      DI(0) => bigger1_carry_i_4_n_0,
      O(3 downto 0) => NLW_bigger1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => bigger1_carry_i_5_n_0,
      S(2) => bigger1_carry_i_6_n_0,
      S(1) => bigger1_carry_i_7_n_0,
      S(0) => bigger1_carry_i_8_n_0
    );
\bigger1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => bigger1_carry_n_0,
      CO(3) => \bigger1_carry__0_n_0\,
      CO(2) => \bigger1_carry__0_n_1\,
      CO(1) => \bigger1_carry__0_n_2\,
      CO(0) => \bigger1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \bigger1_carry__0_i_1_n_0\,
      DI(2) => \bigger1_carry__0_i_2_n_0\,
      DI(1) => \bigger1_carry__0_i_3_n_0\,
      DI(0) => \bigger1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_bigger1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \bigger1_carry__0_i_5_n_0\,
      S(2) => \bigger1_carry__0_i_6_n_0\,
      S(1) => \bigger1_carry__0_i_7_n_0\,
      S(0) => \bigger1_carry__0_i_8_n_0\
    );
\bigger1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(14),
      I1 => B(14),
      I2 => B(15),
      I3 => A(15),
      O => \bigger1_carry__0_i_1_n_0\
    );
\bigger1_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(12),
      I1 => B(12),
      I2 => B(13),
      I3 => A(13),
      O => \bigger1_carry__0_i_2_n_0\
    );
\bigger1_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => A(14),
      I1 => B(11),
      I2 => B(21),
      O => \bigger1_carry__0_i_3_n_0\
    );
\bigger1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => B(22),
      I1 => A(18),
      O => \bigger1_carry__0_i_4_n_0\
    );
\bigger1_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(15),
      I1 => A(15),
      I2 => B(14),
      I3 => A(14),
      O => \bigger1_carry__0_i_5_n_0\
    );
\bigger1_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      I2 => B(12),
      I3 => A(12),
      O => \bigger1_carry__0_i_6_n_0\
    );
\bigger1_carry__0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"81"
    )
        port map (
      I0 => B(11),
      I1 => B(21),
      I2 => A(14),
      O => \bigger1_carry__0_i_7_n_0\
    );
\bigger1_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => A(18),
      I1 => B(22),
      O => \bigger1_carry__0_i_8_n_0\
    );
\bigger1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bigger1_carry__0_n_0\,
      CO(3) => \bigger1_carry__1_n_0\,
      CO(2) => \bigger1_carry__1_n_1\,
      CO(1) => \bigger1_carry__1_n_2\,
      CO(0) => \bigger1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \bigger1_carry__1_i_1_n_0\,
      DI(2) => \bigger1_carry__1_i_2_n_0\,
      DI(1) => \bigger1_carry__1_i_3_n_0\,
      DI(0) => \bigger1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_bigger1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \bigger1_carry__1_i_5_n_0\,
      S(2) => \bigger1_carry__1_i_6_n_0\,
      S(1) => \bigger1_carry__1_i_7_n_0\,
      S(0) => \bigger1_carry__1_i_8_n_0\
    );
\bigger1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(22),
      I1 => B(22),
      I2 => B(29),
      I3 => A(23),
      O => \bigger1_carry__1_i_1_n_0\
    );
\bigger1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => A(21),
      I1 => B(21),
      O => \bigger1_carry__1_i_2_n_0\
    );
\bigger1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => A(20),
      I1 => B(31),
      O => \bigger1_carry__1_i_3_n_0\
    );
\bigger1_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(16),
      I1 => B(16),
      I2 => B(17),
      I3 => A(17),
      O => \bigger1_carry__1_i_4_n_0\
    );
\bigger1_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(29),
      I1 => A(23),
      I2 => B(22),
      I3 => A(22),
      O => \bigger1_carry__1_i_5_n_0\
    );
\bigger1_carry__1_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(21),
      I1 => A(21),
      O => \bigger1_carry__1_i_6_n_0\
    );
\bigger1_carry__1_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(31),
      I1 => A(20),
      O => \bigger1_carry__1_i_7_n_0\
    );
\bigger1_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(17),
      I1 => A(17),
      I2 => B(16),
      I3 => A(16),
      O => \bigger1_carry__1_i_8_n_0\
    );
\bigger1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \bigger1_carry__1_n_0\,
      CO(3) => p_0_in_0,
      CO(2) => \bigger1_carry__2_n_1\,
      CO(1) => \bigger1_carry__2_n_2\,
      CO(0) => \bigger1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \bigger1_carry__2_i_1_n_0\,
      DI(2) => \bigger1_carry__2_i_2_n_0\,
      DI(1) => \bigger1_carry__2_i_3_n_0\,
      DI(0) => \bigger1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_bigger1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \bigger1_carry__2_i_5_n_0\,
      S(2) => \bigger1_carry__2_i_6_n_0\,
      S(1) => \bigger1_carry__2_i_7_n_0\,
      S(0) => \bigger1_carry__2_i_8_n_0\
    );
\bigger1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => A(30),
      I1 => B(30),
      O => \bigger1_carry__2_i_1_n_0\
    );
\bigger1_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(28),
      I1 => B(28),
      I2 => B(29),
      I3 => A(29),
      O => \bigger1_carry__2_i_2_n_0\
    );
\bigger1_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      I2 => B(29),
      I3 => A(29),
      O => \bigger1_carry__2_i_3_n_0\
    );
\bigger1_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(24),
      I1 => B(24),
      I2 => B(29),
      I3 => A(25),
      O => \bigger1_carry__2_i_4_n_0\
    );
\bigger1_carry__2_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(30),
      I1 => A(30),
      O => \bigger1_carry__2_i_5_n_0\
    );
\bigger1_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      I2 => B(28),
      I3 => A(28),
      O => \bigger1_carry__2_i_6_n_0\
    );
\bigger1_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      I2 => B(26),
      I3 => A(26),
      O => \bigger1_carry__2_i_7_n_0\
    );
\bigger1_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(29),
      I1 => A(25),
      I2 => B(24),
      I3 => A(24),
      O => \bigger1_carry__2_i_8_n_0\
    );
bigger1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => B(17),
      I1 => B(31),
      O => bigger1_carry_i_1_n_0
    );
bigger1_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => B(4),
      I1 => A(4),
      I2 => A(5),
      O => bigger1_carry_i_2_n_0
    );
bigger1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => B(4),
      I1 => B(2),
      O => bigger1_carry_i_3_n_0
    );
bigger1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(0),
      I1 => B(31),
      I2 => A(16),
      I3 => A(14),
      O => bigger1_carry_i_4_n_0
    );
bigger1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(31),
      I1 => B(17),
      O => bigger1_carry_i_5_n_0
    );
bigger1_carry_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => B(4),
      I1 => A(4),
      I2 => A(5),
      O => bigger1_carry_i_6_n_0
    );
bigger1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(2),
      I1 => B(4),
      O => bigger1_carry_i_7_n_0
    );
bigger1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => A(16),
      I1 => A(14),
      I2 => B(31),
      I3 => A(0),
      O => bigger1_carry_i_8_n_0
    );
bigger_sign_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B(24),
      I1 => B(31),
      I2 => p_0_in_0,
      O => bigger_sign
    );
bigger_sign_2_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => bigger_sign,
      Q => bigger_sign_2
    );
c0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A28AA2A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_0/out__3\(2),
      I2 => \SegDISPLAY_0/out__3\(3),
      I3 => \SegDISPLAY_0/out__3\(0),
      I4 => \SegDISPLAY_0/out__3\(1),
      O => c0
    );
c1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A28AA2A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_1/out__3\(2),
      I2 => \SegDISPLAY_1/out__3\(3),
      I3 => \SegDISPLAY_1/out__3\(0),
      I4 => \SegDISPLAY_1/out__3\(1),
      O => c1
    );
carry_2_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => carry,
      Q => carry_2
    );
d0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22A88AA2"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_0/out__3\(2),
      I2 => \SegDISPLAY_0/out__3\(3),
      I3 => \SegDISPLAY_0/out__3\(1),
      I4 => \SegDISPLAY_0/out__3\(0),
      O => d0
    );
d1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22A88AA2"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_1/out__3\(2),
      I2 => \SegDISPLAY_1/out__3\(3),
      I3 => \SegDISPLAY_1/out__3\(1),
      I4 => \SegDISPLAY_1/out__3\(0),
      O => d1
    );
e0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8880AA8A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_0/out__3\(3),
      I2 => \SegDISPLAY_0/out__3\(2),
      I3 => \SegDISPLAY_0/out__3\(1),
      I4 => \SegDISPLAY_0/out__3\(0),
      O => e0
    );
e1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8880AA8A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_1/out__3\(3),
      I2 => \SegDISPLAY_1/out__3\(2),
      I3 => \SegDISPLAY_1/out__3\(1),
      I4 => \SegDISPLAY_1/out__3\(0),
      O => e1
    );
f0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A208A28A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_0/out__3\(2),
      I2 => \SegDISPLAY_0/out__3\(1),
      I3 => \SegDISPLAY_0/out__3\(3),
      I4 => \SegDISPLAY_0/out__3\(0),
      O => f0
    );
f1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A208A28A"
    )
        port map (
      I0 => a1_0(0),
      I1 => \SegDISPLAY_1/out__3\(2),
      I2 => \SegDISPLAY_1/out__3\(1),
      I3 => \SegDISPLAY_1/out__3\(3),
      I4 => \SegDISPLAY_1/out__3\(0),
      O => f1
    );
\final_exponent2_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \final_exponent2_inferred__0/i__carry_n_0\,
      CO(2) => \final_exponent2_inferred__0/i__carry_n_1\,
      CO(1) => \final_exponent2_inferred__0/i__carry_n_2\,
      CO(0) => \final_exponent2_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \i__carry_i_1__1_n_0\,
      DI(2) => \i__carry_i_2__1_n_0\,
      DI(1) => \i__carry_i_3__1_n_0\,
      DI(0) => \i__carry_i_4__1_n_0\,
      O(3 downto 0) => \NLW_final_exponent2_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6__1_n_0\,
      S(1) => \i__carry_i_7__0_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\final_exponent_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(23),
      I1 => B(29),
      I2 => p_0_in_0,
      O => exponent_bigger(0)
    );
\final_exponent_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(24),
      I1 => p_0_in_0,
      I2 => B(24),
      O => exponent_bigger(1)
    );
\final_exponent_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(25),
      I1 => B(29),
      I2 => p_0_in_0,
      O => exponent_bigger(2)
    );
\final_exponent_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(26),
      I1 => p_0_in_0,
      I2 => B(26),
      O => exponent_bigger(3)
    );
\final_exponent_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(29),
      I1 => B(29),
      I2 => p_0_in_0,
      O => exponent_bigger(6)
    );
\final_exponent_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(28),
      I1 => p_0_in_0,
      I2 => B(28),
      O => exponent_bigger(5)
    );
\final_exponent_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(30),
      I1 => p_0_in_0,
      I2 => B(30),
      O => exponent_bigger(7)
    );
\final_exponent_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(0),
      Q => final_exponent_reg(0)
    );
\final_exponent_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(1),
      Q => final_exponent_reg(1)
    );
\final_exponent_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(2),
      Q => final_exponent_reg(2)
    );
\final_exponent_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(3),
      Q => final_exponent_reg(3)
    );
\final_exponent_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(6),
      Q => final_exponent_reg(4)
    );
\final_exponent_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(5),
      Q => final_exponent_reg(5)
    );
\final_exponent_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => exponent_bigger(7),
      Q => final_exponent_reg(7)
    );
g0_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFFBFB"
    )
        port map (
      I0 => \SegDISPLAY_0/out__3\(3),
      I1 => a1_0(0),
      I2 => \SegDISPLAY_0/out__3\(2),
      I3 => \SegDISPLAY_0/out__3\(0),
      I4 => \SegDISPLAY_0/out__3\(1),
      O => g0
    );
g1_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFFBFB"
    )
        port map (
      I0 => \SegDISPLAY_1/out__3\(3),
      I1 => a1_0(0),
      I2 => \SegDISPLAY_1/out__3\(2),
      I3 => \SegDISPLAY_1/out__3\(0),
      I4 => \SegDISPLAY_1/out__3\(1),
      O => g1
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(29),
      I1 => B(29),
      I2 => p_0_in_0,
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \i__carry__0_i_16_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry_i_18_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I4 => \i__carry_i_19_n_0\,
      O => \i__carry__0_i_10_n_0\
    );
\i__carry__0_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry__0_i_18_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__0_i_17_n_0\,
      O => \i__carry__0_i_11_n_0\
    );
\i__carry__0_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B(17),
      I1 => B(31),
      I2 => p_0_in_0,
      O => mantissa_bigger(6)
    );
\i__carry__0_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A(5),
      I1 => p_0_in_0,
      O => mantissa_bigger(5)
    );
\i__carry__0_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(4),
      I1 => p_0_in_0,
      I2 => B(4),
      O => mantissa_bigger(4)
    );
\i__carry__0_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B8B80000BB88"
    )
        port map (
      I0 => mantissa_smaller(21),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => B(13),
      I3 => A(13),
      I4 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I5 => p_0_in_0,
      O => \i__carry__0_i_15_n_0\
    );
\i__carry__0_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20FFFF2F200000"
    )
        port map (
      I0 => mantissa_smaller(19),
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I3 => \i__carry_i_35_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I5 => \i__carry_i_33_n_0\,
      O => \i__carry__0_i_16_n_0\
    );
\i__carry__0_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \i__carry__0_i_19_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry__0_i_20_n_0\,
      I3 => A(16),
      I4 => p_0_in_0,
      I5 => B(16),
      O => \i__carry__0_i_17_n_0\
    );
\i__carry__0_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20FFFF2F200000"
    )
        port map (
      I0 => mantissa_smaller(22),
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I3 => \i__carry_i_41_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I5 => \i__carry_i_45_n_0\,
      O => \i__carry__0_i_18_n_0\
    );
\i__carry__0_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B8B80000BB88"
    )
        port map (
      I0 => A(20),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => B(12),
      I3 => A(12),
      I4 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I5 => p_0_in_0,
      O => \i__carry__0_i_19_n_0\
    );
\i__carry__0_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__0_i_8_n_0\,
      I3 => \i__carry__0_i_9_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__0_i_1__0_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(28),
      I1 => p_0_in_0,
      I2 => B(28),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry__0_i_20_n_0\
    );
\i__carry__0_i_21\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => B(22),
      I1 => p_0_in_0,
      I2 => A(22),
      O => mantissa_smaller(22)
    );
\i__carry__0_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__0_i_9_n_0\,
      I3 => \i__carry__0_i_10_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__0_i_2__0_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(29),
      I1 => B(29),
      I2 => p_0_in_0,
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__0_i_10_n_0\,
      I3 => \i__carry_i_14_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__0_i_3__0_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => A(30),
      I1 => B(30),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99AA9A9A66556565"
    )
        port map (
      I0 => B(21),
      I1 => \i__carry_i_12_n_0\,
      I2 => \i__carry__0_i_8_n_0\,
      I3 => \i__carry__0_i_11_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I5 => \i__carry_i_9_n_0\,
      O => \i__carry__0_i_4__0_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__0_i_9_n_0\,
      I2 => \i__carry__0_i_8_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(6),
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      O => \i__carry__0_i_5__0_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__0_i_10_n_0\,
      I2 => \i__carry__0_i_9_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(5),
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => A(28),
      I1 => B(28),
      O => \i__carry__0_i_6__0_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry_i_14_n_0\,
      I2 => \i__carry__0_i_10_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(4),
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(29),
      I1 => A(29),
      O => \i__carry__0_i_7__0_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \i__carry__0_i_15_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry_i_18_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I4 => \i__carry__0_i_16_n_0\,
      O => \i__carry__0_i_8_n_0\
    );
\i__carry__0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry__0_i_17_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry_i_27_n_0\,
      O => \i__carry__0_i_9_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__1_i_9_n_0\,
      I3 => \i__carry__1_i_10_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry__1_i_18_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__1_i_19_n_0\,
      O => \i__carry__1_i_10_n_0\
    );
\i__carry__1_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry__1_i_17_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__0_i_18_n_0\,
      O => \i__carry__1_i_11_n_0\
    );
\i__carry__1_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \i__carry__1_i_19_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__0_i_15_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I4 => \i__carry_i_18_n_0\,
      O => \i__carry__1_i_12_n_0\
    );
\i__carry__1_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => B(11),
      I1 => p_0_in_0,
      I2 => B(21),
      O => mantissa_bigger(11)
    );
\i__carry__1_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => B(11),
      I1 => p_0_in_0,
      I2 => A(14),
      O => mantissa_bigger(10)
    );
\i__carry__1_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => B(22),
      I1 => p_0_in_0,
      I2 => A(18),
      O => mantissa_bigger(9)
    );
\i__carry__1_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8BBB888"
    )
        port map (
      I0 => mantissa_smaller(22),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => B(14),
      I3 => p_0_in_0,
      I4 => A(14),
      I5 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry__1_i_16_n_0\
    );
\i__carry__1_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A808FFFFA8080000"
    )
        port map (
      I0 => \i__carry__4_i_10_n_0\,
      I1 => A(16),
      I2 => p_0_in_0,
      I3 => B(16),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I5 => \i__carry__0_i_19_n_0\,
      O => \i__carry__1_i_17_n_0\
    );
\i__carry__1_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003033BB00300088"
    )
        port map (
      I0 => mantissa_smaller(17),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => mantissa_smaller(21),
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \i__carry_i_32_n_0\,
      O => \i__carry__1_i_18_n_0\
    );
\i__carry__1_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8BBBB88B88888"
    )
        port map (
      I0 => \i__carry__1_i_20_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => mantissa_smaller(19),
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \i__carry_i_35_n_0\,
      O => \i__carry__1_i_19_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__1_i_10_n_0\,
      I3 => \i__carry__1_i_11_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF00AC"
    )
        port map (
      I0 => B(15),
      I1 => A(15),
      I2 => p_0_in_0,
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      O => \i__carry__1_i_20_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__1_i_11_n_0\,
      I3 => \i__carry__1_i_12_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__1_i_12_n_0\,
      I3 => \i__carry__0_i_11_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__1_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__1_i_10_n_0\,
      I2 => \i__carry__1_i_9_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(11),
      O => \i__carry__1_i_5_n_0\
    );
\i__carry__1_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__1_i_11_n_0\,
      I2 => \i__carry__1_i_10_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(10),
      O => \i__carry__1_i_6_n_0\
    );
\i__carry__1_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__1_i_12_n_0\,
      I2 => \i__carry__1_i_11_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(9),
      O => \i__carry__1_i_7_n_0\
    );
\i__carry__1_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__1_i_12_n_0\,
      I3 => \i__carry__0_i_11_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__1_i_8_n_0\
    );
\i__carry__1_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F80FFFF8F800000"
    )
        port map (
      I0 => \i__carry__4_i_10_n_0\,
      I1 => A(18),
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I3 => \i__carry__1_i_16_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I5 => \i__carry__1_i_17_n_0\,
      O => \i__carry__1_i_9_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__2_i_9_n_0\,
      I3 => \i__carry__2_i_10_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__2_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry__2_i_19_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__2_i_20_n_0\,
      O => \i__carry__2_i_10_n_0\
    );
\i__carry__2_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888BBBBB8888888"
    )
        port map (
      I0 => \i__carry__2_i_18_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__4_i_10_n_0\,
      I3 => A(18),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I5 => \i__carry__1_i_16_n_0\,
      O => \i__carry__2_i_11_n_0\
    );
\i__carry__2_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry__2_i_20_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__1_i_18_n_0\,
      O => \i__carry__2_i_12_n_0\
    );
\i__carry__2_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(15),
      I1 => p_0_in_0,
      I2 => B(15),
      O => mantissa_bigger(15)
    );
\i__carry__2_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => B(14),
      I1 => p_0_in_0,
      I2 => A(14),
      O => mantissa_bigger(14)
    );
\i__carry__2_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(13),
      I1 => p_0_in_0,
      I2 => B(13),
      O => mantissa_bigger(13)
    );
\i__carry__2_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(12),
      I1 => p_0_in_0,
      I2 => B(12),
      O => mantissa_bigger(12)
    );
\i__carry__2_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11100010"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => A(22),
      I3 => p_0_in_0,
      I4 => B(22),
      O => \i__carry__2_i_17_n_0\
    );
\i__carry__2_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0B0B0808080B080"
    )
        port map (
      I0 => A(20),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry__4_i_10_n_0\,
      I3 => A(16),
      I4 => p_0_in_0,
      I5 => B(16),
      O => \i__carry__2_i_18_n_0\
    );
\i__carry__2_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF0000B8000000"
    )
        port map (
      I0 => B(21),
      I1 => p_0_in_0,
      I2 => A(21),
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I4 => \i__carry__4_i_10_n_0\,
      I5 => mantissa_smaller(17),
      O => \i__carry__2_i_19_n_0\
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__2_i_10_n_0\,
      I3 => \i__carry__2_i_11_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__2_i_2_n_0\
    );
\i__carry__2_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A80FFFF8A800000"
    )
        port map (
      I0 => \i__carry__4_i_10_n_0\,
      I1 => B(31),
      I2 => p_0_in_0,
      I3 => A(20),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I5 => \i__carry__1_i_20_n_0\,
      O => \i__carry__2_i_20_n_0\
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__2_i_11_n_0\,
      I3 => \i__carry__2_i_12_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__2_i_3_n_0\
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__2_i_12_n_0\,
      I3 => \i__carry__1_i_9_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__2_i_4_n_0\
    );
\i__carry__2_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__2_i_10_n_0\,
      I2 => \i__carry__2_i_9_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(15),
      O => \i__carry__2_i_5_n_0\
    );
\i__carry__2_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__2_i_11_n_0\,
      I2 => \i__carry__2_i_10_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(14),
      O => \i__carry__2_i_6_n_0\
    );
\i__carry__2_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__2_i_12_n_0\,
      I2 => \i__carry__2_i_11_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(13),
      O => \i__carry__2_i_7_n_0\
    );
\i__carry__2_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__1_i_9_n_0\,
      I2 => \i__carry__2_i_12_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(12),
      O => \i__carry__2_i_8_n_0\
    );
\i__carry__2_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888FFFFB8880000"
    )
        port map (
      I0 => \i__carry__2_i_17_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry__4_i_10_n_0\,
      I3 => A(18),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I5 => \i__carry__2_i_18_n_0\,
      O => \i__carry__2_i_9_n_0\
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A959"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \i__carry__3_i_8_n_0\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I3 => \i__carry__3_i_9_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__3_i_1_n_0\
    );
\i__carry__3_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30BB300030883000"
    )
        port map (
      I0 => A(20),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry__2_i_17_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I4 => \i__carry__4_i_10_n_0\,
      I5 => A(18),
      O => \i__carry__3_i_10_n_0\
    );
\i__carry__3_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0302FFFF03020000"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I3 => mantissa_smaller(19),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I5 => \i__carry__2_i_19_n_0\,
      O => \i__carry__3_i_11_n_0\
    );
\i__carry__3_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(17),
      I1 => p_0_in_0,
      I2 => B(17),
      O => mantissa_bigger(17)
    );
\i__carry__3_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(16),
      I1 => p_0_in_0,
      I2 => B(16),
      O => mantissa_bigger(16)
    );
\i__carry__3_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10111000"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => B(21),
      I3 => p_0_in_0,
      I4 => A(21),
      O => \i__carry__3_i_14_n_0\
    );
\i__carry__3_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => A(20),
      I1 => p_0_in_0,
      I2 => B(31),
      O => mantissa_smaller(19)
    );
\i__carry__3_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__3_i_10_n_0\,
      I3 => \i__carry__3_i_11_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__3_i_2_n_0\
    );
\i__carry__3_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__3_i_11_n_0\,
      I3 => \i__carry__2_i_9_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__3_i_3_n_0\
    );
\i__carry__3_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"569A"
    )
        port map (
      I0 => \i__carry__3_i_1_n_0\,
      I1 => p_0_in_0,
      I2 => B(31),
      I3 => A(20),
      O => \i__carry__3_i_4_n_0\
    );
\i__carry__3_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__3_i_10_n_0\,
      I2 => \i__carry__3_i_8_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => A(18),
      O => \i__carry__3_i_5_n_0\
    );
\i__carry__3_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__3_i_11_n_0\,
      I2 => \i__carry__3_i_10_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(17),
      O => \i__carry__3_i_6_n_0\
    );
\i__carry__3_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__2_i_9_n_0\,
      I2 => \i__carry__3_i_11_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(16),
      O => \i__carry__3_i_7_n_0\
    );
\i__carry__3_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808083B08080838"
    )
        port map (
      I0 => \i__carry__3_i_14_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => mantissa_smaller(19),
      O => \i__carry__3_i_8_n_0\
    );
\i__carry__3_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAA0300"
    )
        port map (
      I0 => \i__carry__2_i_17_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I3 => A(20),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I5 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      O => \i__carry__3_i_9_n_0\
    );
\i__carry__4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55556A65"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \i__carry__4_i_7_n_0\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I3 => \i__carry__4_i_8_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__4_i_1_n_0\
    );
\i__carry__4_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry__4_i_10_n_0\
    );
\i__carry__4_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry__4_i_8_n_0\,
      I3 => \i__carry__4_i_9_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry__4_i_2_n_0\
    );
\i__carry__4_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA9AA"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \i__carry_i_12_n_0\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I3 => \i__carry__4_i_10_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I5 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      O => \i__carry__4_i_3_n_0\
    );
\i__carry__4_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \i__carry__4_i_1_n_0\,
      I1 => B(22),
      I2 => p_0_in_0,
      I3 => A(22),
      O => \i__carry__4_i_4_n_0\
    );
\i__carry__4_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"569A"
    )
        port map (
      I0 => \i__carry__4_i_2_n_0\,
      I1 => p_0_in_0,
      I2 => B(21),
      I3 => A(21),
      O => \i__carry__4_i_5_n_0\
    );
\i__carry__4_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry__3_i_9_n_0\,
      I2 => \i__carry__4_i_9_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => A(20),
      O => \i__carry__4_i_6_n_0\
    );
\i__carry__4_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry__4_i_7_n_0\
    );
\i__carry__4_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1011100000000000"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => B(22),
      I3 => p_0_in_0,
      I4 => A(22),
      I5 => \i__carry__4_i_10_n_0\,
      O => \i__carry__4_i_8_n_0\
    );
\i__carry__4_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAA8A80"
    )
        port map (
      I0 => \i__carry__4_i_10_n_0\,
      I1 => B(21),
      I2 => p_0_in_0,
      I3 => A(21),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I5 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      O => \i__carry__4_i_9_n_0\
    );
\i__carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(24),
      I1 => B(31),
      O => \i__carry__5_i_1_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(0),
      I1 => B(31),
      I2 => p_0_in_0,
      O => mantissa_bigger(0)
    );
\i__carry_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \i__carry_i_18_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry_i_19_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I4 => \i__carry_i_20_n_0\,
      O => \i__carry_i_10_n_0\
    );
\i__carry_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => \i__carry_i_14__0_n_0\,
      I1 => \i__carry_i_13__0_n_0\,
      I2 => \out[7]_i_6_n_0\,
      O => \i__carry_i_10__0_n_0\
    );
\i__carry_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry_i_21_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry_i_22_n_0\,
      O => \i__carry_i_11_n_0\
    );
\i__carry_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFBBBBAAAAAAAA"
    )
        port map (
      I0 => \i__carry_i_15__0_n_0\,
      I1 => \i__carry_i_16__0_n_0\,
      I2 => \i__carry_i_17__0_n_0\,
      I3 => \out[30]_i_9_n_0\,
      I4 => \i__carry_i_18__0_n_0\,
      I5 => \i__carry_i_19__0_n_0\,
      O => \i__carry_i_11__0_n_0\
    );
\i__carry_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEFEFEFEFE"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry__0_n_6\,
      I1 => \shifted_mantissa3_inferred__0/i__carry__0_n_5\,
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_4\,
      I3 => \i__carry_i_23_n_0\,
      I4 => \i__carry_i_24_n_0\,
      I5 => \i__carry_i_25_n_0\,
      O => \i__carry_i_12_n_0\
    );
\i__carry_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF0EFFFFFFFF"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[18]\,
      I1 => \mantissa_sum_2_reg_n_0_[19]\,
      I2 => \i__carry_i_20__0_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[23]\,
      I4 => \mantissa_sum_2_reg_n_0_[22]\,
      I5 => \i__carry_i_21__0_n_0\,
      O => \i__carry_i_12__0_n_0\
    );
\i__carry_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBB8B8B8"
    )
        port map (
      I0 => \i__carry_i_20_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry_i_26_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I4 => \i__carry_i_19_n_0\,
      O => \i__carry_i_13_n_0\
    );
\i__carry_i_13__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[11]\,
      I1 => \mantissa_sum_2_reg_n_0_[10]\,
      I2 => \mantissa_sum_2_reg_n_0_[9]\,
      I3 => \mantissa_sum_2_reg_n_0_[8]\,
      I4 => \i__carry_i_16__0_n_0\,
      O => \i__carry_i_13__0_n_0\
    );
\i__carry_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \i__carry_i_27_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I2 => \i__carry_i_21_n_0\,
      O => \i__carry_i_14_n_0\
    );
\i__carry_i_14__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[3]\,
      I1 => \mantissa_sum_2_reg_n_0_[2]\,
      I2 => \mantissa_sum_2_reg_n_0_[1]\,
      I3 => \mantissa_sum_2_reg_n_0_[0]\,
      I4 => \out[30]_i_9_n_0\,
      O => \i__carry_i_14__0_n_0\
    );
\i__carry_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => B(4),
      I1 => p_0_in_0,
      I2 => B(2),
      O => mantissa_bigger(2)
    );
\i__carry_i_15__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[20]\,
      I1 => \mantissa_sum_2_reg_n_0_[21]\,
      I2 => \mantissa_sum_2_reg_n_0_[22]\,
      I3 => \mantissa_sum_2_reg_n_0_[23]\,
      O => \i__carry_i_15__0_n_0\
    );
\i__carry_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => A(16),
      I1 => p_0_in_0,
      I2 => A(14),
      O => mantissa_bigger(1)
    );
\i__carry_i_16__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[12]\,
      I1 => \mantissa_sum_2_reg_n_0_[13]\,
      I2 => \mantissa_sum_2_reg_n_0_[14]\,
      I3 => \mantissa_sum_2_reg_n_0_[15]\,
      O => \i__carry_i_16__0_n_0\
    );
\i__carry_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFDC100000DC10"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry_i_28_n_0\,
      I3 => \i__carry_i_29_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      I5 => \i__carry_i_22_n_0\,
      O => \i__carry_i_17_n_0\
    );
\i__carry_i_17__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[0]\,
      I1 => \mantissa_sum_2_reg_n_0_[1]\,
      I2 => \mantissa_sum_2_reg_n_0_[2]\,
      I3 => \mantissa_sum_2_reg_n_0_[3]\,
      O => \i__carry_i_17__0_n_0\
    );
\i__carry_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B8B80000BB88"
    )
        port map (
      I0 => mantissa_smaller(17),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => A(18),
      I3 => B(22),
      I4 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I5 => p_0_in_0,
      O => \i__carry_i_18_n_0\
    );
\i__carry_i_18__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[8]\,
      I1 => \mantissa_sum_2_reg_n_0_[9]\,
      I2 => \mantissa_sum_2_reg_n_0_[10]\,
      I3 => \mantissa_sum_2_reg_n_0_[11]\,
      O => \i__carry_i_18__0_n_0\
    );
\i__carry_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF4040000F404"
    )
        port map (
      I0 => p_0_in_0,
      I1 => A(5),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => mantissa_smaller(21),
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \i__carry_i_32_n_0\,
      O => \i__carry_i_19_n_0\
    );
\i__carry_i_19__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[16]\,
      I1 => \mantissa_sum_2_reg_n_0_[17]\,
      I2 => \mantissa_sum_2_reg_n_0_[18]\,
      I3 => \mantissa_sum_2_reg_n_0_[19]\,
      O => \i__carry_i_19__0_n_0\
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(26),
      I1 => p_0_in_0,
      I2 => B(26),
      O => \i__carry_i_1__0_n_0\
    );
\i__carry_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => final_exponent_reg(7),
      I1 => final_exponent_reg(4),
      O => \i__carry_i_1__1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(25),
      I1 => B(29),
      I2 => p_0_in_0,
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBB8B8B8"
    )
        port map (
      I0 => \i__carry_i_33_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry_i_34_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I4 => \i__carry_i_35_n_0\,
      O => \i__carry_i_20_n_0\
    );
\i__carry_i_20__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[21]\,
      I1 => \mantissa_sum_2_reg_n_0_[20]\,
      O => \i__carry_i_20__0_n_0\
    );
\i__carry_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F400F0F4F400000"
    )
        port map (
      I0 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I1 => mantissa_smaller(16),
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I3 => \i__carry_i_37_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \i__carry_i_38_n_0\,
      O => \i__carry_i_21_n_0\
    );
\i__carry_i_21__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBBFFB0FFBBFFBB"
    )
        port map (
      I0 => \i__carry_i_22__0_n_0\,
      I1 => \i__carry_i_23__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[0]\,
      I3 => \mantissa_sum_2_reg_n_0_[16]\,
      I4 => \mantissa_sum_2_reg_n_0_[17]\,
      I5 => \i__carry_i_24__0_n_0\,
      O => \i__carry_i_21__0_n_0\
    );
\i__carry_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC0CFAFAFC0C0A0A"
    )
        port map (
      I0 => \i__carry_i_39_n_0\,
      I1 => \i__carry_i_40_n_0\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I3 => \i__carry_i_41_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \i__carry_i_42_n_0\,
      O => \i__carry_i_22_n_0\
    );
\i__carry_i_22__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0302"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[12]\,
      I1 => \mantissa_sum_2_reg_n_0_[14]\,
      I2 => \mantissa_sum_2_reg_n_0_[15]\,
      I3 => \mantissa_sum_2_reg_n_0_[13]\,
      I4 => \i__carry_i_20__0_n_0\,
      I5 => \mantissa_sum_2_reg_n_0_[17]\,
      O => \i__carry_i_22__0_n_0\
    );
\i__carry_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => A(28),
      I1 => B(28),
      I2 => A(26),
      I3 => p_0_in_0,
      I4 => B(26),
      O => \i__carry_i_23_n_0\
    );
\i__carry_i_23__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0302FFFFFFFF"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[6]\,
      I1 => \mantissa_sum_2_reg_n_0_[8]\,
      I2 => \mantissa_sum_2_reg_n_0_[9]\,
      I3 => \mantissa_sum_2_reg_n_0_[7]\,
      I4 => \i__carry_i_25__0_n_0\,
      I5 => \i__carry_i_26__0_n_0\,
      O => \i__carry_i_23__0_n_0\
    );
\i__carry_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => A(24),
      I1 => B(24),
      I2 => A(30),
      I3 => p_0_in_0,
      I4 => B(30),
      O => \i__carry_i_24_n_0\
    );
\i__carry_i_24__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \i__carry_i_27__0_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[1]\,
      I2 => \i__carry_i_20__0_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[13]\,
      I4 => \mantissa_sum_2_reg_n_0_[12]\,
      I5 => \i__carry_i_28__0_n_0\,
      O => \i__carry_i_24__0_n_0\
    );
\i__carry_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F000F11"
    )
        port map (
      I0 => A(23),
      I1 => A(25),
      I2 => B(29),
      I3 => p_0_in_0,
      I4 => A(29),
      O => \i__carry_i_25_n_0\
    );
\i__carry_i_25__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[10]\,
      I1 => \mantissa_sum_2_reg_n_0_[11]\,
      I2 => \mantissa_sum_2_reg_n_0_[14]\,
      I3 => \mantissa_sum_2_reg_n_0_[15]\,
      O => \i__carry_i_25__0_n_0\
    );
\i__carry_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => \i__carry_i_43_n_0\,
      I1 => \i__carry_i_44_n_0\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      O => \i__carry_i_26_n_0\
    );
\i__carry_i_26__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEEEF"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[9]\,
      I1 => \mantissa_sum_2_reg_n_0_[8]\,
      I2 => \mantissa_sum_2_reg_n_0_[2]\,
      I3 => \mantissa_sum_2_reg_n_0_[3]\,
      I4 => \mantissa_sum_2_reg_n_0_[5]\,
      I5 => \mantissa_sum_2_reg_n_0_[4]\,
      O => \i__carry_i_26__0_n_0\
    );
\i__carry_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \i__carry_i_45_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      I2 => \i__carry_i_41_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I4 => \i__carry_i_42_n_0\,
      O => \i__carry_i_27_n_0\
    );
\i__carry_i_27__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[5]\,
      I1 => \mantissa_sum_2_reg_n_0_[4]\,
      O => \i__carry_i_27__0_n_0\
    );
\i__carry_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFCFCFA0A0C0C"
    )
        port map (
      I0 => B(31),
      I1 => A(0),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => B(16),
      I4 => p_0_in_0,
      I5 => A(16),
      O => \i__carry_i_28_n_0\
    );
\i__carry_i_28__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[9]\,
      I1 => \mantissa_sum_2_reg_n_0_[8]\,
      O => \i__carry_i_28__0_n_0\
    );
\i__carry_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => B(12),
      I1 => A(12),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => p_0_in_0,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \i__carry_i_38_n_0\,
      O => \i__carry_i_29_n_0\
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry_i_10_n_0\,
      I3 => \i__carry_i_11_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EC"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => final_exponent_reg(5),
      I2 => final_exponent_reg(4),
      O => \i__carry_i_2__1_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A(24),
      I1 => p_0_in_0,
      I2 => B(24),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_30\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => B(17),
      I1 => p_0_in_0,
      I2 => A(17),
      O => mantissa_smaller(17)
    );
\i__carry_i_31\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => A(21),
      I1 => p_0_in_0,
      I2 => B(21),
      O => mantissa_smaller(21)
    );
\i__carry_i_32\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => p_0_in_0,
      O => \i__carry_i_32_n_0\
    );
\i__carry_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333E2E23333EE22"
    )
        port map (
      I0 => B(21),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => B(15),
      I3 => A(15),
      I4 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I5 => p_0_in_0,
      O => \i__carry_i_33_n_0\
    );
\i__carry_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CCAA0000F0F0"
    )
        port map (
      I0 => A(20),
      I1 => B(31),
      I2 => B(21),
      I3 => p_0_in_0,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I5 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_34_n_0\
    );
\i__carry_i_35\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(11),
      I1 => p_0_in_0,
      I2 => B(21),
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_35_n_0\
    );
\i__carry_i_36\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => B(16),
      I1 => p_0_in_0,
      I2 => A(16),
      O => mantissa_smaller(16)
    );
\i__carry_i_37\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => B(12),
      I1 => A(12),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => p_0_in_0,
      O => \i__carry_i_37_n_0\
    );
\i__carry_i_38\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00E4E4"
    )
        port map (
      I0 => p_0_in_0,
      I1 => A(4),
      I2 => B(4),
      I3 => A(20),
      I4 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_38_n_0\
    );
\i__carry_i_39\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00E4E4"
    )
        port map (
      I0 => p_0_in_0,
      I1 => B(4),
      I2 => B(2),
      I3 => A(18),
      I4 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_39_n_0\
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555A695"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I2 => \i__carry_i_11_n_0\,
      I3 => \i__carry_i_13_n_0\,
      I4 => \i__carry_i_12_n_0\,
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E888"
    )
        port map (
      I0 => final_exponent_reg(3),
      I1 => \i__carry_i_10__0_n_0\,
      I2 => final_exponent_reg(2),
      I3 => \i__carry_i_11__0_n_0\,
      O => \i__carry_i_3__1_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(24),
      I1 => B(31),
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_40\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(11),
      I1 => p_0_in_0,
      I2 => A(14),
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_40_n_0\
    );
\i__carry_i_41\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => B(14),
      I1 => p_0_in_0,
      I2 => A(14),
      I3 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_41_n_0\
    );
\i__carry_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFCFCFA0A0C0C"
    )
        port map (
      I0 => B(31),
      I1 => B(17),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => B(22),
      I4 => p_0_in_0,
      I5 => A(22),
      O => \i__carry_i_42_n_0\
    );
\i__carry_i_43\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => A(18),
      I1 => B(22),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => p_0_in_0,
      O => \i__carry_i_43_n_0\
    );
\i__carry_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC0CFAFAFC0C0A0A"
    )
        port map (
      I0 => A(14),
      I1 => A(16),
      I2 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      I3 => B(17),
      I4 => p_0_in_0,
      I5 => A(17),
      O => \i__carry_i_44_n_0\
    );
\i__carry_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8BBB888"
    )
        port map (
      I0 => A(18),
      I1 => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      I2 => B(11),
      I3 => p_0_in_0,
      I4 => A(14),
      I5 => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      O => \i__carry_i_45_n_0\
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A(23),
      I1 => B(29),
      I2 => p_0_in_0,
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E888"
    )
        port map (
      I0 => final_exponent_reg(1),
      I1 => \i__carry_i_12__0_n_0\,
      I2 => final_exponent_reg(0),
      I3 => \out[7]_i_4_n_0\,
      O => \i__carry_i_4__1_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => final_exponent_reg(4),
      I1 => final_exponent_reg(7),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => A(26),
      I1 => B(26),
      O => \i__carry_i_5__0_n_0\
    );
\i__carry_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99AA9A9A66556565"
    )
        port map (
      I0 => B(21),
      I1 => \i__carry_i_12_n_0\,
      I2 => \i__carry_i_10_n_0\,
      I3 => \i__carry_i_14_n_0\,
      I4 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I5 => \i__carry_i_9_n_0\,
      O => \i__carry_i_5__1_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry_i_11_n_0\,
      I2 => \i__carry_i_10_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(2),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(29),
      I1 => A(25),
      O => \i__carry_i_6__0_n_0\
    );
\i__carry_i_6__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => final_exponent_reg(5),
      I2 => final_exponent_reg(4),
      O => \i__carry_i_6__1_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFBB50445044AFBB"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry_i_13_n_0\,
      I2 => \i__carry_i_11_n_0\,
      I3 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I4 => \i__carry_i_9_n_0\,
      I5 => mantissa_bigger(1),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0660"
    )
        port map (
      I0 => \i__carry_i_10__0_n_0\,
      I1 => final_exponent_reg(3),
      I2 => \i__carry_i_11__0_n_0\,
      I3 => final_exponent_reg(2),
      O => \i__carry_i_7__0_n_0\
    );
\i__carry_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => A(24),
      I1 => B(24),
      O => \i__carry_i_7__1_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0660"
    )
        port map (
      I0 => \i__carry_i_12__0_n_0\,
      I1 => final_exponent_reg(1),
      I2 => \out[7]_i_4_n_0\,
      I3 => final_exponent_reg(0),
      O => \i__carry_i_8_n_0\
    );
\i__carry_i_8__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4540"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => \i__carry_i_13_n_0\,
      I2 => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      I3 => \i__carry_i_17_n_0\,
      O => \i__carry_i_8__0_n_0\
    );
\i__carry_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(29),
      I1 => A(23),
      O => \i__carry_i_8__1_n_0\
    );
\i__carry_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B(31),
      I1 => B(24),
      O => \i__carry_i_9_n_0\
    );
\i__carry_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \i__carry_i_13__0_n_0\,
      I1 => \out[7]_i_6_n_0\,
      O => \i__carry_i_9__0_n_0\
    );
\mantissa_sum_2_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry_n_7\,
      Q => \mantissa_sum_2_reg_n_0_[0]\
    );
\mantissa_sum_2_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__1_n_5\,
      Q => \mantissa_sum_2_reg_n_0_[10]\
    );
\mantissa_sum_2_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__1_n_4\,
      Q => \mantissa_sum_2_reg_n_0_[11]\
    );
\mantissa_sum_2_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__2_n_7\,
      Q => \mantissa_sum_2_reg_n_0_[12]\
    );
\mantissa_sum_2_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__2_n_6\,
      Q => \mantissa_sum_2_reg_n_0_[13]\
    );
\mantissa_sum_2_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__2_n_5\,
      Q => \mantissa_sum_2_reg_n_0_[14]\
    );
\mantissa_sum_2_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__2_n_4\,
      Q => \mantissa_sum_2_reg_n_0_[15]\
    );
\mantissa_sum_2_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__3_n_7\,
      Q => \mantissa_sum_2_reg_n_0_[16]\
    );
\mantissa_sum_2_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__3_n_6\,
      Q => \mantissa_sum_2_reg_n_0_[17]\
    );
\mantissa_sum_2_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__3_n_5\,
      Q => \mantissa_sum_2_reg_n_0_[18]\
    );
\mantissa_sum_2_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__3_n_4\,
      Q => \mantissa_sum_2_reg_n_0_[19]\
    );
\mantissa_sum_2_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry_n_6\,
      Q => \mantissa_sum_2_reg_n_0_[1]\
    );
\mantissa_sum_2_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__4_n_7\,
      Q => \mantissa_sum_2_reg_n_0_[20]\
    );
\mantissa_sum_2_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__4_n_6\,
      Q => \mantissa_sum_2_reg_n_0_[21]\
    );
\mantissa_sum_2_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__4_n_5\,
      Q => \mantissa_sum_2_reg_n_0_[22]\
    );
\mantissa_sum_2_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__4_n_4\,
      Q => \mantissa_sum_2_reg_n_0_[23]\
    );
\mantissa_sum_2_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry_n_5\,
      Q => \mantissa_sum_2_reg_n_0_[2]\
    );
\mantissa_sum_2_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry_n_4\,
      Q => \mantissa_sum_2_reg_n_0_[3]\
    );
\mantissa_sum_2_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__0_n_7\,
      Q => \mantissa_sum_2_reg_n_0_[4]\
    );
\mantissa_sum_2_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__0_n_6\,
      Q => \mantissa_sum_2_reg_n_0_[5]\
    );
\mantissa_sum_2_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__0_n_5\,
      Q => \mantissa_sum_2_reg_n_0_[6]\
    );
\mantissa_sum_2_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__0_n_4\,
      Q => \mantissa_sum_2_reg_n_0_[7]\
    );
\mantissa_sum_2_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__1_n_7\,
      Q => \mantissa_sum_2_reg_n_0_[8]\
    );
\mantissa_sum_2_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \_inferred__2/i__carry__1_n_6\,
      Q => \mantissa_sum_2_reg_n_0_[9]\
    );
\out[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[1]\,
      I1 => carry_2,
      I2 => \out[1]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      O => result(0)
    );
\out[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[17]\,
      I1 => carry_2,
      I2 => \out[17]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[16]_i_2_n_0\,
      O => result(16)
    );
\out[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \out[18]_i_3_n_0\,
      I1 => \i__carry_i_12__0_n_0\,
      I2 => \out[20]_i_3_n_0\,
      I3 => \i__carry_i_11__0_n_0\,
      I4 => \out[16]_i_3_n_0\,
      O => \out[16]_i_2_n_0\
    );
\out[16]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[9]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[1]\,
      I3 => \i__carry_i_10__0_n_0\,
      O => \out[16]_i_3_n_0\
    );
\out[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[18]\,
      I1 => carry_2,
      I2 => \out[18]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[17]_i_2_n_0\,
      O => result(17)
    );
\out[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \out[22]_i_7_n_0\,
      I1 => \out[19]_i_3_n_0\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \out[21]_i_3_n_0\,
      I4 => \i__carry_i_11__0_n_0\,
      I5 => \out[17]_i_3_n_0\,
      O => \out[17]_i_2_n_0\
    );
\out[17]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[10]\,
      I1 => \i__carry_i_10__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[2]\,
      I3 => \i__carry_i_9__0_n_0\,
      O => \out[17]_i_3_n_0\
    );
\out[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[19]\,
      I1 => carry_2,
      I2 => \out[19]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[18]_i_2_n_0\,
      O => result(18)
    );
\out[18]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \out[22]_i_8_n_0\,
      I1 => \i__carry_i_11__0_n_0\,
      I2 => \out[20]_i_3_n_0\,
      I3 => \i__carry_i_12__0_n_0\,
      I4 => \out[18]_i_3_n_0\,
      O => \out[18]_i_2_n_0\
    );
\out[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => \out[22]_i_12_n_0\,
      I1 => \i__carry_i_11__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[11]\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[3]\,
      I5 => \i__carry_i_9__0_n_0\,
      O => \out[18]_i_3_n_0\
    );
\out[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[20]\,
      I1 => carry_2,
      I2 => \out[20]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[19]_i_2_n_0\,
      O => result(19)
    );
\out[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \out[22]_i_5_n_0\,
      I1 => \out[21]_i_3_n_0\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \out[22]_i_7_n_0\,
      I4 => \i__carry_i_11__0_n_0\,
      I5 => \out[19]_i_3_n_0\,
      O => \out[19]_i_2_n_0\
    );
\out[19]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[4]\,
      I1 => \i__carry_i_13__0_n_0\,
      I2 => \out[7]_i_6_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[12]\,
      O => \out[19]_i_3_n_0\
    );
\out[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[2]\,
      I1 => carry_2,
      I2 => \out[2]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[1]_i_2_n_0\,
      O => result(1)
    );
\out[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \i__carry_i_10__0_n_0\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[0]\,
      I3 => \i__carry_i_11__0_n_0\,
      I4 => \i__carry_i_12__0_n_0\,
      O => \out[1]_i_2_n_0\
    );
\out[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[21]\,
      I1 => carry_2,
      I2 => \out[21]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[20]_i_2_n_0\,
      O => result(20)
    );
\out[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \out[22]_i_10_n_0\,
      I1 => \i__carry_i_12__0_n_0\,
      I2 => \out[22]_i_8_n_0\,
      I3 => \i__carry_i_11__0_n_0\,
      I4 => \out[20]_i_3_n_0\,
      O => \out[20]_i_2_n_0\
    );
\out[20]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F808"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[5]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \i__carry_i_10__0_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[13]\,
      O => \out[20]_i_3_n_0\
    );
\out[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[22]\,
      I1 => carry_2,
      I2 => \out[22]_i_3_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[21]_i_2_n_0\,
      O => result(21)
    );
\out[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \out[22]_i_6_n_0\,
      I1 => \out[22]_i_7_n_0\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \out[22]_i_5_n_0\,
      I4 => \i__carry_i_11__0_n_0\,
      I5 => \out[21]_i_3_n_0\,
      O => \out[21]_i_2_n_0\
    );
\out[21]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[14]\,
      I1 => \i__carry_i_10__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[6]\,
      I3 => \i__carry_i_9__0_n_0\,
      O => \out[21]_i_3_n_0\
    );
\out[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[23]\,
      I1 => carry_2,
      I2 => \out[22]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[22]_i_3_n_0\,
      O => result(22)
    );
\out[22]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFFBA00"
    )
        port map (
      I0 => \out[22]_i_11_n_0\,
      I1 => \i__carry_i_10__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[11]\,
      I3 => \i__carry_i_11__0_n_0\,
      I4 => \out[22]_i_12_n_0\,
      O => \out[22]_i_10_n_0\
    );
\out[22]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[19]\,
      I1 => \i__carry_i_13__0_n_0\,
      I2 => \out[7]_i_6_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[3]\,
      O => \out[22]_i_11_n_0\
    );
\out[22]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[7]\,
      I1 => \i__carry_i_13__0_n_0\,
      I2 => \out[7]_i_6_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[15]\,
      O => \out[22]_i_12_n_0\
    );
\out[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAAEFEFAFAAEEEE"
    )
        port map (
      I0 => \out[22]_i_4_n_0\,
      I1 => \out[22]_i_5_n_0\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \out[22]_i_6_n_0\,
      I4 => \i__carry_i_11__0_n_0\,
      I5 => \out[22]_i_7_n_0\,
      O => \out[22]_i_2_n_0\
    );
\out[22]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4FFF400"
    )
        port map (
      I0 => \i__carry_i_11__0_n_0\,
      I1 => \out[22]_i_8_n_0\,
      I2 => \out[22]_i_9_n_0\,
      I3 => \i__carry_i_12__0_n_0\,
      I4 => \out[22]_i_10_n_0\,
      O => \out[22]_i_3_n_0\
    );
\out[22]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E2FFE2E2"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[6]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[22]\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[14]\,
      O => \out[22]_i_4_n_0\
    );
\out[22]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E2FFE2E2"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[2]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[18]\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[10]\,
      O => \out[22]_i_5_n_0\
    );
\out[22]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E2FFE2E2"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[4]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[20]\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[12]\,
      O => \out[22]_i_6_n_0\
    );
\out[22]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF44F4"
    )
        port map (
      I0 => \i__carry_i_10__0_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[8]\,
      I2 => \mantissa_sum_2_reg_n_0_[0]\,
      I3 => \i__carry_i_9__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[16]\,
      O => \out[22]_i_7_n_0\
    );
\out[22]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB8B8"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[17]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[1]\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[9]\,
      O => \out[22]_i_8_n_0\
    );
\out[22]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F2FFF2F2"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[5]\,
      I1 => \i__carry_i_9__0_n_0\,
      I2 => \mantissa_sum_2_reg_n_0_[21]\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[13]\,
      O => \out[22]_i_9_n_0\
    );
\out[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04FF0404"
    )
        port map (
      I0 => final_exponent_reg(0),
      I1 => carry_2,
      I2 => \out[23]_i_2_n_0\,
      I3 => \out[27]_i_2_n_0\,
      I4 => final_exponent10_in(0),
      O => result(23)
    );
\out[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => final_exponent_reg(2),
      I1 => final_exponent_reg(3),
      I2 => final_exponent_reg(5),
      I3 => final_exponent_reg(0),
      I4 => final_exponent_reg(1),
      I5 => \out[23]_i_3_n_0\,
      O => \out[23]_i_2_n_0\
    );
\out[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => final_exponent_reg(4),
      I1 => final_exponent_reg(7),
      O => \out[23]_i_3_n_0\
    );
\out[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44F4F444"
    )
        port map (
      I0 => \out[27]_i_2_n_0\,
      I1 => final_exponent10_in(1),
      I2 => carry_2,
      I3 => final_exponent_reg(0),
      I4 => final_exponent_reg(1),
      O => result(24)
    );
\out[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FF4F4F444444444"
    )
        port map (
      I0 => \out[27]_i_2_n_0\,
      I1 => final_exponent10_in(2),
      I2 => final_exponent_reg(2),
      I3 => final_exponent_reg(1),
      I4 => final_exponent_reg(0),
      I5 => carry_2,
      O => result(25)
    );
\out[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FF44444"
    )
        port map (
      I0 => \out[27]_i_2_n_0\,
      I1 => final_exponent10_in(3),
      I2 => final_exponent_reg(3),
      I3 => \out[26]_i_3_n_0\,
      I4 => carry_2,
      O => result(26)
    );
\out[26]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => final_exponent_reg(1),
      I1 => final_exponent_reg(0),
      I2 => final_exponent_reg(2),
      O => \out[26]_i_3_n_0\
    );
\out[26]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => final_exponent_reg(3),
      I1 => \i__carry_i_10__0_n_0\,
      O => \out[26]_i_4_n_0\
    );
\out[26]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i__carry_i_11__0_n_0\,
      I1 => final_exponent_reg(2),
      O => \out[26]_i_5_n_0\
    );
\out[26]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => final_exponent_reg(1),
      I1 => \i__carry_i_12__0_n_0\,
      O => \out[26]_i_6_n_0\
    );
\out[26]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \out[7]_i_4_n_0\,
      I1 => final_exponent_reg(0),
      O => \out[26]_i_7_n_0\
    );
\out[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FF44444"
    )
        port map (
      I0 => \out[27]_i_2_n_0\,
      I1 => final_exponent10_in(4),
      I2 => final_exponent_reg(4),
      I3 => \out[27]_i_3_n_0\,
      I4 => carry_2,
      O => result(27)
    );
\out[27]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \final_exponent2_inferred__0/i__carry_n_0\,
      I1 => \out[30]_i_4_n_0\,
      I2 => carry_2,
      O => \out[27]_i_2_n_0\
    );
\out[27]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => final_exponent_reg(2),
      I1 => final_exponent_reg(0),
      I2 => final_exponent_reg(1),
      I3 => final_exponent_reg(3),
      O => \out[27]_i_3_n_0\
    );
\out[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"606060606F606060"
    )
        port map (
      I0 => final_exponent_reg(5),
      I1 => \out[28]_i_2_n_0\,
      I2 => carry_2,
      I3 => final_exponent10_in(5),
      I4 => \final_exponent2_inferred__0/i__carry_n_0\,
      I5 => \out[30]_i_4_n_0\,
      O => result(28)
    );
\out[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => final_exponent_reg(3),
      I1 => final_exponent_reg(1),
      I2 => final_exponent_reg(0),
      I3 => final_exponent_reg(2),
      I4 => final_exponent_reg(4),
      O => \out[28]_i_2_n_0\
    );
\out[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"202020202F202020"
    )
        port map (
      I0 => final_exponent_reg(4),
      I1 => \out[30]_i_2_n_0\,
      I2 => carry_2,
      I3 => final_exponent10_in(6),
      I4 => \final_exponent2_inferred__0/i__carry_n_0\,
      I5 => \out[30]_i_4_n_0\,
      O => result(29)
    );
\out[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[3]\,
      I1 => carry_2,
      I2 => \out[3]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[2]_i_2_n_0\,
      O => result(2)
    );
\out[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => \i__carry_i_11__0_n_0\,
      I2 => \i__carry_i_10__0_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[1]\,
      I4 => \i__carry_i_12__0_n_0\,
      O => \out[2]_i_2_n_0\
    );
\out[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"606060606F606060"
    )
        port map (
      I0 => final_exponent_reg(7),
      I1 => \out[30]_i_2_n_0\,
      I2 => carry_2,
      I3 => final_exponent10_in(7),
      I4 => \final_exponent2_inferred__0/i__carry_n_0\,
      I5 => \out[30]_i_4_n_0\,
      O => result(30)
    );
\out[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => final_exponent_reg(4),
      I1 => final_exponent_reg(2),
      I2 => final_exponent_reg(0),
      I3 => final_exponent_reg(1),
      I4 => final_exponent_reg(3),
      I5 => final_exponent_reg(5),
      O => \out[30]_i_2_n_0\
    );
\out[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \out[30]_i_9_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[0]\,
      I2 => \mantissa_sum_2_reg_n_0_[1]\,
      I3 => \mantissa_sum_2_reg_n_0_[2]\,
      I4 => \mantissa_sum_2_reg_n_0_[3]\,
      I5 => \i__carry_i_9__0_n_0\,
      O => \out[30]_i_4_n_0\
    );
\out[30]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => final_exponent_reg(7),
      O => \out[30]_i_5_n_0\
    );
\out[30]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => final_exponent_reg(4),
      O => \out[30]_i_6_n_0\
    );
\out[30]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => final_exponent_reg(5),
      O => \out[30]_i_7_n_0\
    );
\out[30]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => final_exponent_reg(4),
      I1 => \i__carry_i_9__0_n_0\,
      O => \out[30]_i_8_n_0\
    );
\out[30]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[4]\,
      I1 => \mantissa_sum_2_reg_n_0_[5]\,
      I2 => \mantissa_sum_2_reg_n_0_[6]\,
      I3 => \mantissa_sum_2_reg_n_0_[7]\,
      O => \out[30]_i_9_n_0\
    );
\out[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[4]\,
      I1 => carry_2,
      I2 => \out[4]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[3]_i_2_n_0\,
      O => result(3)
    );
\out[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B080000000000000"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[2]\,
      I1 => \i__carry_i_12__0_n_0\,
      I2 => \i__carry_i_11__0_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[0]\,
      I4 => \i__carry_i_9__0_n_0\,
      I5 => \i__carry_i_10__0_n_0\,
      O => \out[3]_i_2_n_0\
    );
\out[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[5]\,
      I1 => carry_2,
      I2 => \out[5]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[4]_i_2_n_0\,
      O => result(4)
    );
\out[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A80000000000000"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[3]\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \mantissa_sum_2_reg_n_0_[1]\,
      I4 => \i__carry_i_10__0_n_0\,
      I5 => \i__carry_i_11__0_n_0\,
      O => \out[4]_i_2_n_0\
    );
\out[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[6]\,
      I1 => carry_2,
      I2 => \out[6]_i_2_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[5]_i_2_n_0\,
      O => result(5)
    );
\out[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CAC0C0C0C0C0C0C0"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => \out[7]_i_14_n_0\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[2]\,
      I5 => \i__carry_i_11__0_n_0\,
      O => \out[5]_i_2_n_0\
    );
\out[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[7]\,
      I1 => carry_2,
      I2 => \out[7]_i_5_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[6]_i_2_n_0\,
      O => result(6)
    );
\out[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CAC0C0C0C0C0C0C0"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => \out[7]_i_8_n_0\,
      I2 => \i__carry_i_12__0_n_0\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[3]\,
      I5 => \i__carry_i_11__0_n_0\,
      O => \out[6]_i_2_n_0\
    );
\out[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[8]\,
      I1 => carry_2,
      I2 => \out[7]_i_3_n_0\,
      I3 => \out[7]_i_4_n_0\,
      I4 => \out[7]_i_5_n_0\,
      O => result(7)
    );
\out[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF00FF000000F2"
    )
        port map (
      I0 => \out[7]_i_15_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[6]\,
      I2 => \mantissa_sum_2_reg_n_0_[7]\,
      I3 => \out[7]_i_16_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[8]\,
      I5 => \out[7]_i_17_n_0\,
      O => \out[7]_i_10_n_0\
    );
\out[7]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF4"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[16]\,
      I1 => \mantissa_sum_2_reg_n_0_[15]\,
      I2 => \mantissa_sum_2_reg_n_0_[21]\,
      I3 => \mantissa_sum_2_reg_n_0_[19]\,
      I4 => \mantissa_sum_2_reg_n_0_[17]\,
      O => \out[7]_i_11_n_0\
    );
\out[7]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[14]\,
      I1 => \mantissa_sum_2_reg_n_0_[16]\,
      O => \out[7]_i_12_n_0\
    );
\out[7]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[2]\,
      I2 => \i__carry_i_10__0_n_0\,
      O => \out[7]_i_13_n_0\
    );
\out[7]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20202020202020"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[4]\,
      I1 => \out[7]_i_6_n_0\,
      I2 => \i__carry_i_11__0_n_0\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \i__carry_i_9__0_n_0\,
      I5 => \mantissa_sum_2_reg_n_0_[0]\,
      O => \out[7]_i_14_n_0\
    );
\out[7]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAEEEEFFEF"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[5]\,
      I1 => \mantissa_sum_2_reg_n_0_[3]\,
      I2 => \mantissa_sum_2_reg_n_0_[0]\,
      I3 => \mantissa_sum_2_reg_n_0_[1]\,
      I4 => \mantissa_sum_2_reg_n_0_[2]\,
      I5 => \mantissa_sum_2_reg_n_0_[4]\,
      O => \out[7]_i_15_n_0\
    );
\out[7]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEEFE"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[16]\,
      I1 => \mantissa_sum_2_reg_n_0_[14]\,
      I2 => \mantissa_sum_2_reg_n_0_[10]\,
      I3 => \mantissa_sum_2_reg_n_0_[11]\,
      I4 => \mantissa_sum_2_reg_n_0_[12]\,
      O => \out[7]_i_16_n_0\
    );
\out[7]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[11]\,
      I1 => \mantissa_sum_2_reg_n_0_[9]\,
      O => \out[7]_i_17_n_0\
    );
\out[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20FFFF2F200000"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[7]\,
      I1 => \out[7]_i_6_n_0\,
      I2 => \i__carry_i_11__0_n_0\,
      I3 => \out[7]_i_7_n_0\,
      I4 => \i__carry_i_12__0_n_0\,
      I5 => \out[7]_i_8_n_0\,
      O => \out[7]_i_3_n_0\
    );
\out[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBABBBBBBBA"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[23]\,
      I1 => \out[7]_i_9_n_0\,
      I2 => \out[7]_i_10_n_0\,
      I3 => \out[7]_i_11_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[13]\,
      I5 => \out[7]_i_12_n_0\,
      O => \out[7]_i_4_n_0\
    );
\out[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20FFFF2F200000"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[6]\,
      I1 => \out[7]_i_6_n_0\,
      I2 => \i__carry_i_11__0_n_0\,
      I3 => \out[7]_i_13_n_0\,
      I4 => \i__carry_i_12__0_n_0\,
      I5 => \out[7]_i_14_n_0\,
      O => \out[7]_i_5_n_0\
    );
\out[7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[19]\,
      I1 => \mantissa_sum_2_reg_n_0_[18]\,
      I2 => \mantissa_sum_2_reg_n_0_[17]\,
      I3 => \mantissa_sum_2_reg_n_0_[16]\,
      I4 => \i__carry_i_15__0_n_0\,
      O => \out[7]_i_6_n_0\
    );
\out[7]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \i__carry_i_9__0_n_0\,
      I1 => \mantissa_sum_2_reg_n_0_[3]\,
      I2 => \i__carry_i_10__0_n_0\,
      O => \out[7]_i_7_n_0\
    );
\out[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20202020202020"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[5]\,
      I1 => \out[7]_i_6_n_0\,
      I2 => \i__carry_i_11__0_n_0\,
      I3 => \i__carry_i_10__0_n_0\,
      I4 => \mantissa_sum_2_reg_n_0_[1]\,
      I5 => \i__carry_i_9__0_n_0\,
      O => \out[7]_i_8_n_0\
    );
\out[7]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABBBABA"
    )
        port map (
      I0 => \mantissa_sum_2_reg_n_0_[22]\,
      I1 => \mantissa_sum_2_reg_n_0_[21]\,
      I2 => \mantissa_sum_2_reg_n_0_[20]\,
      I3 => \mantissa_sum_2_reg_n_0_[19]\,
      I4 => \mantissa_sum_2_reg_n_0_[18]\,
      O => \out[7]_i_9_n_0\
    );
\out_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(0),
      Q => leds_AXI(0)
    );
\out_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(16),
      Q => fp_out(16)
    );
\out_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(17),
      Q => fp_out(17)
    );
\out_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(18),
      Q => fp_out(18)
    );
\out_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(19),
      Q => fp_out(19)
    );
\out_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(1),
      Q => leds_AXI(1)
    );
\out_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(20),
      Q => fp_out(20)
    );
\out_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(21),
      Q => fp_out(21)
    );
\out_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(22),
      Q => fp_out(22)
    );
\out_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(23),
      Q => fp_out(23)
    );
\out_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(24),
      Q => fp_out(24)
    );
\out_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(25),
      Q => fp_out(25)
    );
\out_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(26),
      Q => fp_out(26)
    );
\out_reg[26]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \out_reg[26]_i_2_n_0\,
      CO(2) => \out_reg[26]_i_2_n_1\,
      CO(1) => \out_reg[26]_i_2_n_2\,
      CO(0) => \out_reg[26]_i_2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => final_exponent_reg(3 downto 0),
      O(3 downto 0) => final_exponent10_in(3 downto 0),
      S(3) => \out[26]_i_4_n_0\,
      S(2) => \out[26]_i_5_n_0\,
      S(1) => \out[26]_i_6_n_0\,
      S(0) => \out[26]_i_7_n_0\
    );
\out_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(27),
      Q => fp_out(27)
    );
\out_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(28),
      Q => fp_out(28)
    );
\out_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(29),
      Q => fp_out(29)
    );
\out_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(2),
      Q => leds_AXI(2)
    );
\out_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(30),
      Q => fp_out(30)
    );
\out_reg[30]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \out_reg[26]_i_2_n_0\,
      CO(3) => \NLW_out_reg[30]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \out_reg[30]_i_3_n_1\,
      CO(1) => \out_reg[30]_i_3_n_2\,
      CO(0) => \out_reg[30]_i_3_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => final_exponent_reg(4),
      DI(1 downto 0) => final_exponent_reg(5 downto 4),
      O(3 downto 0) => final_exponent10_in(7 downto 4),
      S(3) => \out[30]_i_5_n_0\,
      S(2) => \out[30]_i_6_n_0\,
      S(1) => \out[30]_i_7_n_0\,
      S(0) => \out[30]_i_8_n_0\
    );
\out_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => bigger_sign_2,
      Q => fp_out(31)
    );
\out_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(3),
      Q => leds_AXI(3)
    );
\out_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(4),
      Q => leds_AXI(4)
    );
\out_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(5),
      Q => leds_AXI(5)
    );
\out_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(6),
      Q => leds_AXI(6)
    );
\out_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => result(7),
      Q => leds_AXI(7)
    );
\shifted_mantissa3_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \shifted_mantissa3_inferred__0/i__carry_n_0\,
      CO(2) => \shifted_mantissa3_inferred__0/i__carry_n_1\,
      CO(1) => \shifted_mantissa3_inferred__0/i__carry_n_2\,
      CO(0) => \shifted_mantissa3_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \i__carry_i_1__0_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1) => \i__carry_i_3_n_0\,
      DI(0) => \i__carry_i_4__0_n_0\,
      O(3) => \shifted_mantissa3_inferred__0/i__carry_n_4\,
      O(2) => \shifted_mantissa3_inferred__0/i__carry_n_5\,
      O(1) => \shifted_mantissa3_inferred__0/i__carry_n_6\,
      O(0) => \shifted_mantissa3_inferred__0/i__carry_n_7\,
      S(3) => \i__carry_i_5__0_n_0\,
      S(2) => \i__carry_i_6__0_n_0\,
      S(1) => \i__carry_i_7__1_n_0\,
      S(0) => \i__carry_i_8__1_n_0\
    );
\shifted_mantissa3_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \shifted_mantissa3_inferred__0/i__carry_n_0\,
      CO(3) => \NLW_shifted_mantissa3_inferred__0/i__carry__0_CO_UNCONNECTED\(3),
      CO(2) => \shifted_mantissa3_inferred__0/i__carry__0_n_1\,
      CO(1) => \shifted_mantissa3_inferred__0/i__carry__0_n_2\,
      CO(0) => \shifted_mantissa3_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \i__carry__0_i_1_n_0\,
      DI(1) => \i__carry__0_i_2_n_0\,
      DI(0) => \i__carry__0_i_3_n_0\,
      O(3) => \shifted_mantissa3_inferred__0/i__carry__0_n_4\,
      O(2) => \shifted_mantissa3_inferred__0/i__carry__0_n_5\,
      O(1) => \shifted_mantissa3_inferred__0/i__carry__0_n_6\,
      O(0) => \shifted_mantissa3_inferred__0/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_4_n_0\,
      S(2) => \i__carry__0_i_5__0_n_0\,
      S(1) => \i__carry__0_i_6__0_n_0\,
      S(0) => \i__carry__0_i_7__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P is
  port (
    current_state : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    signal_out_reg : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P is
  signal debounced_sig : STD_LOGIC;
begin
DB: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer_1
     port map (
      debounced_sig => debounced_sig,
      s00_axi_aclk => s00_axi_aclk,
      signal_out_reg_0(0) => signal_out_reg(0)
    );
L2P: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P_2
     port map (
      current_state(1 downto 0) => current_state(1 downto 0),
      debounced_sig => debounced_sig,
      s00_axi_aclk => s00_axi_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P_0 is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P_0 : entity is "Debounce_L2P";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P_0 is
  signal debounced_sig : STD_LOGIC;
begin
DB: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer
     port map (
      Q(0) => Q(0),
      debounced_sig => debounced_sig,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn
    );
L2P: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_L2P
     port map (
      AR(0) => AR(0),
      debounced_sig => debounced_sig,
      s00_axi_aclk => s00_axi_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_system is
  port (
    \counter_reg[4]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0 : out STD_LOGIC;
    g0 : out STD_LOGIC;
    f0 : out STD_LOGIC;
    e0 : out STD_LOGIC;
    d0 : out STD_LOGIC;
    b0 : out STD_LOGIC;
    a0 : out STD_LOGIC;
    c1 : out STD_LOGIC;
    g1 : out STD_LOGIC;
    f1 : out STD_LOGIC;
    e1 : out STD_LOGIC;
    d1 : out STD_LOGIC;
    b1 : out STD_LOGIC;
    a1 : out STD_LOGIC;
    leds_AXI : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    signal_out_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    a1_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_system;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_system is
  signal \L2P/current_state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MEM_n_0 : STD_LOGIC;
  signal MEM_n_1 : STD_LOGIC;
  signal MEM_n_10 : STD_LOGIC;
  signal MEM_n_11 : STD_LOGIC;
  signal MEM_n_13 : STD_LOGIC;
  signal MEM_n_14 : STD_LOGIC;
  signal MEM_n_2 : STD_LOGIC;
  signal MEM_n_3 : STD_LOGIC;
  signal MEM_n_33 : STD_LOGIC;
  signal MEM_n_34 : STD_LOGIC;
  signal MEM_n_35 : STD_LOGIC;
  signal MEM_n_36 : STD_LOGIC;
  signal MEM_n_4 : STD_LOGIC;
  signal MEM_n_5 : STD_LOGIC;
  signal MEM_n_6 : STD_LOGIC;
  signal MEM_n_7 : STD_LOGIC;
  signal MEM_n_8 : STD_LOGIC;
  signal MEM_n_9 : STD_LOGIC;
  signal \^counter_reg[4]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pointer : STD_LOGIC_VECTOR ( 1 to 1 );
  signal reg_A : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal reset_db : STD_LOGIC;
begin
  \counter_reg[4]\(0) <= \^counter_reg[4]\(0);
ADDER: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_pipeline
     port map (
      AR(0) => reset_db,
      \A_reg[25]_0\(0) => MEM_n_14,
      \B_reg[17]_0\ => MEM_n_36,
      \B_reg[21]_0\ => MEM_n_13,
      \B_reg[22]_0\ => MEM_n_35,
      \B_reg[24]_0\ => MEM_n_34,
      \B_reg[4]_0\ => MEM_n_33,
      D(11) => MEM_n_0,
      D(10) => MEM_n_1,
      D(9) => MEM_n_2,
      D(8) => MEM_n_3,
      D(7) => MEM_n_4,
      D(6) => MEM_n_5,
      D(5) => MEM_n_6,
      D(4) => MEM_n_7,
      D(3) => MEM_n_8,
      D(2) => MEM_n_9,
      D(1) => MEM_n_10,
      D(0) => MEM_n_11,
      Q(0) => \^counter_reg[4]\(0),
      a0 => a0,
      a1 => a1,
      a1_0(0) => a1_0(0),
      b0 => b0,
      b1 => b1,
      c0 => c0,
      c1 => c1,
      d0 => d0,
      d1 => d1,
      e0 => e0,
      e1 => e1,
      f0 => f0,
      f1 => f1,
      g0 => g0,
      g1 => g1,
      leds_AXI(7 downto 0) => leds_AXI(7 downto 0),
      pointer(0) => pointer(1),
      reg_A(17 downto 16) => reg_A(29 downto 28),
      reg_A(15) => reg_A(26),
      reg_A(14 downto 10) => reg_A(24 downto 20),
      reg_A(9 downto 3) => reg_A(18 downto 12),
      reg_A(2 downto 1) => reg_A(5 downto 4),
      reg_A(0) => reg_A(0),
      s00_axi_aclk => s00_axi_aclk
    );
DB_noisy_signal: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P
     port map (
      current_state(1 downto 0) => \L2P/current_state\(1 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      signal_out_reg(0) => signal_out_reg(0)
    );
DB_reset: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debounce_L2P_0
     port map (
      AR(0) => reset_db,
      Q(0) => Q(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn
    );
MEM: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Data_mem
     port map (
      AR(0) => reset_db,
      D(11) => MEM_n_0,
      D(10) => MEM_n_1,
      D(9) => MEM_n_2,
      D(8) => MEM_n_3,
      D(7) => MEM_n_4,
      D(6) => MEM_n_5,
      D(5) => MEM_n_6,
      D(4) => MEM_n_7,
      D(3) => MEM_n_8,
      D(2) => MEM_n_9,
      D(1) => MEM_n_10,
      D(0) => MEM_n_11,
      current_state(1 downto 0) => \L2P/current_state\(1 downto 0),
      \pointer_reg[1]_0\(0) => pointer(1),
      \pointer_reg[1]_1\ => MEM_n_13,
      \pointer_reg[1]_2\ => MEM_n_34,
      \pointer_reg[2]_0\(0) => MEM_n_14,
      \pointer_reg[2]_1\ => MEM_n_33,
      \pointer_reg[2]_2\ => MEM_n_35,
      \pointer_reg[2]_3\ => MEM_n_36,
      reg_A(17 downto 16) => reg_A(29 downto 28),
      reg_A(15) => reg_A(26),
      reg_A(14 downto 10) => reg_A(24 downto 20),
      reg_A(9 downto 3) => reg_A(18 downto 12),
      reg_A(2 downto 1) => reg_A(5 downto 4),
      reg_A(0) => reg_A(0),
      s00_axi_aclk => s00_axi_aclk
    );
SegDISPLAY_0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SevenSegDisplay
     port map (
      AR(0) => reset_db,
      \counter_reg[4]_0\(0) => \^counter_reg[4]\(0),
      s00_axi_aclk => s00_axi_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0_S00_AXI is
  port (
    axi_wready_reg_0 : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    aw_en_reg_0 : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    leds_AXI : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0 : out STD_LOGIC;
    g0 : out STD_LOGIC;
    f0 : out STD_LOGIC;
    e0 : out STD_LOGIC;
    d0 : out STD_LOGIC;
    b0 : out STD_LOGIC;
    a0 : out STD_LOGIC;
    c1 : out STD_LOGIC;
    g1 : out STD_LOGIC;
    f1 : out STD_LOGIC;
    e1 : out STD_LOGIC;
    d1 : out STD_LOGIC;
    b1 : out STD_LOGIC;
    a1 : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    axi_bvalid_reg_0 : in STD_LOGIC;
    aw_en_reg_1 : in STD_LOGIC;
    axi_rvalid_reg_0 : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0_S00_AXI is
  signal \^aw_en_reg_0\ : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^axi_wready_reg_0\ : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \slv_reg0[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0__0\ : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal slv_reg1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1__0\ : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal slv_reg2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2__0\ : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[3]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \slv_reg2[31]_i_2\ : label is "soft_lutpair75";
begin
  aw_en_reg_0 <= \^aw_en_reg_0\;
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_wready_reg_0 <= \^axi_wready_reg_0\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_reg_1,
      Q => \^aw_en_reg_0\,
      S => axi_awready_i_1_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^axi_arready_reg_0\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^axi_arready_reg_0\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^axi_arready_reg_0\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => \^axi_awready_reg_0\,
      I3 => \^aw_en_reg_0\,
      I4 => s00_axi_awvalid,
      I5 => p_0_in_0(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => \^axi_awready_reg_0\,
      I3 => \^aw_en_reg_0\,
      I4 => s00_axi_awvalid,
      I5 => p_0_in_0(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in_0(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in_0(1),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^axi_awready_reg_0\,
      I2 => \^aw_en_reg_0\,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^axi_awready_reg_0\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_reg_0,
      Q => s00_axi_bvalid,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => slv_reg3(0),
      I2 => slv_reg0(0),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg1(0),
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(10),
      I1 => slv_reg3(10),
      I2 => \slv_reg0__0\(10),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(10),
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(11),
      I1 => slv_reg3(11),
      I2 => \slv_reg0__0\(11),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(11),
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(12),
      I1 => slv_reg3(12),
      I2 => \slv_reg0__0\(12),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(12),
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(13),
      I1 => slv_reg3(13),
      I2 => \slv_reg0__0\(13),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(13),
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(14),
      I1 => slv_reg3(14),
      I2 => \slv_reg0__0\(14),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(14),
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(15),
      I1 => slv_reg3(15),
      I2 => \slv_reg0__0\(15),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(15),
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(16),
      I1 => slv_reg3(16),
      I2 => \slv_reg0__0\(16),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(16),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(17),
      I1 => slv_reg3(17),
      I2 => \slv_reg0__0\(17),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(17),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(18),
      I1 => slv_reg3(18),
      I2 => \slv_reg0__0\(18),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(18),
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(19),
      I1 => slv_reg3(19),
      I2 => \slv_reg0__0\(19),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(19),
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(1),
      I1 => slv_reg3(1),
      I2 => \slv_reg0__0\(1),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(1),
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(20),
      I1 => slv_reg3(20),
      I2 => \slv_reg0__0\(20),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(20),
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(21),
      I1 => slv_reg3(21),
      I2 => \slv_reg0__0\(21),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(21),
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(22),
      I1 => slv_reg3(22),
      I2 => \slv_reg0__0\(22),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(22),
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(23),
      I1 => slv_reg3(23),
      I2 => \slv_reg0__0\(23),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(23),
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(24),
      I1 => slv_reg3(24),
      I2 => \slv_reg0__0\(24),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(24),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(25),
      I1 => slv_reg3(25),
      I2 => \slv_reg0__0\(25),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(25),
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(26),
      I1 => slv_reg3(26),
      I2 => \slv_reg0__0\(26),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(26),
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(27),
      I1 => slv_reg3(27),
      I2 => \slv_reg0__0\(27),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(27),
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(28),
      I1 => slv_reg3(28),
      I2 => \slv_reg0__0\(28),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(28),
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(29),
      I1 => slv_reg3(29),
      I2 => \slv_reg0__0\(29),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(29),
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(2),
      I1 => slv_reg3(2),
      I2 => \slv_reg0__0\(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(2),
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(30),
      I1 => slv_reg3(30),
      I2 => \slv_reg0__0\(30),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(30),
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(31),
      I1 => slv_reg3(31),
      I2 => \slv_reg0__0\(31),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(31),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(3),
      I1 => slv_reg3(3),
      I2 => \slv_reg0__0\(3),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(3),
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(4),
      I1 => slv_reg3(4),
      I2 => \slv_reg0__0\(4),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(4),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(5),
      I1 => slv_reg3(5),
      I2 => \slv_reg0__0\(5),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(5),
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(6),
      I1 => slv_reg3(6),
      I2 => \slv_reg0__0\(6),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(6),
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(7),
      I1 => slv_reg3(7),
      I2 => \slv_reg0__0\(7),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(7),
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(8),
      I1 => slv_reg3(8),
      I2 => \slv_reg0__0\(8),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(8),
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \slv_reg2__0\(9),
      I1 => slv_reg3(9),
      I2 => \slv_reg0__0\(9),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg1__0\(9),
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_reg_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^axi_wready_reg_0\,
      I3 => \^aw_en_reg_0\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^axi_wready_reg_0\,
      R => axi_awready_i_1_n_0
    );
fpadd: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_system
     port map (
      Q(0) => slv_reg2(0),
      a0 => a0,
      a1 => a1,
      a1_0(0) => slv_reg1(0),
      b0 => b0,
      b1 => b1,
      c0 => c0,
      c1 => c1,
      \counter_reg[4]\(0) => Q(0),
      d0 => d0,
      d1 => d1,
      e0 => e0,
      e1 => e1,
      f0 => f0,
      f1 => f1,
      g0 => g0,
      g1 => g1,
      leds_AXI(7 downto 0) => leds_AXI(7 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      signal_out_reg(0) => slv_reg0(0)
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => p_0_in_0(0),
      I3 => s00_axi_wstrb(1),
      O => \slv_reg0[15]_i_1_n_0\
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => p_0_in_0(0),
      I3 => s00_axi_wstrb(2),
      O => \slv_reg0[23]_i_1_n_0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => p_0_in_0(0),
      I3 => s00_axi_wstrb(3),
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => p_0_in_0(0),
      I3 => s00_axi_wstrb(0),
      O => \slv_reg0[7]_i_1_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg0__0\(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg0__0\(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg0__0\(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg0__0\(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg0__0\(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg0__0\(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg0__0\(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg0__0\(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg0__0\(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg0__0\(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg0__0\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg0__0\(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg0__0\(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg0__0\(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg0__0\(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg0__0\(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg0__0\(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg0__0\(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg0__0\(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg0__0\(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg0__0\(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg0__0\(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg0__0\(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg0__0\(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg0__0\(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg0__0\(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg0__0\(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg0__0\(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg0__0\(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg0__0\(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg0__0\(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in_0(0),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in_0(0),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in_0(0),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg1(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg1__0\(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg1__0\(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg1__0\(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg1__0\(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg1__0\(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg1__0\(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg1__0\(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg1__0\(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg1__0\(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg1__0\(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg1__0\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg1__0\(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg1__0\(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg1__0\(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg1__0\(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg1__0\(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg1__0\(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg1__0\(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg1__0\(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg1__0\(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg1__0\(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg1__0\(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg1__0\(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg1__0\(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg1__0\(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg1__0\(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg1__0\(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg1__0\(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg1__0\(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg1__0\(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg1__0\(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in_0(0),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in_0(0),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in_0(0),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in_0(1),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in_0(0),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg2(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg2__0\(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg2__0\(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg2__0\(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg2__0\(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg2__0\(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg2__0\(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg2__0\(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg2__0\(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg2__0\(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg2__0\(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg2__0\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg2__0\(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg2__0\(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg2__0\(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg2__0\(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg2__0\(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg2__0\(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg2__0\(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg2__0\(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg2__0\(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg2__0\(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg2__0\(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg2__0\(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg2__0\(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg2__0\(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg2__0\(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg2__0\(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg2__0\(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg2__0\(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg2__0\(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg2__0\(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      O => p_1_in(15)
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      O => p_1_in(23)
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      O => p_1_in(31)
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      O => p_1_in(7)
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(0),
      Q => slv_reg3(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => slv_reg3(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => slv_reg3(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => slv_reg3(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => slv_reg3(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => slv_reg3(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => slv_reg3(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(1),
      Q => slv_reg3(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(2),
      Q => slv_reg3(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(3),
      Q => slv_reg3(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(4),
      Q => slv_reg3(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(5),
      Q => slv_reg3(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(6),
      Q => slv_reg3(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(7),
      Q => slv_reg3(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => slv_reg3(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => slv_reg3(9),
      R => axi_awready_i_1_n_0
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^axi_arready_reg_0\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0 is
  port (
    leds_AXI : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    an0 : out STD_LOGIC;
    c0 : out STD_LOGIC;
    g0 : out STD_LOGIC;
    f0 : out STD_LOGIC;
    e0 : out STD_LOGIC;
    d0 : out STD_LOGIC;
    b0 : out STD_LOGIC;
    a0 : out STD_LOGIC;
    c1 : out STD_LOGIC;
    g1 : out STD_LOGIC;
    f1 : out STD_LOGIC;
    e1 : out STD_LOGIC;
    d1 : out STD_LOGIC;
    b1 : out STD_LOGIC;
    a1 : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0 is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal fpadd_ip_v1_0_v1_0_S00_AXI_inst_n_4 : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => fpadd_ip_v1_0_v1_0_S00_AXI_inst_n_4,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
fpadd_ip_v1_0_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0_S00_AXI
     port map (
      Q(0) => an0,
      a0 => a0,
      a1 => a1,
      aw_en_reg_0 => fpadd_ip_v1_0_v1_0_S00_AXI_inst_n_4,
      aw_en_reg_1 => aw_en_i_1_n_0,
      axi_arready_reg_0 => \^s_axi_arready\,
      axi_awready_reg_0 => \^s_axi_awready\,
      axi_bvalid_reg_0 => axi_bvalid_i_1_n_0,
      axi_rvalid_reg_0 => axi_rvalid_i_1_n_0,
      axi_wready_reg_0 => \^s_axi_wready\,
      b0 => b0,
      b1 => b1,
      c0 => c0,
      c1 => c1,
      d0 => d0,
      d1 => d1,
      e0 => e0,
      e1 => e1,
      f0 => f0,
      f1 => f1,
      g0 => g0,
      g1 => g1,
      leds_AXI(7 downto 0) => leds_AXI(7 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bvalid => \^s00_axi_bvalid\,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rvalid => \^s00_axi_rvalid\,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    leds_AXI : out STD_LOGIC_VECTOR ( 7 downto 0 );
    an0 : out STD_LOGIC;
    a0 : out STD_LOGIC;
    b0 : out STD_LOGIC;
    c0 : out STD_LOGIC;
    d0 : out STD_LOGIC;
    e0 : out STD_LOGIC;
    f0 : out STD_LOGIC;
    g0 : out STD_LOGIC;
    an1 : out STD_LOGIC;
    a1 : out STD_LOGIC;
    b1 : out STD_LOGIC;
    c1 : out STD_LOGIC;
    d1 : out STD_LOGIC;
    e1 : out STD_LOGIC;
    f1 : out STD_LOGIC;
    g1 : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "lab2_simple_arm_adder_ip_0_0,fpadd_ip_v1_0_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "fpadd_ip_v1_0_v1_0,Vivado 2020.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^an1\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 9.9e+07, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN lab2_simple_arm_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 9.9e+07, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN lab2_simple_arm_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  an0 <= \^an1\;
  an1 <= \^an1\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpadd_ip_v1_0_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      a0 => a0,
      a1 => a1,
      an0 => \^an1\,
      b0 => b0,
      b1 => b1,
      c0 => c0,
      c1 => c1,
      d0 => d0,
      d1 => d1,
      e0 => e0,
      e1 => e1,
      f0 => f0,
      f1 => f1,
      g0 => g0,
      g1 => g1,
      leds_AXI(7 downto 0) => leds_AXI(7 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
