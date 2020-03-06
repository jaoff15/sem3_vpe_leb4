-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Mar  6 13:28:17 2020
-- Host        : JacobOffersen running 64-bit Ubuntu 19.10
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/jacoboffersen/advanced_programmable_electronics/sem3_vpe_leb4/lab4.sim/sim_1/impl/func/xsim/top_tb_func_impl.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
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
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top : entity is "c2ee90b2";
end top;

architecture STRUCTURE of top is
begin
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
tx_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => tx_out
    );
end STRUCTURE;
