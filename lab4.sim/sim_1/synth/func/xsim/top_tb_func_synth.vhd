-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Mon Mar  9 14:11:08 2020
-- Host        : JacobOffersen running 64-bit Ubuntu 19.10
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/jacoboffersen/advanced_programmable_electronics/lab4_2/lab4.sim/sim_1/synth/func/xsim/top_tb_func_synth.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity binary_counter is
  port (
    CLK : out STD_LOGIC;
    \^clk\ : in STD_LOGIC
  );
end binary_counter;

architecture STRUCTURE of binary_counter is
  signal \^clk_1\ : STD_LOGIC;
  signal \q[0]_i_2_n_0\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \q_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \q_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \q_reg_n_0_[0]\ : STD_LOGIC;
  signal \q_reg_n_0_[1]\ : STD_LOGIC;
  signal \q_reg_n_0_[2]\ : STD_LOGIC;
  signal \q_reg_n_0_[3]\ : STD_LOGIC;
  signal \q_reg_n_0_[4]\ : STD_LOGIC;
  signal \q_reg_n_0_[5]\ : STD_LOGIC;
  signal \q_reg_n_0_[6]\ : STD_LOGIC;
  signal \NLW_q_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  CLK <= \^clk_1\;
\q[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \q_reg_n_0_[0]\,
      O => \q[0]_i_2_n_0\
    );
\q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[0]_i_1_n_7\,
      Q => \q_reg_n_0_[0]\,
      R => '0'
    );
\q_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \q_reg[0]_i_1_n_0\,
      CO(2) => \q_reg[0]_i_1_n_1\,
      CO(1) => \q_reg[0]_i_1_n_2\,
      CO(0) => \q_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \q_reg[0]_i_1_n_4\,
      O(2) => \q_reg[0]_i_1_n_5\,
      O(1) => \q_reg[0]_i_1_n_6\,
      O(0) => \q_reg[0]_i_1_n_7\,
      S(3) => \q_reg_n_0_[3]\,
      S(2) => \q_reg_n_0_[2]\,
      S(1) => \q_reg_n_0_[1]\,
      S(0) => \q[0]_i_2_n_0\
    );
\q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[0]_i_1_n_6\,
      Q => \q_reg_n_0_[1]\,
      R => '0'
    );
\q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[0]_i_1_n_5\,
      Q => \q_reg_n_0_[2]\,
      R => '0'
    );
\q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[0]_i_1_n_4\,
      Q => \q_reg_n_0_[3]\,
      R => '0'
    );
\q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[4]_i_1_n_7\,
      Q => \q_reg_n_0_[4]\,
      R => '0'
    );
\q_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \q_reg[0]_i_1_n_0\,
      CO(3) => \NLW_q_reg[4]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \q_reg[4]_i_1_n_1\,
      CO(1) => \q_reg[4]_i_1_n_2\,
      CO(0) => \q_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \q_reg[4]_i_1_n_4\,
      O(2) => \q_reg[4]_i_1_n_5\,
      O(1) => \q_reg[4]_i_1_n_6\,
      O(0) => \q_reg[4]_i_1_n_7\,
      S(3) => \^clk_1\,
      S(2) => \q_reg_n_0_[6]\,
      S(1) => \q_reg_n_0_[5]\,
      S(0) => \q_reg_n_0_[4]\
    );
\q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[4]_i_1_n_6\,
      Q => \q_reg_n_0_[5]\,
      R => '0'
    );
\q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[4]_i_1_n_5\,
      Q => \q_reg_n_0_[6]\,
      R => '0'
    );
\q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      D => \q_reg[4]_i_1_n_4\,
      Q => \^clk_1\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_module_TE0277 is
  port (
    clk : out STD_LOGIC;
    clk_in_hw_IBUF : in STD_LOGIC
  );
end clock_module_TE0277;

architecture STRUCTURE of clock_module_TE0277 is
  signal CLKFBIN : STD_LOGIC;
  signal MMCME2_BASE_inst_n_10 : STD_LOGIC;
  signal MMCME2_BASE_inst_n_11 : STD_LOGIC;
  signal MMCME2_BASE_inst_n_12 : STD_LOGIC;
  signal MMCME2_BASE_inst_n_4 : STD_LOGIC;
  signal MMCME2_BASE_inst_n_6 : STD_LOGIC;
  signal MMCME2_BASE_inst_n_8 : STD_LOGIC;
  signal lock : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME2_BASE_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of MMCME2_BASE_inst : label is "MMCME2_BASE";
  attribute box_type : string;
  attribute box_type of MMCME2_BASE_inst : label is "PRIMITIVE";
begin
MMCME2_BASE_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 56.625000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 10.000000,
      CLKOUT0_DIVIDE_F => 3.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 2,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 4,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 10,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 20,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 40,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 100,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "INTERNAL",
      DIVCLK_DIVIDE => 8,
      REF_JITTER1 => 0.000000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => CLKFBIN,
      CLKFBOUT => CLKFBIN,
      CLKFBOUTB => NLW_MMCME2_BASE_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_MMCME2_BASE_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in_hw_IBUF,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_MMCME2_BASE_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk,
      CLKOUT0B => NLW_MMCME2_BASE_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => MMCME2_BASE_inst_n_4,
      CLKOUT1B => NLW_MMCME2_BASE_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => MMCME2_BASE_inst_n_6,
      CLKOUT2B => NLW_MMCME2_BASE_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => MMCME2_BASE_inst_n_8,
      CLKOUT3B => NLW_MMCME2_BASE_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => MMCME2_BASE_inst_n_10,
      CLKOUT5 => MMCME2_BASE_inst_n_11,
      CLKOUT6 => MMCME2_BASE_inst_n_12,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_MMCME2_BASE_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_MMCME2_BASE_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => lock,
      PSCLK => '0',
      PSDONE => NLW_MMCME2_BASE_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uart_tx is
  port (
    \state_reg[0]_0\ : out STD_LOGIC;
    tx_out_hw_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    running_reg_0 : in STD_LOGIC
  );
end uart_tx;

architecture STRUCTURE of uart_tx is
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal running_i_1_n_0 : STD_LOGIC;
  signal running_i_2_n_0 : STD_LOGIC;
  signal state : STD_LOGIC;
  signal \state[2]_i_1_n_0\ : STD_LOGIC;
  signal \^state_reg[0]_0\ : STD_LOGIC;
  signal \state_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \substate[0]_i_1_n_0\ : STD_LOGIC;
  signal \substate[1]_i_1_n_0\ : STD_LOGIC;
  signal \substate_reg_n_0_[0]\ : STD_LOGIC;
  signal \substate_reg_n_0_[1]\ : STD_LOGIC;
  signal tx_data : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal tx_data_snapshot : STD_LOGIC_VECTOR ( 1 to 7 );
  signal \tx_data_snapshot[1]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data_snapshot[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_snapshot[6]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_snapshot[7]_i_1_n_0\ : STD_LOGIC;
  signal tx_out_hw_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal tx_out_hw_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal tx_out_hw_OBUF_inst_i_4_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \state[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \state[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \state[4]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \substate[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \substate[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \tx_data_snapshot[1]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \tx_data_snapshot[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \tx_data_snapshot[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tx_data_snapshot[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \tx_data_snapshot[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tx_data_snapshot[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of tx_out_hw_OBUF_inst_i_3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of tx_out_hw_OBUF_inst_i_4 : label is "soft_lutpair6";
begin
  \state_reg[0]_0\ <= \^state_reg[0]_0\;
running_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFFFFFFFFFF"
    )
        port map (
      I0 => running_i_2_n_0,
      I1 => \state_reg__0\(2),
      I2 => \substate_reg_n_0_[0]\,
      I3 => \substate_reg_n_0_[1]\,
      I4 => \state_reg__0\(1),
      I5 => \state_reg__0\(0),
      O => running_i_1_n_0
    );
running_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state_reg__0\(3),
      I1 => \state_reg__0\(4),
      O => running_i_2_n_0
    );
running_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => running_i_1_n_0,
      Q => \^state_reg[0]_0\,
      R => '0'
    );
\state[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \state_reg__0\(1),
      I1 => \state_reg__0\(0),
      O => p_0_in(1)
    );
\state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \state_reg__0\(2),
      I1 => \state_reg__0\(0),
      I2 => \state_reg__0\(1),
      O => \state[2]_i_1_n_0\
    );
\state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \state_reg__0\(3),
      I1 => \state_reg__0\(1),
      I2 => \state_reg__0\(0),
      I3 => \state_reg__0\(2),
      O => p_0_in(3)
    );
\state[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^state_reg[0]_0\,
      I1 => \substate_reg_n_0_[0]\,
      I2 => \substate_reg_n_0_[1]\,
      O => state
    );
\state[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \state_reg__0\(4),
      I1 => \state_reg__0\(2),
      I2 => \state_reg__0\(0),
      I3 => \state_reg__0\(1),
      I4 => \state_reg__0\(3),
      O => p_0_in(4)
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => state,
      D => \p_0_in__0\(0),
      Q => \state_reg__0\(0),
      R => running_reg_0
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => state,
      D => p_0_in(1),
      Q => \state_reg__0\(1),
      R => running_reg_0
    );
\state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => state,
      D => \state[2]_i_1_n_0\,
      Q => \state_reg__0\(2),
      R => running_reg_0
    );
\state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => state,
      D => p_0_in(3),
      Q => \state_reg__0\(3),
      R => running_reg_0
    );
\state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => state,
      D => p_0_in(4),
      Q => \state_reg__0\(4),
      R => running_reg_0
    );
\substate[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \substate_reg_n_0_[0]\,
      I1 => \^state_reg[0]_0\,
      O => \substate[0]_i_1_n_0\
    );
\substate[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \substate_reg_n_0_[1]\,
      I1 => \substate_reg_n_0_[0]\,
      I2 => \^state_reg[0]_0\,
      O => \substate[1]_i_1_n_0\
    );
\substate_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \substate[0]_i_1_n_0\,
      Q => \substate_reg_n_0_[0]\,
      R => '0'
    );
\substate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \substate[1]_i_1_n_0\,
      Q => \substate_reg_n_0_[1]\,
      R => '0'
    );
\tx_data_snapshot[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(3),
      O => \tx_data_snapshot[1]_i_2_n_0\
    );
\tx_data_snapshot[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"017E"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(3),
      O => tx_data(5)
    );
\tx_data_snapshot[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5445"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      O => \tx_data_snapshot[3]_i_1_n_0\
    );
\tx_data_snapshot[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4012"
    )
        port map (
      I0 => Q(3),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      O => tx_data(3)
    );
\tx_data_snapshot[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4543"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      O => tx_data(2)
    );
\tx_data_snapshot[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(1),
      O => \tx_data_snapshot[6]_i_1_n_0\
    );
\tx_data_snapshot[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0141"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \tx_data_snapshot[7]_i_1_n_0\
    );
\tx_data_snapshot_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => \tx_data_snapshot[1]_i_2_n_0\,
      Q => tx_data_snapshot(1),
      R => '0'
    );
\tx_data_snapshot_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => tx_data(5),
      Q => tx_data_snapshot(2),
      R => '0'
    );
\tx_data_snapshot_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => \tx_data_snapshot[3]_i_1_n_0\,
      Q => tx_data_snapshot(3),
      R => '0'
    );
\tx_data_snapshot_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => tx_data(3),
      Q => tx_data_snapshot(4),
      R => '0'
    );
\tx_data_snapshot_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => tx_data(2),
      Q => tx_data_snapshot(5),
      R => '0'
    );
\tx_data_snapshot_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => \tx_data_snapshot[6]_i_1_n_0\,
      Q => tx_data_snapshot(6),
      R => '0'
    );
\tx_data_snapshot_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => running_reg_0,
      D => \tx_data_snapshot[7]_i_1_n_0\,
      Q => tx_data_snapshot(7),
      R => '0'
    );
tx_out_hw_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFCAAFAAAA0CCFC"
    )
        port map (
      I0 => tx_out_hw_OBUF_inst_i_2_n_0,
      I1 => tx_out_hw_OBUF_inst_i_3_n_0,
      I2 => \state_reg__0\(3),
      I3 => \state_reg__0\(4),
      I4 => tx_out_hw_OBUF_inst_i_4_n_0,
      I5 => \state_reg__0\(2),
      O => tx_out_hw_OBUF
    );
tx_out_hw_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FACF0ACFFAC00AC0"
    )
        port map (
      I0 => tx_data_snapshot(4),
      I1 => tx_data_snapshot(5),
      I2 => \state_reg__0\(1),
      I3 => \state_reg__0\(0),
      I4 => tx_data_snapshot(6),
      I5 => tx_data_snapshot(7),
      O => tx_out_hw_OBUF_inst_i_2_n_0
    );
tx_out_hw_OBUF_inst_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CB0BC808"
    )
        port map (
      I0 => tx_data_snapshot(1),
      I1 => \state_reg__0\(1),
      I2 => \state_reg__0\(0),
      I3 => tx_data_snapshot(2),
      I4 => tx_data_snapshot(3),
      O => tx_out_hw_OBUF_inst_i_3_n_0
    );
tx_out_hw_OBUF_inst_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state_reg__0\(1),
      I1 => \state_reg__0\(0),
      O => tx_out_hw_OBUF_inst_i_4_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_generator is
  port (
    CLK : out STD_LOGIC;
    clk_in_hw_IBUF : in STD_LOGIC
  );
end clock_generator;

architecture STRUCTURE of clock_generator is
  signal \^clk\ : STD_LOGIC;
begin
binary_counter0: entity work.binary_counter
     port map (
      CLK => CLK,
      \^clk\ => \^clk\
    );
clock_module_TE02770: entity work.clock_module_TE0277
     port map (
      clk => \^clk\,
      clk_in_hw_IBUF => clk_in_hw_IBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uart_module is
  port (
    \state_reg[0]\ : out STD_LOGIC;
    tx_out_hw_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    running_reg : in STD_LOGIC
  );
end uart_module;

architecture STRUCTURE of uart_module is
begin
uart_tx0: entity work.uart_tx
     port map (
      CLK => CLK,
      Q(3 downto 0) => Q(3 downto 0),
      running_reg_0 => running_reg,
      \state_reg[0]_0\ => \state_reg[0]\,
      tx_out_hw_OBUF => tx_out_hw_OBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    clk_in_hw : in STD_LOGIC;
    tx_out_hw : out STD_LOGIC;
    rx_in_hw : in STD_LOGIC;
    rx_data_hw : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
end top;

architecture STRUCTURE of top is
  signal CLK_IN : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal clk_in_hw_IBUF : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal tx_done : STD_LOGIC;
  signal \tx_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \tx_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_index_reg_n_0_[2]\ : STD_LOGIC;
  signal tx_out_hw_OBUF : STD_LOGIC;
  signal uart_module0_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \tx_index[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \tx_index[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \tx_index[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \tx_index[3]_i_1\ : label is "soft_lutpair7";
begin
clk_in_hw_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_in_hw,
      O => clk_in_hw_IBUF
    );
clock_generator0: entity work.clock_generator
     port map (
      CLK => CLK_IN,
      clk_in_hw_IBUF => clk_in_hw_IBUF
    );
\rx_data_hw_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(0)
    );
\rx_data_hw_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(1)
    );
\rx_data_hw_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(2)
    );
\rx_data_hw_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(3)
    );
\rx_data_hw_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(4)
    );
\rx_data_hw_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(5)
    );
\rx_data_hw_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(6)
    );
\rx_data_hw_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data_hw(7)
    );
\tx_data_snapshot_reg[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => uart_module0_n_0,
      O => tx_done
    );
\tx_index[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tx_index_reg_n_0_[0]\,
      O => \tx_index[0]_i_1_n_0\
    );
\tx_index[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tx_index_reg_n_0_[1]\,
      I1 => \tx_index_reg_n_0_[0]\,
      O => p_0_in(1)
    );
\tx_index[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \tx_index_reg_n_0_[2]\,
      I1 => \tx_index_reg_n_0_[0]\,
      I2 => \tx_index_reg_n_0_[1]\,
      O => \tx_index[2]_i_1_n_0\
    );
\tx_index[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \tx_index_reg_n_0_[1]\,
      I1 => \tx_index_reg_n_0_[0]\,
      I2 => \tx_index_reg_n_0_[2]\,
      O => p_0_in(3)
    );
\tx_index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tx_done,
      CE => '1',
      D => \tx_index[0]_i_1_n_0\,
      Q => \tx_index_reg_n_0_[0]\,
      R => clear
    );
\tx_index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tx_done,
      CE => '1',
      D => p_0_in(1),
      Q => \tx_index_reg_n_0_[1]\,
      R => clear
    );
\tx_index_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tx_done,
      CE => '1',
      D => \tx_index[2]_i_1_n_0\,
      Q => \tx_index_reg_n_0_[2]\,
      R => clear
    );
\tx_index_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => tx_done,
      CE => '1',
      D => p_0_in(3),
      Q => clear,
      R => clear
    );
tx_out_hw_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => tx_out_hw_OBUF,
      O => tx_out_hw
    );
uart_module0: entity work.uart_module
     port map (
      CLK => CLK_IN,
      Q(3) => clear,
      Q(2) => \tx_index_reg_n_0_[2]\,
      Q(1) => \tx_index_reg_n_0_[1]\,
      Q(0) => \tx_index_reg_n_0_[0]\,
      running_reg => tx_done,
      \state_reg[0]\ => uart_module0_n_0,
      tx_out_hw_OBUF => tx_out_hw_OBUF
    );
end STRUCTURE;
