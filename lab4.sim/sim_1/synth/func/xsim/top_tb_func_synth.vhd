-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Mar  6 13:29:20 2020
-- Host        : JacobOffersen running 64-bit Ubuntu 19.10
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/jacoboffersen/advanced_programmable_electronics/sem3_vpe_leb4/lab4.sim/sim_1/synth/func/xsim/top_tb_func_synth.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_module_TE0277 is
  port (
    clk_in_IBUF : in STD_LOGIC
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
  signal clk : STD_LOGIC;
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
      CLKIN1 => clk_in_IBUF,
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
entity clock_generator is
  port (
    clk_in_IBUF : in STD_LOGIC
  );
end clock_generator;

architecture STRUCTURE of clock_generator is
begin
clock_module_TE02770: entity work.clock_module_TE0277
     port map (
      clk_in_IBUF => clk_in_IBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    clk_in : in STD_LOGIC;
    tx_start : in STD_LOGIC;
    tx_out : out STD_LOGIC;
    rx_in : in STD_LOGIC;
    rx_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
end top;

architecture STRUCTURE of top is
  signal clk_in_IBUF : STD_LOGIC;
begin
clk_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_in,
      O => clk_in_IBUF
    );
clock_generator0: entity work.clock_generator
     port map (
      clk_in_IBUF => clk_in_IBUF
    );
\rx_data_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(0)
    );
\rx_data_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(1)
    );
\rx_data_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(2)
    );
\rx_data_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(3)
    );
\rx_data_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(4)
    );
\rx_data_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(5)
    );
\rx_data_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(6)
    );
\rx_data_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => rx_data(7)
    );
tx_out_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => tx_out,
      T => '1'
    );
end STRUCTURE;
