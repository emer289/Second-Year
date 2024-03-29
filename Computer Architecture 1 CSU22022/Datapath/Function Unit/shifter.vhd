library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
	Port ( 
		In0: in std_logic;
		In1: in std_logic;
		In2: in std_logic;
		HS: in std_logic_vector(1 downto 0);
		Z: out std_logic
	);
end shifter;

architecture Behavioral of shifter is

begin

	Z <= In0 after 5 ns when HS = "00" else
		 In1 after 5 ns when HS = "01" else
		 In2 after 5 ns when HS = "10" else
		 '0' after 5 ns;
	
end Behavioral;