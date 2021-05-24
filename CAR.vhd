library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is
    Port ( 
       car_in : in std_logic_vector(16 downto 0);
       Mux_S : in std_logic;
       reset : in std_logic; 
       clk : in std_logic;
       car_out : out std_logic_vector(16 downto 0)
    );
end car;

architecture Behavioral of car is

begin   

    process(reset, car_in, clk)
    
        variable current : std_logic_vector(16 downto 0);

        begin
            if rising_edge(Clk) then
                if(reset = '1') then current := "00000000011000000";
                elsif(Mux_s = '1') then current := car_in;
                elsif(Mux_s = '0') then
                    current := conv_std_logic_vector(conv_integer(current), 17);
                end if;
                car_out <= current;
            end if;
    end process;

end Behavioral;
