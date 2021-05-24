LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Memory_tb IS
END Memory_tb;
 
ARCHITECTURE behavior OF Memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    Port (  
            data_in : in std_logic_vector(31 downto 0);
            address_in : in unsigned(31 downto 0);
            mw: in std_logic;
            Clk : in std_logic;
            data_out : out std_logic_vector(31 downto 0)
            );
    END COMPONENT;
    

   --Inputs
   signal address_in : unsigned(31 downto 0) := (others => '0');
   signal data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal mw : std_logic := '0';
   signal Clk : std_logic := '0';
    
 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
 
BEGIN
  clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;
  
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
            Clk => Clk,
            address_in => address_in,
            data_in => data_in,
            mw => mw,
            data_out => data_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
   
        address_in <= x"00000000";
        
        -- TEST mw = '1', data_out = 0x22222222
		wait for 20ns;
		mw <='1';
		data_in <= x"22222222";
	    wait for 20 ns;
		
		mw <= '0';

		--data_out = 0x00040C03
		wait for 20ns;
		address_in <= x"00000004";
		--data_out = 0x00041004
		wait for 20ns;
		address_in <= x"00000005";

      wait;
   end process;

END;