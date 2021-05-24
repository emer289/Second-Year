library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity car_tb is
end car_tb;

architecture Behavioral of car_tb is

    component car is
        Port(
            car_in : in std_logic_vector(16 downto 0);
            mux_s : in std_logic;
            reset : in std_logic;
            clk : in std_logic;
            car_out : out std_logic_vector(16 downto 0)
        );
    end component;

    signal car_in : std_logic_vector(16 downto 0) := (others => '0');
    signal Mux_s : std_logic;
    signal clk : std_logic;
    signal reset : std_logic;
    signal car_out : std_logic_vector(16 downto 0) := (others => '0');

begin
 clk_process :process
  begin
       Clk <= '0';
       wait for 5ns;
       Clk <= '1';
       wait for 5ns;
  end process;
    uut : car
        Port Map(
            car_in => car_in,
            Mux_s => Mux_s,
            reset => reset,
            car_out => car_out,
            clk => clk
        );

    sim : process
    begin
        -- test reset
        -- car_out = reset address = 00000000011000000
        reset <= '1';
        wait for 10 ns;
        
        -- mux_s = 0 = increment 
        reset <= '0';
        car_in <= "00000000000000001";
        Mux_s <= '0';
        wait for 10 ns;

        -- mux_s = 1 = load
        -- car_out = car_in = 0000000000000010
        car_in <= "00000000000000010";
        Mux_s <= '1';
        wait for 10 ns;
    
    end process;

        
        
end Behavioral ;