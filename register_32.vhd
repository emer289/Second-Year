library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_32 is
	Port(load : in std_logic;
		 clk : in std_logic;
		 D : in std_logic_vector (31 downto 0);
		 Q : out std_logic_vector(31 downto 0)
		);
end register_32;

architecture Behavioral of register_32 is
 
 begin
 process(clk)   
 begin
    if load = '1' and (rising_edge(clk)) then
    Q <= D after 5 ns;
    end if;
 end process;
 end Behavioral;