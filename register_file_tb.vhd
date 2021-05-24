library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is
    component register_file
    Port(	Dsel : in std_logic_vector (4 downto 0);
            TD : in std_logic;
            Asel : in std_logic_vector (4 downto 0);
            TA : in std_logic;
            Bsel : in std_logic_vector (4 downto 0);
            TB : in std_logic;
            clk : in std_logic;
            load_enable : in std_logic;
            D_data : in std_logic_vector (31 downto 0);
            
            A_out : out std_logic_vector (31 downto 0);
            B_out : out std_logic_vector (31 downto 0)
                 );
	end component;

    signal TD, TA, TB, clk, load_enable : std_logic := '0';
    signal Asel, Bsel, Dsel : std_logic_vector (4 downto 0) := "00000";
    signal data, Aout, bout: std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
    constant clk_period : Time := 20 ns;
    begin
    	unit_under_testing : register_file 
    	Port map(Dsel => Dsel,
                 Asel => Asel,
                 Bsel => Bsel,
                 load_enable => load_enable,
                 TD => TD,
                 TA => TA,
                 TB => TB,
                 clk => clk,
                 D_data => data,
                 A_out => Aout,
                 B_out => bout
                 );

        clk_process : process
            begin 
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end process;
        
    	simulation_process : process
    	begin
    	   
    	    --register 0
    	    --Aout -> x"00000000", Bout -> x"00000000"
    	    wait for 25 ns;
    	    load_enable <= '1';
    		data <= x"00000000";
    		wait for 20 ns;
    		
    		--register 1
    		--Aout -> x"00000001", Bout -> x"00000001"
    		data <= x"00000001";
    		asel <= "00001";
    		dsel <= "00001";
            bsel <= "00001";
            wait for 20 ns;
            
            --register 2
            --Aout -> x"00000002", Bout -> x"00000002"
            data <= x"00000002";
            asel <= "00010";
            dsel <= "00010";
            bsel <= "00010";
            wait for 20 ns;
            
            --register 3
            --Aout -> x"00000003", Bout -> x"00000003"
    		data <= x"00000003";
    		asel <= "00011";
    		dsel <= "00011";
            bsel <= "00011";
            wait for 20 ns;
            
            --register 28
            --Aout -> x"0000001C", Bout -> x"0000001C"
            data <= x"0000001C";
            asel <= "11100";
            dsel <= "11100";
            bsel <= "11100";
            wait for 20 ns;
            
           --register 29
           --Aout -> x"0000001D", Bout -> x"0000001D"
            data <= x"0000001D";
            asel <= "11101";
            dsel <= "11101";
            bsel <= "11101";
            wait for 20 ns;
             
            --register 30
            --Aout -> x"0000001E", Bout -> x"0000001E"
            data <= x"0000001e";
            asel <= "11110";
            dsel <= "11110";
            bsel <= "11110";
            wait for 20 ns;
             
            --register 31
            --Aout -> x"0000001F", Bout -> x"0000001F"
            data <= x"0000001f";
            asel <= "11111";
            dsel <= "11111";
            bsel <= "11111";
            wait for 50 ns;
            
            
            -- test the 33rd register, register 32
            --Aout -> x"00000021", Bout -> x"00000021"
            data <= x"00000021";
            TD <= '1';
            Tb <= '1';
            
            wait for 20 ns;
            Ta <= '1';
            wait;
    end process;
end Behavioral;