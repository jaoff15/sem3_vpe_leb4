

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity top is
    Port ( clk_in   : in  STD_LOGIC;
           --tx_start : in  std_logic;
           tx_out   : out std_logic;
           rx_in    : in  std_logic;
           rx_data  : out std_logic_vector(7 downto 0));
end top;

architecture Behavioral of top is


    signal clk_signal    : std_logic := '0';

--    signal tx_out : std_logic;
    signal tx_done : std_logic;
    signal tx_busy : std_logic;
    signal tx_out_signal : std_logic;
    signal tx_data : std_logic_vector(7 downto 0) := "00000000";
    signal tx_start_signal : std_logic := '0';


--    signal rx_data : std_logic_vector(7 downto 0);
    signal rx_done_signal : std_logic;
    
--    signal tx_index         : integer := 0;
    signal tx_index : integer := 8;
    
    signal tx_routing : std_logic;

        
    component uart_module is
        Generic ( N         : integer range 0 to 64 :=  8); --bits
        Port    ( CLK_IN    : in STD_LOGIC;
                  ENABLE_IN : in std_logic;
                  TX_DATA   : in std_logic_vector(N-1 downto 0);
                  TX_START  : in std_logic;
                  TX_OUT    : out std_logic;
                  tx_done   : out std_logic;
                  TX_BUSY   : out std_logic;
                  RX_IN     : in std_logic;
                  rx_done   : out std_logic;
                  rx_data   : out std_logic_vector(N-1 downto 0)
--                  ;
--                  RX        : out STD_LOGIC_VECTOR (N-1 downto 0)
);
    end component;
    
    component clock_generator is
    Port ( CLK_IN  : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
    end component;
    
begin

             
-- Control output
process (CLK_IN, rx_done_signal, tx_index)
begin
    if rising_edge(rx_done_signal) then
       if tx_index < 8 then
           tx_index <= tx_index + 1;
       else 
            tx_index <= 0;
       end if;
    end if;
end process;


-- Dec: 87 104 97 116 116 117 112  92 110  
-- Hex: 57  68 61  74  74  75  70  5C  6E
with tx_index select
   tx_data <= "01010111" when 0,    -- W
              "01101000" when 1,    -- H
              "01100001" when 2,    -- A
              "01110100" when 3,    -- T
              "01110100" when 4,    -- T
              "01110101" when 5,    -- U
              "01110000" when 6,    -- P
              "01011100" when 7,    -- \
              "01101110" when 8,    -- n
              "00000000" when others;

uart_module0:uart_module 
generic map( N => 8 )
port map(
    CLK_IN      => clk_signal,  
    ENABLE_IN   => '1',
    TX_OUT      => tx_out,
--    TX_OUT      => tx_routing,
    TX_START    => '1',
    TX_DATA     => tx_data,
    tx_done     => tx_done,
    tx_busy     => tx_busy,
    RX_IN       => rx_in,
--    RX_IN       => tx_routing,
    rx_done     => rx_done_signal,
    rx_data     => rx_data
);

clock_generator0:clock_generator 
port map(
    CLK_IN  => CLK_IN,   -- 100 MHz
    CLK_OUT => clk_signal
);


end Behavioral;
