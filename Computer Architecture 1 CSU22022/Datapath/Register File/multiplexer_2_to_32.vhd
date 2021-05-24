library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplexer_2_to_32 is
    Port ( s : in  std_logic;
           in0 : in  std_logic_vector (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0)
           );
end multiplexer_2_to_32;

architecture Behavioral of multiplexer_2_to_32 is
constant interval: Time:= 5 ns;
begin

   process (s,in0,in1)
		begin
		case  s is
			when '0' => z <= in0 after interval;
			when '1' => z <= in1 after interval;
			when others => z <= "00000000000000000000000000000000" after interval;
		end case;
	end process;
	
end Behavioral;