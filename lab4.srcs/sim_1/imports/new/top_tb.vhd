----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 04:35:10 PM
-- Design Name: 
-- Module Name: top_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_tb is

end top_tb;
architecture Testbench of top_tb is

    signal clk      : std_logic := '0';
    signal tx_start : std_logic := '0';  
    signal tx_out   : std_logic;
    signal rx_in    : std_logic;
    signal rx_data  : std_logic_vector(7 downto 0);
    

    component top is
    Port ( clk_in_hw   : in  STD_LOGIC := '0';
           --tx_start : in  std_logic;
           tx_out_hw   : out std_logic := '0';
           rx_in_hw    : in  std_logic := '0';
           tx_active   : in  std_logic := '0';
           rx_data_hw  : out std_logic_vector(7 downto 0) := (others => '0'));
    end component;
begin

clk      <= not clk after 5ns;




stim_proc: process
begin
    tx_start <= '0';
    wait for 2000 ns;
    tx_start <= '1';
--    wait for 5000 ns;
--    tx_start <= '0';
    wait;
end process;



 rx_in <= tx_out;



U1:top 
port map(
    CLK_IN_hw   => clk,
    tx_active => tx_start,
    tx_out_hw   => tx_out,
    rx_in_hw    => rx_in,
    rx_data_hw  => rx_data
);


end Testbench;
