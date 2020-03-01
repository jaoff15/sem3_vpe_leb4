----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 04:19:25 PM
-- Design Name: 
-- Module Name: clock_generator - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_generator is
    Port ( CLK_IN  : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end clock_generator;

architecture Behavioral of clock_generator is
    
    
    
    signal clk          : std_logic;
    signal counter_out  : std_logic_vector(4 downto 0);
    
    component clock_module_TE0277 is
    Generic (   M :real             range 2.0 to 64.0  := 10.0;
                D :integer          range 1   to 106   := 1;
                O :real             range 1.0 to 128.0 := 1.0;
                CLK_IN_PERIOD :real range 2.0 to 64.0  := 7.5);
        port (  XCLK_I       : in STD_LOGIC;
                RESET_I      : in STD_LOGIC; 
                ENABLE_I     : in STD_LOGIC;
                CLK_1000_O   : out STD_LOGIC;
                CLK_500_O    : out STD_LOGIC;
                CLK_250_O    : out STD_LOGIC;
                CLK_100_O    : out STD_LOGIC;
                CLK_50_O     : out STD_LOGIC; 
                CLK_25_O     : out STD_LOGIC; 
                CLK_10_O     : out STD_LOGIC  
               );
    end component;
    
    component binary_counter is
        Generic (N       : integer := 4); -- Number of bits in counter
        Port (   RESET_I : in STD_LOGIC;
                 CLK_I   : in STD_LOGIC;
                 Q_O     : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;

begin


clock_module_TE02770:clock_module_TE0277 
generic map( CLK_IN_PERIOD => 10.0,
             M => 7.68,
             O => 1.0,
             D => 1)
port map(
    XCLK_I  => CLK_IN,
    RESET_I => '0',
    ENABLE_I => '1',
    CLK_1000_O => clk
);

binary_counter0: binary_counter 
generic map( N        => 5)
port map(    CLK_I    => clk,
             RESET_I  => '0',
             Q_O      => counter_out
);

CLK_OUT <= counter_out(4);

end Behavioral;
