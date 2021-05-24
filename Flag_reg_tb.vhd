LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Flag_reg_tb IS
END Flag_reg_tb;
 
ARCHITECTURE behavior OF Flag_reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Flag_reg
    Port(	V, C, N, Z : in STD_LOGIC;
         FL, reset, Clk : in STD_LOGIC;
         RV, RC, RN, RZ : in STD_LOGIC;
         flag_out : out std_logic_vector(3 downto 0)
			);
    END COMPONENT;
    

   --Inputs
   signal V, C, N, Z : std_logic := '0';
   signal RV, RC, RN, RZ : STD_LOGIC := '0';
   signal FL, reset, Clk : std_logic := '0';
 	--Outputs
   signal flag_out : std_logic_vector(3 downto 0);
 
BEGIN
 clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
	-- Instantiate the Unit Under Test (UUT)
   uut: Flag_reg PORT MAP (
        V => V,
        C => C,
        N => N,
        Z => Z,
        FL => FL,
        reset => reset,
        CLk => Clk,
        RV => RV,
        RC => RC,
        RN => RN,
        RZ => RZ,
        flag_out => flag_out
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 50ns;
        fl <= '1';
        reset <='1';
		
		wait for 50 ns;
		reset <= '0';
		v <= '1';
		z <= '1';
		
		wait for 50 ns;
        reset <= '1';
		

      wait;
   end process;

END;