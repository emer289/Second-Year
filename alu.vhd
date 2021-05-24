
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port( 
         Cin : in std_logic;
         A: in std_logic;
         B: in std_logic;
         S0: in std_logic;
         S1: in std_logic;
         S2: in std_logic;
         G: out std_logic;
         Cout : out std_logic
  );
end alu;

architecture Behavioral of alu is

    component logic_unit
        Port( 
             S0: in std_logic;
             S1: in std_logic;
             A: in std_logic;
             B: in std_logic;
             Gi: out std_logic
        );
    end component;

    component arithmetic_unit
        Port( 
             A: in std_logic;
             B: in std_logic;
             Cin: in std_logic;
             Cout: out std_logic;
             S0: in std_logic;
             S1: in std_logic;
             Gi: out std_logic
        );
    end component;
    
    component multiplexer_2_to_1
        Port(
             In0: in std_logic;
             In1: in std_logic;
             sel: in std_logic;
             mux_out: out std_logic
        );
    end component;

    signal adder_out, logic_out: std_logic;

begin
    LU: logic_unit 
        Port Map(
                 S0 => S0, 
                 S1 => S1, 
                 A => A, 
                 B => B, 
                 Gi => logic_out
        );
        
    AU: arithmetic_unit 
        Port Map(
                 A => A, 
                 B => B,
                 Cin => Cin,
                 Cout => Cout, 
                 S0 => S0,
                 S1 => S1,
                 Gi => adder_out
        );
        
    MUX: multiplexer_2_to_1 
        Port Map(
                 In0 => adder_out, 
                 In1 => logic_out, 
                 sel => S2, 
                 mux_out => G
        ); 
        
end Behavioral;