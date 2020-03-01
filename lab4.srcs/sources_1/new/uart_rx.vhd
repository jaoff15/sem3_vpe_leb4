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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_rx is
    Generic ( N         : integer range 1 to 64 := 8); --bits
    Port    ( CLK_IN    : in STD_LOGIC;
              ENABLE_IN : in std_logic;
              rx_in     : in std_logic;
              rx_busy   : out std_logic := '0';
              rx_done   : out std_logic := '0';
              rx_data   : out std_logic_vector(N-1 downto 0)
              );
end uart_rx;

architecture Behavioral of uart_rx is
    
    
    signal state     : integer := 0; 
    signal substate  : integer := 0;
    
    signal data_temp : std_logic_vector(N-1 downto 0) := (others => '0');
    signal bit_temp  : std_logic := '0';
    
    
    signal rx_busy_signal : std_logic := '0';
    
    signal step_per_databit : integer := 4;
begin

rx_busy <= rx_busy_signal;
rx_done <= not rx_busy_signal;

-- Control states
process (RX_IN, CLK_IN)
begin -- process
    if ENABLE_IN = '1' then
        if state = N+1 and substate = step_per_databit-1 then
            rx_busy_signal <= '0';
        end if;
        
        if falling_edge(RX_IN) and rx_busy_signal = '0' then
            rx_busy_signal   <= '1';
            state           <= 0;
            substate        <= 0;
        end if;
        
            
        
        if rising_edge(CLK_IN) and rx_busy_signal = '1' then
            substate <= substate + 1;
            if substate = step_per_databit-1 then
                substate <= 0;
                state    <= state + 1;
            end if;
        end if;
    end if;
end process;

-- Decode data
process (CLK_IN, state, substate, rx_busy_signal)
begin
    if rising_edge(CLK_IN)  then
        if rx_busy_signal = '1' then
         -- if (not start bit) and (not stop bit) then 
            if state /= 0 and state < N+1 then
                if substate = step_per_databit / 2 then
                    bit_temp <= RX_IN;
                    if RX_IN = '1' then
                        data_temp(N - 1- (state -1)) <= '1';
                    end if;
                end if;
            end if; 
        end if;
    end if;
    if falling_edge(rx_busy_signal) then
            RX_data     <= data_temp;
            data_temp   <= (others => '0');
        end if;
end process;

end Behavioral;
