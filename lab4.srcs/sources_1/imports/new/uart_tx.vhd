----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 03:52:06 PM
-- Design Name: 
-- Module Name: uart_tx - Behavioral
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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tx is
    --Generic ( N         : integer range 0 to 8 :=  8); --bits
    Port    ( CLK_IN    : in  STD_LOGIC := '0';
              START_IN  : in  std_logic := '0';
              ENABLE_IN : in  std_logic := '0';
              TX_DATA   : in  std_logic_vector(7 downto 0) := (others => '0');
              TX_DONE   : out std_logic := '0';
              TX_BUSY   : out std_logic := '0';
              TX_OUT    : out std_logic := '1');
end uart_tx;

architecture Behavioral of uart_tx is

    
    signal state            : integer range 0 to 20 := 9;
    signal substate         : integer range 0 to 3 := 0;
    
    signal tx_out_signal    : std_logic := '1';
    
    signal running          : std_logic := '0';
    

--    signal tx_data_snapshot : std_logic_vector(0 to 7) := (others => '0');
    signal tx_data_snapshot : std_logic_vector(7 downto 0) := (others => '0');

    
begin

TX_BUSY <= running;
TX_DONE <=  not running;


TX_OUT <= tx_out_signal;
--TX_OUT <= CLK_IN;


process (CLK_IN) 
begin
    if rising_edge(CLK_IN) then
        if START_IN = '1' and running = '0' then
            tx_data_snapshot  <= TX_DATA;
--        else
--            tx_data_snapshot <= tx_data_snapshot;
        end if;
    end if;
end process;

process (CLK_IN) 
begin
  if rising_edge(clk_in) then
    if state = 9 and substate = 2 then
        running <= '0';
    elsif START_IN = '1' and running = '0' then
        running <= '1';
    end if;
  end if;
end process;

process (CLK_IN) 
begin
  if rising_edge(clk_in) then
      if running = '1' then
        substate <= substate + 1;
        if substate = 3 then
            substate <= 0;
            state    <= state + 1;
        end if;
      elsif START_IN = '1' and running = '0' then
        state    <= 0;
        substate <= 0;
      end if;
  end if;
end process;


with state select
   tx_out_signal <= '0'                         when 0,
                    '1'                         when 9,
                    '1'                         when 10,
                    tx_data_snapshot(state-1)   when others;
                    



end Behavioral;
