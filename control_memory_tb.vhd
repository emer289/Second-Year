LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY control_memory_tb IS
END control_memory_tb;
 
ARCHITECTURE behavior OF control_memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_memory
    PORT(
            in_car : in STD_LOGIC_VECTOR(16 downto 0);
			FL : out STD_LOGIC; 
            RZ : out STD_LOGIC;
            RN : out STD_LOGIC;
            RC : out STD_LOGIC;
            RV : out STD_LOGIC;
            MW : out STD_LOGIC;
            MM : out STD_LOGIC;
            RW : out STD_LOGIC;
            MD : out STD_LOGIC; 
            MB : out STD_LOGIC; 
            TB : out STD_LOGIC;
            TA : out STD_LOGIC; 
            TD : out STD_LOGIC; 
            PL : out STD_LOGIC; 
            PI : out STD_LOGIC; 
            IL : out STD_LOGIC; 
            MC : out STD_LOGIC;
            FS : out STD_LOGIC_VECTOR(4 downto 0);
            MS : out STD_LOGIC_VECTOR(2 downto 0);
            NA : out STD_LOGIC_VECTOR(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_car : std_logic_vector(16 downto 0) := (others => '0');

 	--Outputs
   signal FL, RZ, RN, RC, RV, MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC : STD_LOGIC;
   signal FS : std_logic_vector(4 downto 0);
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(16 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_memory PORT MAP (
          in_car => in_car,
          FL => FL,
          RZ => RZ,
          RN => RN,
          RC => RC,
          RV => RV,
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          FS => FS,
          MS => MS,
          NA => NA
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		in_car <= "00000000000000000";
		
		wait for 10ns;
        in_car <= "00000000000000001";
                
        wait for 10ns;
        in_car <= "00000000000000010";
        
        wait for 10ns;
        in_car <= "00000000000000011";
                
        wait for 10ns;
        in_car <= "00000000000000100";
        
        wait for 10ns;
        in_car <= "00000000000000101";
                
        wait for 10ns;
        in_car <= "00000000000000110";
				
        wait for 10ns;
        in_car <= "00000000000000111";
                
        wait for 10ns;
        in_car <= "00000000000001000";	
		
		wait for 10ns;
        in_car <= "00000000011000000";
                
        wait for 10ns;
        in_car <= "00000000011000001";
		
		wait;
   end process;

END;