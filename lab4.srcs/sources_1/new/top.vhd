----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 03:52:06 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK_IN : in STD_LOGIC;
            tx_start : in std_logic);
end top;

architecture Behavioral of top is


    signal clk    : std_logic;

    signal tx_out : std_logic;
    signal tx_done : std_logic;
    signal tx_busy : std_logic;
    signal tx_data : std_logic_vector(7 downto 0) := "00000000";
    signal tx_start_signal : std_logic := '0';
    signal tx_index : integer := 0;

    signal rx : std_logic_vector(7 downto 0);
    
    
        
    component uart_module is
        Generic ( N         : integer range 1   to 64   := 8); --bits
        Port    ( CLK_IN    : in STD_LOGIC;
                  ENABLE_IN : in std_logic;
                  TX_DATA   : in std_logic_vector(N-1 downto 0);
                  TX_START  : in std_logic;
                  TX_OUT    : out std_logic;
                  tx_done   : out std_logic;
                  TX_BUSY   : out std_logic;
                  RX        : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;
    
    component clock_generator is
    Port ( CLK_IN  : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
    end component;
    
begin


-- Control output
process (CLK_IN)
begin
    if tx_busy = '0' then
       tx_index <= tx_index + 1;
       tx_start_signal <= '1';
    else
        tx_start_signal <= '0';
    end if;
end process;

-- Dec: 87 104 97 116 116 117 112
-- Hex: 57  68 61  74  74  75  70
with tx_index select
   tx_data <= "01010111" when 0,    -- W
              "01101000" when 1,    -- H
              "01100001" when 2,    -- A
              "01110100" when 3,    -- T
              "01110100" when 4,    -- T
              "01110101" when 5,    -- U
              "01110000" when 6,    -- P
              "00000000" when others;
              


uart_module0:uart_module 
generic map( N => 8)
port map(
    CLK_IN  => clk,  
    ENABLE_IN => '1',
    TX_OUT => tx_out,
    TX_START => tx_start_signal,
    TX_DATA => tx_data,
    tx_done => tx_done,
    tx_busy => tx_busy,
    RX => rx
);

clock_generator0:clock_generator 
port map(
    CLK_IN  => CLK_IN,  -- 100 MHz
    CLK_OUT => clk      -- 12 MHz
);


end Behavioral;
