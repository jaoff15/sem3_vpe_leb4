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
architecture Behavioral of top_tb is

    signal clk : std_logic := '0';
    signal tx_start : std_logic := '0';  
    

    component top is
        Port ( CLK_IN  : in STD_LOGIC;
        tx_start : in std_logic := '0');
    end component;
begin

clk      <= not clk after 10ns;



stim_proc: process
begin
    tx_start <= '0';
    wait for 2000 ns;
    tx_start <= '1';
    
    wait;
end process;



top0:top 
port map(
    CLK_IN  => clk,
    tx_start => tx_start
);


end Behavioral;
