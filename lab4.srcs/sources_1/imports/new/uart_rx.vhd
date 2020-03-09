----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 03:52:06 PM
-- Design Name: 
-- Module Name: uart_rx - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity uart_rx is
    Port    ( CLK_IN    : in  STD_LOGIC := '0';
              ENABLE_IN : in  std_logic := '0';
              rx_in     : in  std_logic := '0';
              rx_busy   : out std_logic := '0';
              rx_done   : out std_logic := '0';
              rx_data   : out std_logic_vector(7 downto 0)
              );
end uart_rx;

architecture Behavioral of uart_rx is

    signal clk              : std_logic := '0';
    
    signal state            : integer range 0 to 10 := 0 ;

    signal rx_in_signal     : std_logic := '0';
    signal rx_in_last       : std_logic := '0';
        
    signal substate         : integer range 0 to 10 := 0;

--    signal data_temp : std_logic_vector(7 downto 0) := (others => '0');
    signal data_temp        : std_logic_vector(0 to 7) := (others => '0');
    signal rx_data_out      : std_logic_vector(7 downto 0) := (others => '0');
    signal rx_busy_signal   : std_logic := '0';
   

begin

rx_busy         <= rx_busy_signal;
rx_done         <= not rx_busy_signal;

rx_in_signal    <= RX_IN;
rx_data         <= rx_data_out;

process (CLK_IN)
begin -- process
    if rising_edge(CLK_IN) then
        rx_in_last <= rx_in_signal;
    end if;
end process;


process (CLK_IN)
begin -- process
    if rising_edge(CLK_IN) then
        if rx_busy_signal = '1' then 
            if state /= 0 and state < 9 then 
                if substate = 2 then
                    data_temp(8 - state) <= rx_in_signal;
                end if;
            end if; 
        end if;
    end if;
end process;

process (rx_busy_signal) 
begin
    if falling_edge(rx_busy_signal) then
            rx_data_out <= data_temp;
    end if;
end process;


process (CLK_IN, rx_busy_signal) 
begin
    if rising_edge(CLK_IN) then
        if rx_in_last = '1' and rx_in_signal = '0' then
            rx_busy_signal <= '1';
        elsif rx_busy_signal = '1' then
            if state = 9 and substate = 1 then
               rx_busy_signal <= '0';
            end if;
        end if;
    end if;
end process;



process (CLK_IN) 
begin
    if rising_edge(CLK_IN) then
        if rx_busy_signal = '1' then
            substate <= substate + 1;
            if substate = 3 then
                substate <= 0;
                state    <= state + 1;
            end if;
        else
            state           <= 0;
            substate        <= 0;
        end if;   
    end if;
end process;


end Behavioral;


