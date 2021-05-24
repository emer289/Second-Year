library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Flag_reg is
	Port(	V, C, N, Z : in STD_LOGIC;
			FL, reset, Clk : in STD_LOGIC;
		    RV, RC, RN, RZ : in STD_LOGIC;
		    flag_out : out std_logic_vector(3 downto 0)
			);
end Flag_reg;

architecture Behavioral of Flag_reg is

begin
    process(Clk)
    begin
    if(rising_edge(Clk)) then
        if FL = '1' and reset = '1' then
	        flag_out(0) <= Rc after 5ns;
	        flag_out(1) <= Rv after 5ns;
	        flag_out(2) <= Rz after 5ns;
            flag_out(3) <= RN after 5ns; 
        else
            flag_out(0) <= C after 5ns;
            flag_out(1) <= V after 5ns; 
            flag_out(2) <= Z after 5ns;
            flag_out(3) <= N after 5ns;
        end if;
     end if;
     end process;
end Behavioral;