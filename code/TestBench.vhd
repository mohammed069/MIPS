-- Abo Osama TM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity TestBench is
end TestBench;

architecture Behavioral of TestBench is

  -- constants
  constant CLK_low    : time := 12 ns;
  constant CLK_high   : time := 8 ns;
  constant CLK_period : time := CLK_low + CLK_high;
  constant ResetTime  : time := 10 ns;

  -- dut signals
  signal clock , reset : std_logic;

component TopLevel is
  port( CLK, reset_neg  : in std_logic );
end component;

begin
  dut : TopLevel port map ( clock, reset );

  -- reset
  reset_process : process

  begin
    reset <= '0';
    wait for ResetTime;
    reset <= '1';
    wait;
  end process reset_process;

  clock_process : process

  begin
    if (clock = '0') then
      clock <= '1';
      wait for CLK_high;
    else
      clock <= '0';
      wait for CLK_low;
    end if;
  end process clock_process;

end Behavioral;
