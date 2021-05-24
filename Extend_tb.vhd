LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Extend_tb IS
END Extend_tb;
 
ARCHITECTURE behavior OF Extend_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Extend
    PORT(
         extend_in : IN  std_logic_vector(9 downto 0);
         extend_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal extend_in : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal extend_out : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Extend PORT MAP (
          extend_in => extend_in,
          extend_out => extend_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		extend_in <= "0000000001";		
      wait;
   end process;

END;