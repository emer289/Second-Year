library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity cpu_tb is
end cpu_tb;

architecture Behavioral of cpu_tb is

    component cpu
        Port(
            clk : in std_logic;
            reset : in std_logic
        );
    end component;

    signal clk, reset : std_logic := '0';


begin

    uut : cpu
        Port Map(
            clk => clk,
            reset => reset
        );

    sim : process 
    begin
        reset <= '1';
        clk <= '1';

        wait for 50 ns;
        reset <= '0';
        clk <= '0';
        wait;
    end process;
    
end Behavioral ; -- Behavioral