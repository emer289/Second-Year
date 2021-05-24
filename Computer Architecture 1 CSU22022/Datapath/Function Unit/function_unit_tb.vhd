library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit_tb is
end function_unit_tb;

architecture Behavioral of function_unit_tb is

COMPONENT function_unit
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
END COMPONENT;

         --Inputs
           
         signal A: std_logic_vector(31 downto 0) := (others => '0');
         signal B: std_logic_vector(31 downto 0) := (others => '0');
         signal FS: std_logic_vector(4 downto 0);
            
         --Outputs
         signal V : std_logic;
         signal C : std_logic;
         signal Z : std_logic;
         signal N : std_logic;
         signal F : std_logic_vector(31 downto 0);
            

begin

        uut: function_unit PORT MAP(
                A=>A,
                B => B,
                FS => FS,
                V => V,
                C => C,
                Z => Z,
                N => N,
                F => F
        );

        stim_proc: process
        begin

    	-- Test Arithmetic Unit
    	     
        wait for 200 ns;
        A<= x"000B0001";
        B<= x"056F0001";
        
        -- FS = 00000 F = A = 0x000B0001          
        wait for 200 ns;
        FS<="00000";
        
        -- FS = 00001 F = A + 1 = 0x000B0002
        wait for 200 ns;
        FS<="00001";
        
        -- FS = 00010 F = A + B = 0x057a0002
        wait for 200 ns;
        FS<="00010";
        
        -- FS = 00011 F = A + B + 1 = 0x057a0003
        wait for 200 ns;
        FS<="00011";
        
        -- FS = 00100 F = A + B' = 0xFa9BFFFF
        wait for 400 ns;
         FS<="00100";
        
        -- FS = 00101 F = A + B' + 1 = 0xFa9c0000
        wait for 400 ns;
        FS<="00101";
        
        -- FS = 00110 F = A - 1 = 0x000B0000
        wait for 400 ns;
        FS<="00110";
        
        -- FS = 00111 F = A = 0x000B0001
        wait for 200 ns;
        FS<="00111";
        
        -- Test Logic Unit                     
        -- FS = 01000 F = A^B = 0x000B0001 
        wait for 200 ns;
        FS<="01000";
        
        -- FS = 01010 F = AorB = 0x056f0001
        wait for 200 ns;
        FS<="01010";
        
        -- FS = 01100 F = AxorB = 0x05640000
        wait for 200 ns;
        FS<="01100";
        
        -- FS = 01110 F = A' = 0xFFF4FFFe
        wait for 200 ns;
        FS<="01110";
        
        -- Test Shifter Unit
        -- FS = 10000 F = B = 0x00000010
        wait for 200 ns;
        FS <= "10000";
        B <= x"00000010";
        
        -- FS = 10100 F = >> B = 0x00000008
        wait for 200 ns;
        FS<="10100";
        
        -- FS = 11000 F = << B = 0x00200020
        wait for 200 ns;
        FS<="11000";
        
        wait;
        
        end process;   
end Behavioral;
