library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero_Fill is
    Port ( 
        SB : in  STD_LOGIC_VECTOR (4 downto 0);
	    Zero_Fill_out : out STD_LOGIC_VECTOR (31 downto 0));
end Zero_Fill;

architecture Behavioral of Zero_Fill is

begin
Zero_Fill_out(4 downto 0) <= SB;
Zero_Fill_out(31 downto 5) <= "000000000000000000000000000";
end Behavioral;