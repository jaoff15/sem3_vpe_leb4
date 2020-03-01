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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_module is
    Generic ( N         : integer range 1   to 64   := 8); --bits
    Port    ( CLK_IN    : in STD_LOGIC;
              ENABLE_IN : in std_logic;
              TX_DATA   : in std_logic_vector(N-1 downto 0);
              TX_START  : in std_logic;
              TX_OUT    : out std_logic;
              TX_DONE   : out std_logic;
              TX_BUSY   : out std_logic;
              RX_IN     : in std_logic;
              RX_done   : out std_logic
           
--              ;
--              RX        : out STD_LOGIC_VECTOR (N-1 downto 0)
              );
end uart_module;

architecture Behavioral of uart_module is
    
--    signal start : std_logic := '0';
    
    component uart_tx is
        Generic ( N         : integer range 1 to 64 := 8); --bits
        Port    ( CLK_IN    : in STD_LOGIC;
                  ENABLE_IN : in std_logic;
                  START_IN  : in std_logic;
                  TX_DATA   : in std_logic_vector(N-1 downto 0);
                  TX_BUSY   : out std_logic := '0';
                  TX_OUT    : out std_logic;
                  TX_DONE    : out std_logic);
    end component;

    component uart_rx is
        Generic ( N         : integer range 1 to 64 := 8); --bits
        Port    ( CLK_IN    : in STD_LOGIC;
                  ENABLE_IN : in std_logic;
                  rx_in     : in std_logic;
                  rx_busy   : out std_logic;
                  RX_done   : out std_logic;
                  rx_data   : out std_logic_vector(N-1 downto 0)
                  );
    end component;
begin

uart_tx0:uart_tx 
generic map( N          => 8)
port map(    CLK_IN     => CLK_IN,
             ENABLE_IN  => '1',
             START_IN   => TX_START,
             TX_DATA    => TX_DATA,
             TX_OUT     => TX_OUT,
             tx_done    => tx_done,
             tx_busy    => tx_busy
);


uart_rx0:uart_rx 
generic map( N         => 8)
port map(    CLK_IN    => CLK_IN,
             ENABLE_IN => '1',
             rx_in     => rx_in,
             rx_done   => RX_done
--             ,
--             rx_data   => rx_data
--             ,
--             rx_busy   => rx_busy
);


end Behavioral;
