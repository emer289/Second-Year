LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY multiplexer_8_to_1_tb IS
END multiplexer_8_to_1_tb;
 
ARCHITECTURE behavior OF multiplexer_8_to_1_tb IS 
 
    COMPONENT multiplexer_8_to_1
    PORT(  s: in std_logic_vector(2 downto 0);
            In0: in std_logic;
            In1: in std_logic;
            In2: in std_logic;
            In3: in std_logic;
            In4: in std_logic;
            In5: in std_logic;
            In6: in std_logic;
            In7: in std_logic;
            z : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic_vector(2 downto 0) := (others => '0');
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal in3 : std_logic := '0';
   signal in4 : std_logic := '0';
   signal in5 : std_logic := '0';
   signal in6 : std_logic := '0';
   signal in7 : std_logic := '0';
 	--Outputs
   signal z : std_logic;

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer_8_to_1 PORT MAP (
         s => s,
         In0 => in0,
         In1 => in1,
         In2 => in2,
         In3 => in3,
         In4 => in4,
         In5 => in5,
         In6 => in6,
         In7 => in7,
         z => z
        );

   stim_proc: process
   begin		
      in0 <= '0';
      in1 <= '1';
      in2 <= '0';
      in3 <= '1';
      in4 <= '0';
      in5 <= '1';
      in6 <= '0';
      in7 <= '1';		
      wait for 10 ns;	
      s <= "001";

      wait for 10 ns;	
		s <= "010";

     
 --     wait;
   end process;

END;