LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Zero_Fill_tb IS
END Zero_Fill_tb;
 
ARCHITECTURE behavior OF Zero_Fill_tb IS 
 
    COMPONENT zero_fill
    PORT(
         SB : IN  std_logic_vector(4 downto 0);
         Zero_Fill_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB : std_logic_vector(4 downto 0) := "00000";

 	--Outputs
   signal Zero_Fill_out : std_logic_vector(31 downto 0);
 
BEGIN
 
   uut: Zero_Fill PORT MAP (
          SB => SB,
          Zero_Fill_out => Zero_Fill_out
        );

   stim_proc: process
   begin	
		wait for 10ns;
		SB <= "00001";
		wait;
   end process;

END;