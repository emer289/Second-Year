library IEEE;
use IEEE.std_logic_1164.ALL;

entity multiplexer_8_to_1 is
	Port(
		 s: in std_logic_vector(2 downto 0);
		 In0: in std_logic;
		 In1: in std_logic;
		 In2: in std_logic;
         In3: in std_logic;
         In4: in std_logic;
         In5: in std_logic;
         In6: in std_logic;
         In7: in std_logic;
		 z : out std_logic
	);
end multiplexer_8_to_1;

architecture Behavioral of multiplexer_8_to_1 is

begin

	z <= 	In0 after 5 ns when s = "000" else
		    In1 after 5 ns when s = "001" else
			In2 after 5 ns when s = "010" else
            In3 after 5 ns when s = "011" else
            In4 after 5 ns when s = "100" else
            In5 after 5 ns when s = "101" else
            In6 after 5 ns when s = "110" else
            In7 after 5 ns when s = "111";

end Behavioral;