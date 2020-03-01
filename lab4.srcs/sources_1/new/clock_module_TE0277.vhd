
-- Description:     A module that produce a selection of clock signals (10 MHz to 1GHz)
--                  based on the input of one single external clock,
--                  using one of the 2 integrated MMCM devices in the FPGA.
--                  Note that the clock input 'XCLK_I' should be assigned to a pin
--                  with 'clock input' capabilities, such as N11 (P2/5 on TE0722)
--                  If a suitable external clock is not available, a crystal
--                  2 resistors and 2 capacitors can be placed with the
--                  XTAL_O, XCLK_I and GND pins, to allow an FPGA inverter - integral in this module -
--                  to form a fundamental frequency oscillator with the external components.
--                  _NOTE!_ Using the FPGA to drive a crystal is not a recommended design practice,
--                  but can be allowed for convenience in simple and short lived experiments.
--                  The resulting oscillator does not have the accuracy, nor the stability of
--                  professional oscillators. Especially not if implemented in a breadboard with unknown
--                  parasitic components and noise sources.
--                  The module wait 13ms from oscillation starts, before it assert the 'STABLE_O' signal.
--                  Please keep all clock dependent modules reset until 'STABLE_O' is asserted.
--                  If the input clock frequency is lost or become unstable, 'STABLE_O' will become
--                  un-asserted until the clock has been stable for another 13ms.
--                  If this module is used to drive a crystal, MAKE SURE to configure the XTAL_O
--                  output buffer for 4mA drive current.
--                  _REMEMBER_ to:
--                  - Set the generic: CLK_IN_PERIOD to reflect the input clock signal
--                  - Insert a timing constraint into your constraint file:
--                      create_clock -period 25.000 [get_ports CLK40_I] # example for 40MHz
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
library UNISIM; -- Contain the MMCM primitive used to instantiate the MMCM
use UNISIM.VComponents.all; 

entity clock_module_TE0277 is
Generic (M :real             range 2.0 to 64.0  := 40.0;
         D :integer          range 1   to 106   := 1;
         O :real             range 1.0 to 128.0 := 1.0;
         CLK_IN_PERIOD :real range 2.0 to 64.0  := 10.0);-- Period of input clock in ns
                                                         -- Default: 40ns <-> 25MHz
                                                         -- Set to:  41.6667 <-> 24MHz
                                                         --          62.5 <-> 16MHz
                                                         --          etc. etc. etc.
    
                                                     
Port (  XCLK_I : in STD_LOGIC;      -- Provide an external 16..500MHz clock here
        XTAL_O : out STD_LOGIC;     -- This may be used to drive a crystal (not recommended)
        RESET_I : in STD_LOGIC;     -- This will reset this module (may be connected to '0')
        ENABLE_I : in STD_LOGIC;    -- This enable this module (may be connected to '1')
        CLK_1000_O : out STD_LOGIC; -- This provide a 1GHz clock
        CLK_500_O : out STD_LOGIC;  -- This provide a 500MHz clock
        CLK_250_O : out STD_LOGIC;  -- This provide a 250MHz clock
        CLK_100_O : out STD_LOGIC;  -- This provide a 100MHz clock
        CLK_50_O : out STD_LOGIC;   -- This provide a 50MHz clock
        CLK_25_O : out STD_LOGIC;   -- This provide a 25MHz clock
        CLK_10_O : out STD_LOGIC;   -- This provide a 10MHz clock
        STABLE_O : out STD_LOGIC    -- This is asserted when clock has been stable for 13 ms
                                    -- Use it to drive RESET for modules that receive clock(s)
                                    -- from this module.
       );
end clock_module_TE0277;

architecture rtl of clock_module_TE0277 is
    signal clk_feedback : std_logic;    -- Used for clock manager feedback in this module
    signal pwr_down: std_logic;         -- Used to control clock manager power down feature
    signal clk_10 : std_logic;          -- The 10MHz clock is used for a timer inside this module
    signal lock : std_logic;            -- Used to check if the clock manager has locked on to external clock
                                        -- For monitoring 'lock' time
    signal cnt : std_logic_vector(16 downto 0); -- 17 bit counter -> 13ms @ 10MHz
    --signal stable : std_logic;

begin
XTAL_O <= not XCLK_I;

-- This inverter change the XCLK signal -180 degrees. If it is routed to an
--output pin and connected back to the XCLK input through a network that
--also provide -180 deg phase shift, oscillation will occur. A quartz crystal
--provide -180 phase shift at it's resonant frequency, and can be used with
--2 resitors and 2 capacitors to, to create a series mode crystal oscillator
--with the inverter. Refer to the accompanying SDU application note or
--<Fairchild Semiconductors AN-340> for design guidance.
--While popular in the 80'ies and 90'ies, this osc type is no longer recommended
--This method is applicable for simple experiments that do not require accuracy,
--quality or stability of the oscillator. Please use an oscillator IC like:
--ACHL-25.000MHZ (https://abracon.com/Oscillators/ACHL.pdf) whenever possible.


pwr_down <= not ENABLE_I; -- If 'ENABLE_I' is un-asserted, assert 'power down' for MMCM
CLK_10_O <= clk_10;


-- STABLE_O <= stable;
-- Here, we connect signals to one of the hardware clock managers that reside in the Zynq FPGA
-- We do that, by calling on the MMCM2_BASE 'primitive' that is provided by Xilinx in the
-- UNISIM library (see Xilinx UG953). We set up the clock manager to:
-- - Create a 1GHz clock by multiplying the xternal clock
-- - Produce 6 lower frequency clocks, by dividing the 1GHz clock


MMCME2_BASE_inst : MMCME2_BASE
generic map (
BANDWIDTH => "OPTIMIZED",           -- Jitter programming (OPTIMIZED, HIGH, LOW)
--CLKFBOUT_MULT_F => CLK_IN_PERIOD, -- Multiply value for all CLKOUT (2.000-64.000).
CLKFBOUT_MULT_F => M,           -- Multiply value for all CLKOUT (2.000-64.000).
CLKFBOUT_PHASE => 0.0,              -- Phase offset in degrees of CLKFB (-360.000-360.000).
CLKIN1_PERIOD => CLK_IN_PERIOD,     -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
                                    -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
CLKOUT1_DIVIDE => 2,        -- 500 MHz
CLKOUT2_DIVIDE => 4,        -- 250 MHz
CLKOUT3_DIVIDE => 10,       -- 100 MHz
CLKOUT4_DIVIDE => 20,       -- 50 MHz
CLKOUT5_DIVIDE => 40,       -- 25 MHz
CLKOUT6_DIVIDE => 100,      -- 10 MHz
CLKOUT0_DIVIDE_F => O,    -- 1 GHz -- Divide amount for CLKOUT0 (1.000-128.000).



CLKOUT0_DUTY_CYCLE => 0.5,  -- Duty cycle (0.01-0.99)
CLKOUT1_DUTY_CYCLE => 0.5,  -- Duty cycle
CLKOUT2_DUTY_CYCLE => 0.5,  -- Duty cycle
CLKOUT3_DUTY_CYCLE => 0.5,  -- Duty cycle
CLKOUT4_DUTY_CYCLE => 0.5,  -- Duty cycle
CLKOUT5_DUTY_CYCLE => 0.5,  -- Duty cycle
CLKOUT6_DUTY_CYCLE => 0.5,  -- Duty cycle
-- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
CLKOUT0_PHASE => 0.0,   -- Phase offset for (-360.000-360.000).
CLKOUT1_PHASE => 0.0,   -- Phase offset for (-360.000-360.000).
CLKOUT2_PHASE => 0.0,   -- Phase offset for (-360.000-360.000).
CLKOUT3_PHASE => 0.0,   -- Phase offset for (-360.000-360.000).
CLKOUT4_PHASE => 0.0,   -- Phase offset for (-360.000-360.000).
CLKOUT5_PHASE => 0.0,   -- Phase offset for (-360.000-360.000).
CLKOUT6_PHASE => 0.0, 
  -- Phase offset for (-360.000-360.000).
CLKOUT4_CASCADE => FALSE, -- Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
--DIVCLK_DIVIDE => 1,     -- Master division value (1-106)
DIVCLK_DIVIDE => D,     -- Master division value (1-106)
REF_JITTER1 => 0.0,     -- Reference input jitter in UI (0.000-0.999).
STARTUP_WAIT => FALSE   -- Delays DONE until MMCM is locked (FALSE, TRUE)
)
port map (
-- Clock Outputs: 1-bit (each) output: User configurable clock outputs
CLKOUT0 => CLK_1000_O,  -- 1-bit output: CLKOUT0
--CLKOUT0B => CLKOUT0B, -- 1-bit output: Inverted CLKOUT0
CLKOUT1 => CLK_500_O,   -- 1-bit output: CLKOUT1
--CLKOUT1B => CLKOUT1B, -- 1-bit output: Inverted CLKOUT1
CLKOUT2 => CLK_250_O,   -- 1-bit output: CLKOUT2
--CLKOUT2B => CLKOUT2B, -- 1-bit output: Inverted CLKOUT2
CLKOUT3 => CLK_100_O,   -- 1-bit output: CLKOUT3
--CLKOUT3B => CLKOUT3B, -- 1-bit output: Inverted CLKOUT3
CLKOUT4 => CLK_50_O,    -- 1-bit output: CLKOUT4
CLKOUT5 => CLK_25_O,    -- 1-bit output: CLKOUT5
CLKOUT6 => clk_10,      -- 1-bit output: CLKOUT6
                        -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
CLKFBOUT => clk_feedback, -- 1-bit output: Feedback clock
--CLKFBOUTB => CLKFBOUTB, -- 1-bit output: Inverted CLKFBOUT
                        -- Status Ports: 1-bit (each) output: MMCM status ports
LOCKED => lock,         -- 1-bit output: LOCK 
                        -- Clock Inputs: 1-bit (each) input: Clock input
CLKIN1 => XCLK_I,       -- 1-bit input: Clock
                        -- Control Ports: 1-bit (each) input: MMCM control ports
PWRDWN => pwr_down,     -- 1-bit input: Power-down
RST => RESET_I, --RST,  -- 1-bit input: Reset
                        -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
CLKFBIN => clk_feedback -- 1-bit input: Feedback clock
);
----------------
-- The below process monitor the 'lock' signal and RESET_I, in order to produce the
-- status signal: 'stable', that signify that the oscillator has started and
-- is running stably.
-- A crystal oscillator will take some time to start and establish a stable frequency.
-- In order to ensure that our clock module produce a stable output, we demand that
-- the 'lock' signal must have been asserted for at least 13ms, before we assert 'stable'.
-- If the MMCM un-assert 'lock' or if 'RESET_I' is asserted, we un-assert 'stable' and start over.
--
process(clk_10,lock,RESET_I) begin
    if (lock='0' or RESET_I = '1') then
        cnt <= (others => '0');
        STABLE_O <= '0';
    elsif (clk_10'event and clk_10 = '1') then
        if cnt = "11111111111111111" then
            cnt<=cnt;
            STABLE_O<='1';
        else
            cnt<=cnt+1;
            STABLE_O<='0';
        end if;
    end if;
end process;

end rtl;