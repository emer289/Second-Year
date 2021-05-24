
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplexer_32_to_32 is
    Port ( s : in  std_logic_vector (4 downto 0);
           in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  std_logic_vector (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           in3 : in  STD_LOGIC_VECTOR (31 downto 0);
           in4 : in  STD_LOGIC_VECTOR (31 downto 0);
           in5 : in  STD_LOGIC_VECTOR (31 downto 0);
           in6 : in  STD_LOGIC_VECTOR (31 downto 0);
           in7 : in  STD_LOGIC_VECTOR (31 downto 0);
           in8 : in  STD_LOGIC_VECTOR (31 downto 0);
           in9 : in  STD_LOGIC_VECTOR (31 downto 0);
           in10 : in  STD_LOGIC_VECTOR (31 downto 0);
           in11 : in  STD_LOGIC_VECTOR (31 downto 0);
           in12 : in  STD_LOGIC_VECTOR (31 downto 0);
           in13 : in  STD_LOGIC_VECTOR (31 downto 0);
           in14 : in  STD_LOGIC_VECTOR (31 downto 0);
           in15 : in  STD_LOGIC_VECTOR (31 downto 0);
           in16 : in  STD_LOGIC_VECTOR (31 downto 0);
           in17 : in  STD_LOGIC_VECTOR (31 downto 0);
           in18 : in  STD_LOGIC_VECTOR (31 downto 0);
           in19 : in  STD_LOGIC_VECTOR (31 downto 0);
           in20 : in  STD_LOGIC_VECTOR (31 downto 0);
           in21 : in  STD_LOGIC_VECTOR (31 downto 0);
           in22 : in  STD_LOGIC_VECTOR (31 downto 0);
           in23 : in  STD_LOGIC_VECTOR (31 downto 0);
           in24 : in  STD_LOGIC_VECTOR (31 downto 0);
           in25 : in  STD_LOGIC_VECTOR (31 downto 0);
           in26 : in  STD_LOGIC_VECTOR (31 downto 0);
           in27 : in  STD_LOGIC_VECTOR (31 downto 0);
           in28 : in  STD_LOGIC_VECTOR (31 downto 0);
           in29 : in  STD_LOGIC_VECTOR (31 downto 0);
           in30 : in  STD_LOGIC_VECTOR (31 downto 0);
           in31 : in  STD_LOGIC_VECTOR (31 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexer_32_to_32;

architecture Behavioral of multiplexer_32_to_32 is
constant interval: Time:= 5 ns;
begin

   process ( s,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31)
		begin
		case  s is
		    when "00000" => z <= in0 after interval;
			when "00001" => z <= in1 after interval;
			when "00010" => z <= in2 after interval;
			when "00011" => z <= in3 after interval;
            when "00100" => z <= in4 after interval;
            when "00101" => z <= in5 after interval;
            when "00110" => z <= in6 after interval;
            when "00111" => z <= in7 after interval;
            when "01000" => z <= in8 after interval;
            when "01001" => z <= in9 after interval;
            when "01010" => z <= in10 after interval;
            when "01011" => z <= in11 after interval;
            when "01100" => z <= in12 after interval;
            when "01101" => z <= in13 after interval;
            when "01110" => z <= in14 after interval;
            when "01111" => z <= in15 after interval;
            when "10000" => z <= in16 after interval;
            when "10001" => z <= in17 after interval;
            when "10010" => z <= in18 after interval;
            when "10011" => z <= in19 after interval;
            when "10100" => z <= in20 after interval;
            when "10101" => z <= in21 after interval;
            when "10110" => z <= in22 after interval;
            when "10111" => z <= in23 after interval;
            when "11000" => z <= in24 after interval;
            when "11001" => z <= in25 after interval;
            when "11010" => z <= in26 after interval;
            when "11011" => z <= in27 after interval;
            when "11100" => z <= in28 after interval;
            when "11101" => z <= in29 after interval;
            when "11110" => z <= in30 after interval;
            when "11111" => z <= in31 after interval;
			when others => z <= in1 after interval;
		end case;
	end process;
	
end Behavioral;
