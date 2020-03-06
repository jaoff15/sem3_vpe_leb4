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
    Generic ( N         : integer range 0 to 64 :=  8); --bits
    Port    ( CLK_IN    : in STD_LOGIC;
              START_IN  : in std_logic := '0';
              ENABLE_IN : in std_logic;
              TX_DATA   : in std_logic_vector(N-1 downto 0);
              TX_DONE   : out std_logic := '0';
              TX_BUSY   : out std_logic := '0';
              TX_OUT    : out std_logic := '1');
end uart_tx;

architecture Behavioral of uart_tx is
--    unsigned(7 downto 0)  := (others => '0');
--    signal state    : integer := 0; 
--    signal substate : integer := 0;
--    signal step_per_databit : integer := 4;
    
    signal state    : integer := 0;
    signal substate : integer := 0;
    signal step_per_databit : integer := 4;
--    signal data_index : integer := 0;

    signal running : std_logic := '0';

    signal tx_data_snapshot : std_logic_vector(0 to N-1) := (others => '0');
begin

    

-- Control states
process (CLK_IN, ENABLE_IN, START_IN, running, tx_data)
begin -- process
    if ENABLE_IN = '1' then
        
        if START_IN = '1' and running = '0' then
            running  <= '1';
            TX_BUSY <= '1';
            tx_data_snapshot  <= TX_DATA;
            state    <= 0;
            substate <= 0;
        end if;
        
        if rising_edge(CLK_IN) and running = '1' then
            
            if state = N+1 and substate = step_per_databit-1 then
            -- TX finished
                running <= '0';
                TX_BUSY <= '0';    
                TX_DONE <= '1';
                
           elsif state = 0 and substate = 0 then
            -- TX starting    
              TX_DONE <= '0';
            end if;
            
            
            substate <= substate + 1;
            if substate = step_per_databit-1 then
                substate <= 0;
                state    <= state + 1;
            end if;
        end if;
    end if;
end process;

-- Control output
process (CLK_IN, state, substate)
begin
    if rising_edge(CLK_IN)  then
        if running = '1' then
            if state = N+1 and substate = step_per_databit-1 then
                -- Finished    
                TX_OUT <= '1';
            
            else
                -- Running
                if state = 0 then
                    -- Start bit
                    TX_OUT <= '0';
                elsif state < N+1 then
                   -- Data bits
                    TX_OUT <= tx_data_snapshot(state-1);        
                else
                    -- Stop bit
                    TX_OUT <= '1';
                end if;
            end if;
        else
            TX_OUT <= '1';
        end if;
    end if;
end process;

end Behavioral;
