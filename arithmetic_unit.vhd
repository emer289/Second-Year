
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_unit is
    Port ( 
       A: in std_logic;
       B: in std_logic;
       Cin: in std_logic;
       Cout: out std_logic;
       S0: in std_logic;
       S1: in std_logic;
       Gi: out std_logic
    );
end arithmetic_unit;

architecture Behavioral of arithmetic_unit is

    component full_adder
        Port( 
             A: in std_logic;
             B: in std_logic;
             Cin: in std_logic;
             Cout: out std_logic;
             S: out std_logic
        );
    end component;
    
    signal newInput: std_logic;
    signal B_and_S0, not_B, not_B_and_S1: std_logic;

begin
    B_and_S0 <= (B and S0) after 5 ns;
    not_B <= (not B) after 5 ns;
    not_B_and_S1 <= (not_B and S1) after 5 ns;

    newInput <= B_and_S0 or not_B_and_S1;
    
    AC: full_adder 
      Port Map(
               A => A,
               B => newInput,
               Cin => Cin,
               S => Gi,
               Cout => Cout
      );
    
end Behavioral;