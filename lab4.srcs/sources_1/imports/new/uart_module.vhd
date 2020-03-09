----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 03:52:06 PM
-- Design Name: 
-- Module Name: uart_module - Behavioral
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


entity uart_module is
    Generic ( N         : integer range 0 to 8 :=  8); --bits
    Port    ( CLK_IN    : in  STD_LOGIC := '0';
              ENABLE_IN : in  std_logic := '0';
              TX_START  : in  std_logic := '0';
              TX_OUT    : out std_logic := '0';
              TX_DONE   : out std_logic := '0';
              TX_BUSY   : out std_logic := '0';
              RX_IN     : in  std_logic := '0';
              RX_done   : out std_logic := '0';
              TX_DATA   : in  std_logic_vector(N-1 downto 0) := (others => '0');
              rx_data   : out std_logic_vector(N-1 downto 0) := (others => '0')
              );
end uart_module;

architecture Behavioral of uart_module is
    
--    signal clk_tx : std_logic;
--    signal clk_rx : std_logic;
    
    component uart_tx is
        Port    ( CLK_IN    : in  STD_LOGIC := '0';
                  ENABLE_IN : in  std_logic := '0';
                  START_IN  : in  std_logic := '0';
                  TX_BUSY   : out std_logic := '0';
                  TX_OUT    : out std_logic := '0';
                  TX_DONE   : out std_logic := '0';
                  TX_DATA   : in std_logic_vector(7 downto 0) := (others => '0')
                  );
    end component;

    component uart_rx is
        Port    ( CLK_IN    : in  STD_LOGIC := '0';
                  ENABLE_IN : in  std_logic := '0';
                  rx_in     : in  std_logic := '0';
                  rx_busy   : out std_logic := '0';
                  RX_done   : out std_logic := '0';
                  rx_data   : out std_logic_vector(7 downto 0) := (others => '0')
                  );
    end component;
begin
----TX_OUT <= CLK_IN;
--clk_tx <= CLK_IN;
--clk_rx <= CLK_IN;

--rx_data(0) <= CLK_IN;
--rx_data(1) <= RX_IN;


uart_tx0:uart_tx 
--generic map( N          => 8)
port map(    CLK_IN     => CLK_IN,
             ENABLE_IN  => enable_in,
             START_IN   => TX_START,
             TX_DATA    => TX_DATA,
             TX_OUT     => TX_OUT,
             tx_done    => tx_done,
             tx_busy    => tx_busy
);


uart_rx0:uart_rx 
--generic map( N         => 8)
port map(    CLK_IN    => CLK_IN,
             ENABLE_IN => enable_in,
             rx_in     => rx_in,
             rx_done   => RX_done,
             rx_data   => rx_data
);


end Behavioral;
