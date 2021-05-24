library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity full_adder is
	Port( 
		 A: in std_logic;
		 B: in std_logic;
		 Cin: in std_logic;
		 S: out std_logic;
		 Cout: out std_logic
	);
end full_adder;
 
architecture Behavioral of full_adder is
    
    signal A_xor_B, A_B_xor_Cin, A_B_and_Cin, A_and_B, A_B_or_Cin: std_logic;
    
begin
     A_xor_B <= A xor B after 5 ns;
     S <= A_xor_B xor Cin after 5 ns;
     A_B_and_Cin <= A_xor_B and Cin after 5 ns;
     A_and_B <= A and B after 5 ns;
     Cout <= A_and_B or A_B_and_Cin after 5 ns;


end Behavioral;