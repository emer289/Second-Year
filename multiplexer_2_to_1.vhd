library IEEE;
use IEEE.std_logic_1164.ALL;

entity multiplexer_2_to_1 is
	Port(
		 sel: in std_logic;
		 In0: in std_logic;
		 In1: in std_logic;
		 mux_out : out std_logic
	);
end multiplexer_2_to_1;

architecture Behavioral of multiplexer_2_to_1 is

begin

	mux_out <= 	In0 after 5 ns when sel = '0' else
				In1 after 5 ns when sel = '1' else
				'0' after 1 ns;

end Behavioral;