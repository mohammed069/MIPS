
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter is
port( 
      CLK        : in  std_logic;
      reset_neg  : in  std_logic;
      input      : in  std_logic_vector(31 downto 0):="00011110000000001010101111111111";
      PCcontrol  : in  std_logic;

      output : out std_logic_vector(31 downto 0) );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

  process(CLK)
  begin
    if reset_neg = '0' then
      output <= (others => '0' );
    elsif (rising_edge(CLK) and (PCcontrol = '1')) then
      output <= input;
    end if;
  end process;

end Behavioral;
