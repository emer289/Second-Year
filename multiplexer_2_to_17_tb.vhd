LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY multiplexer_2_to_17_tb IS
END multiplexer_2_to_17_tb;
 
ARCHITECTURE behavior OF multiplexer_2_to_17_tb IS 
 
    COMPONENT multiplexer_2_to_17
    PORT(
         s : IN  std_logic;
         in0 : IN  std_logic_vector(16 downto 0);
         in1 : IN  std_logic_vector(16 downto 0);
         z : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic := '0';
   signal in0 : std_logic_vector(16 downto 0) := (others => '0');
   signal in1 : std_logic_vector(16 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic_vector(16 downto 0);

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer_2_to_17 PORT MAP (
          s => s,
          in0 => in0,
          in1 => in1,
          z => z
        );

   stim_proc: process
   begin		
      in0 <= "00000000000000010";
		in1 <= "00000000000000001";
      wait for 10 ns;	
      s <= '0';

      wait for 10 ns;	
		s <= '1';

     
 --     wait;
   end process;

END;