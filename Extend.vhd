library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extend is
	Port(	extend_in : in STD_LOGIC_VECTOR(9 downto 0);
			extend_out : out STD_LOGIC_VECTOR(31 downto 0)
			);
end Extend;

architecture Behavioral of Extend is
begin
	extend_out(9 downto 0) <= extend_in;
	extend_out(31 downto 10) <= "0000000000000000000000";

end Behavioral;