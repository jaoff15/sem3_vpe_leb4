

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity top is
    Port ( clk_in_hw        : in  STD_LOGIC := '0';
       tx_out_hw            : out std_logic := '0';
       rx_in_hw             : in  std_logic := '0';
       tx_active            : in  std_logic := '0';
       segment_out          : out std_logic_vector(7 downto 0) := (others => '0');
       rx_data_hw           : out std_logic_vector(7 downto 0) := (others => '0'));
end top;

architecture Behavioral of top is


    signal rx_data_out      : std_logic_vector(7 downto 0);

    signal clk_signal       : std_logic := '0';


    signal tx_done          : std_logic := '0';
    signal tx_busy          : std_logic := '0';
    signal tx_out_signal    : std_logic := '0';
    signal tx_start_signal  : std_logic := '0';
    signal tx_data          : std_logic_vector(7 downto 0) := (others => '0');


    signal rx_done_signal   : std_logic;
    

    signal tx_index         : integer range 0 to 10 := 0;
    

  
  signal tx_start_in        : std_logic := '1';
  signal tx_start_counter   : std_logic_vector(24 downto 0) := (others => '0');

        
    component uart_module is
        Port    ( CLK_IN    : in  STD_LOGIC := '0';
                  ENABLE_IN : in  std_logic := '0';
                  TX_START  : in  std_logic := '0';
                  TX_OUT    : out std_logic := '0';
                  tx_done   : out std_logic := '0';
                  TX_BUSY   : out std_logic := '0';
                  RX_IN     : in  std_logic := '0';
                  rx_done   : out std_logic := '0';
                  TX_DATA   : in  std_logic_vector(7 downto 0) := (others => '0');
                  rx_data   : out std_logic_vector(7 downto 0) := (others => '0'));
    end component;
    
    component clock_generator is
    Port ( CLK_IN  : in STD_LOGIC  := '0';
           CLK_OUT : out STD_LOGIC := '0');
    end component;
    
begin



rx_data_hw <= rx_data_out;

with rx_data_out select
   segment_out <= not("11101110") when "00110000", --0
                  not("00101000") when "00110001", --1
                  not("11001101") when "00110010", --2
                  not("01101101") when "00110011", --3
                  not("00101011") when "00110100", --4
                  not("01100111") when "00110101", --5
                  not("11100111") when "00110110", --6
                  not("00101100") when "00110111", --7
                  not("11101111") when "00111000", --8
                  not("00101111") when "00111001", --9
                  not("00000000") when others;


             
-- Control output
process (tx_done)
begin
    if rising_edge(tx_done) and tx_active = '1' then
       if tx_index < 8 then
       --     tx_start_in <= '1';
            tx_index <= tx_index + 1;
       else 
           tx_index <= 0;
--            tx_start_in <= '0';
       end if;
    end if;
end process;



-- Dec: 87 104 97 116 116 117 112  92 110  
-- Hex: 57  68 61  74  74  75  70  5C  6E
with tx_index select
   tx_data <= "01010111" when 0,    -- W
              "01101000" when 1,    -- h
              "01100001" when 2,    -- a
              "01110100" when 3,    -- t
              "01110100" when 4,    -- t
              "01110101" when 5,    -- u
              "01110000" when 6,    -- p
              "00001010" when 7,    -- linefeed
              "00001101" when 8,    -- carrage return
              "00000000" when others;


uart_module0:uart_module 
port map(
    CLK_IN      => clk_signal,  
    ENABLE_IN   => '1',
    TX_OUT      => tx_out_hw,
    TX_START    => tx_active,
    TX_DATA     => tx_data,
    tx_done     => tx_done,
    tx_busy     => tx_busy,
    RX_IN       => rx_in_hw,
    rx_done     => rx_done_signal,
    rx_data     => rx_data_out
);

clock_generator0:clock_generator 
port map(
    CLK_IN  => CLK_IN_hw,   -- 100 MHz
    CLK_OUT => clk_signal
);


end Behavioral;
