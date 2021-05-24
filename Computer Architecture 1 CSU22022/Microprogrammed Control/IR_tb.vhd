LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY IR_tb IS
END IR_tb;
 
ARCHITECTURE behavior OF IR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IR
    Port(	Instruction : in STD_LOGIC_VECTOR(31 downto 0);
			IL, Clk : in STD_LOGIC;
			OPCODE :  out STD_LOGIC_VECTOR(16 downto 0);
			DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0)
			);
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal IL : std_logic := '0';
   signal Clk : std_logic := '0';
 	--Outputs
   signal OPCODE : std_logic_vector(16 downto 0);
   signal DR : std_logic_vector(4 downto 0);
   signal SA : std_logic_vector(4 downto 0);
   signal SB : std_logic_vector(4 downto 0);
 
BEGIN
 clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
	-- Instantiate the Unit Under Test (UUT)
   uut: IR PORT MAP (
          Instruction => Instruction,
          IL => IL,
          OPCODE => OPCODE,
          DR => DR,
          SA => SA,
          SB => SB,
          Clk => Clk
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 20ns;
		-- OPCODE = 0, DR = 0, SA = 0, SB = 0
		Instruction <= x"00000000";
		IL <= '1';
		
		-- OPCODE = 00010001000100010, DR = 00100, SA = 01000, SB = 10001
		wait for 20ns;
		Instruction <= x"11111111";
		IL <= '1';

        --TEST IL = 0 = nothing changes
		wait for 20ns;
		Instruction <= x"22222222";
		IL <= '0';

      wait;
   end process;

END;