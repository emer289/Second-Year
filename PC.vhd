library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is 
    Port(
        PC_in : in std_logic_vector(31 downto 0);
        PL: in std_logic;
        PI: in std_logic;
        Clk: in std_logic; 
        Reset: in std_logic;
        PC_Out: out std_logic_vector(31 downto 0)
    );

end pc;

architecture Behavioral of pc is
begin

    process (Clk, reset, PL, PI)
        variable pcvar : std_logic_vector(31 downto 0);
        variable temp : integer;
        variable increment : std_logic_vector(31 downto 0);
    
        begin
            if(rising_edge(clk)) then
                if(reset = '1') then 
        	       pcvar := x"00000000";
        
                elsif(PL = '1') then
                    pcvar := pcvar + PC_IN;
            
                elsif(PI = '1') then
                    temp := conv_integer(pcvar);
                    temp := temp + conv_integer(1);
                    increment := conv_std_logic_vector(temp, 32);
                    pcvar := increment;
        
                end if;
            PC_Out <= pcvar after 10 ns;
        end if;
        end process;

end Behavioral ; -- Behavioral