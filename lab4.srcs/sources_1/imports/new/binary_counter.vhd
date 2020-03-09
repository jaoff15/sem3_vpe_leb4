library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity binary_counter is
    Generic (N       : integer := 4); -- Number of bits in counter
    Port (   RESET_I : in STD_LOGIC;
             CLK_I   : in STD_LOGIC;
             Q_O     : out STD_LOGIC_VECTOR (N-1 downto 0));
end binary_counter;

architecture Behavioral of binary_counter is
    signal q : std_logic_vector(N-1 downto 0) := (others => '0');
begin
    Q_O <= q;
    process (CLK_I,RESET_I)
    begin -- process
        if RESET_I = '1' then
            q <= (others => '0');
        elsif rising_edge(CLK_I) then
            q <= q + 1;
        end if;
    end process;


end Behavioral;