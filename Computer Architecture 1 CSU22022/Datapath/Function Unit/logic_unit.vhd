library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_unit is
    Port( 
         S0: in std_logic;
         S1: in std_logic;
         A: in std_logic;
         B: in std_logic;
         Gi: out std_logic
    );
end logic_unit;

architecture Behavioral of logic_unit is
signal not_A, A_and_B, A_or_B, A_xor_B: std_logic;
begin
    not_A <= not A after 5 ns;
    A_and_B <= (A and B) after 5 ns;
    A_or_B <= (A or B) after 5 ns;
    A_xor_B <= (A xor B) after 5 ns;

    Gi <= A_and_B after 5 ns when S1 = '0' and S0 = '0' else
         A_or_B after 5 ns when S1 = '0' and S0 = '1' else
         A_xor_B after 5 ns when S1 = '1' and S0 = '0' else
         not_A after 5 ns when S1 = '1' and S0 = '1'; 
    
end Behavioral;