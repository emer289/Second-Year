library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_32 is
    Port (
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        GS: in std_logic_vector(3 downto 0);
        
        F: out std_logic_vector(31 downto 0);
        
        C: out std_logic;
        V: out std_logic
    );
end alu_32;

architecture Behavioral of alu_32 is

    COMPONENT alu
        Port (
             Cin: in std_logic;
             A: in std_logic;
             B: in std_logic;
             S0: in std_logic;
             S1: in std_logic;
             S2: in std_logic;
             G: out std_logic;
             Cout: out std_logic
         
        );
    END COMPONENT;


signal G0, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16, G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30, G31 : std_logic; -- G out 
signal C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, Cout : std_logic; -- Carries

begin


    alu0: alu PORT MAP(
                    Cin => GS(0),
                    A => A(0),
                    B => B(0),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C1,
                    G => G0
        );
        
    alu1: alu PORT MAP(
                    Cin => C1,
                    A => A(1),
                    B => B(1),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C2,
                    G => G1
        );
        
    alu2: alu PORT MAP(
                    Cin => C2,
                    A => A(2),
                    B => B(2),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C3,
                    G => G2
        );
        
    alu3: alu PORT MAP(
                    Cin => C3,
                    A => A(3),
                    B => B(3),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C4,
                    G => G3
        );
        
     alu4: alu PORT MAP(
                    Cin => C4,
                    A => A(4),
                    B => B(4),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C5,
                    G => G4
        );
        
     alu5: alu PORT MAP(
                    Cin => C5,
                    A => A(5),
                    B => B(5),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C6,
                    G => G5
        );
        
      alu6: alu PORT MAP(
                    Cin => C6,
                    A => A(6),
                    B => B(6),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C7,
                    G => G6
        );
        
       alu7: alu PORT MAP(
                    Cin => C7,
                    A => A(7),
                    B => B(7),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C8,
                    G => G7
        );
        
        alu8: alu PORT MAP(
                    Cin => C8,
                    A => A(8),
                    B => B(8),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C9,
                    G => G8
        );
        
        alu9: alu PORT MAP(
                    Cin => C9,
                    A => A(9),
                    B => B(9),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C10,
                    G => G9
        );
        
        alu10: alu PORT MAP(
                    Cin => C10,
                    A => A(10),
                    B => B(10),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C11,
                    G => G10
        );
        
        alu11: alu PORT MAP(
                    Cin => C11,
                    A => A(11),
                    B => B(11),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C12,
                    G => G11
        );
        
        alu12: alu PORT MAP(
                    Cin => C12,
                    A => A(12),
                    B => B(12),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C13,
                    G => G12
        );
        
        alu13: alu PORT MAP(
                    Cin => C13,
                    A => A(13),
                    B => B(13),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C14,
                    G => G13
        );
        
        alu14: alu PORT MAP(
                    Cin => C14,
                    A => A(14),
                    B => B(14),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C15,
                    G => G14
        );
        
        alu15: alu PORT MAP(
                    Cin => C15,
                    A => A(15),
                    B => B(15),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C16,
                    G => G15
        );
        
        alu16: alu PORT MAP(
                    Cin => C16,
                    A => A(16),
                    B => B(16),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C17,
                    G => G16
        );
        
        alu17: alu PORT MAP(
                    Cin => C17,
                    A => A(17),
                    B => B(17),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C18,
                    G => G17
        );
        
        alu18: alu PORT MAP(
                    Cin => C18,
                    A => A(18),
                    B => B(18),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C19,
                    G => G18
        );
        
        alu19: alu PORT MAP(
                    Cin => C19,
                    A => A(19),
                    B => B(19),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C20,
                    G => G19
        );
        
        alu20: alu PORT MAP(
                    Cin => C20,
                    A => A(20),
                    B => B(20),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C21,
                    G => G20
        );
        
        alu21: alu PORT MAP(
                    Cin => C21,
                    A => A(21),
                    B => B(21),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C22,
                    G => G21
        );
        
        alu22: alu PORT MAP(
                    Cin => C22,
                    A => A(22),
                    B => B(22),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C23,
                    G => G22
        );
        
        alu23: alu PORT MAP(
                    Cin => C23,
                    A => A(23),
                    B => B(23),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C24,
                    G => G23
        );
        
        alu24: alu PORT MAP(
                    Cin => C24,
                    A => A(24),
                    B => B(24),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C25,
                    G => G24
        );
        
        alu25: alu PORT MAP(
                    Cin => C25,
                    A => A(25),
                    B => B(25),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C26,
                    G => G25
        );
        
        alu26: alu PORT MAP(
                    Cin => C26,
                    A => A(26),
                    B => B(26),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C27,
                    G => G26
        );
        
        alu27: alu PORT MAP(
                    Cin => C27,
                    A => A(27),
                    B => B(27),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C28,
                    G => G27
        );
        
        alu28: alu PORT MAP(
                    Cin => C28,
                    A => A(28),
                    B => B(28),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C29,
                    G => G28
        );
        
        alu29: alu PORT MAP(
                    Cin => C29,
                    A => A(29),
                    B => B(29),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C30,
                    G => G29
        );
        
        alu30: alu PORT MAP(
                    Cin => C30,
                    A => A(30),
                    B => B(30),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => C31,
                    G => G30
        );
        
        alu31: alu PORT MAP(
                    Cin => C31,
                    A => A(31),
                    B => B(31),
                    S0 => GS(1),
                    S1 => GS(2),
                    S2 => GS(3),
                    Cout => Cout,
                    G => G31
        );

F <= G31 & G30 & G29 & G28 & G27 & G26 & G25 & G24 & G23 & G22 & G21 & G20 & G19 & G18 & G17 & G16 & G15 & G14 & G13 & G12 & G11 & G10 & G9 & G8 & G7 & G6 & G5 & G4 & G3 & G2 & G1 & G0 after 5 ns;
V <= C30 xor Cout after 5 ns;
C <= Cout after 5 ns;


end Behavioral;