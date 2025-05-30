
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryDataRegister is
  port( 
        CLK        : in std_logic;
        reset_neg  : in std_logic;
        input      : in std_logic_vector(31 downto 0); 

        output     : out std_logic_vector(31 downto 0) ); 
end MemoryDataRegister;

architecture Behavioral of MemoryDataRegister is
  type mem_data_type is array (0 downto 0) of std_logic_vector(31 downto 0);
  signal MemDataReg: mem_data_type := ((others => (others => '0')));


begin
  process(CLK)
  begin
    if reset_neg = '0' then 
      MemDataReg(0) <= (others => '0');
    else if rising_edge(CLK) then
      MemDataReg(0) <= input;
    end if;
    end if;
  end process;

  output <= MemDataReg(0);

end Behavioral;
