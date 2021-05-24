library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit is
    Port (
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        
        FS: in std_logic_vector(4 downto 0);
       
        V: out std_logic;
        C: out std_logic;
        Z: out std_logic; --return 1 if 0
        N: out std_logic; --return MSB
       
        F: out std_logic_vector(31 downto 0)
    );
end function_unit;

architecture Behavioral of function_unit is

COMPONENT shifter_32 is
    Port (
		 B: in std_logic_vector (31 downto 0);
         HS: in std_logic_vector (1 downto 0);
         Lr: in std_logic;
         Ll: in std_logic;
         H: out std_logic_vector (31 downto 0)
    );
END COMPONENT;

COMPONENT alu_32 is
    Port (
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        GS: in std_logic_vector(3 downto 0);
        F: out std_logic_vector(31 downto 0);
        C: out std_logic;
        V: out std_logic
    );

END COMPONENT;

COMPONENT multiplexer_2_to_32 is
    port ( 
        s : in std_logic;
        In0 : in std_logic_vector(31 downto 0);
        In1 : in std_logic_vector(31 downto 0);
        Z : out std_logic_vector(31 downto 0)
    );

END COMPONENT;

signal G1, H1: std_logic_vector(31 downto 0);

begin



alu0: alu_32 PORT MAP(
        A => A,
        B => B,
        GS =>FS(3 downto 0),
        F => G1,
        C => C,
        V => V
    );

shifter0: shifter_32 PORT MAP(
        B => B,
        HS => FS(3 downto 2),
        Ll => '0',
        Lr => '0',
        H => H1
    );

multiplexer0: multiplexer_2_to_32 PORT MAP(
        s =>FS(4), 
        In0 => G1,
        In1 => H1,
        Z => F
    );

N <= G1(31);
Z <= '1' after 5 ns when G1=x"00000000"else
'0' after 5 ns;

end Behavioral;