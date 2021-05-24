library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_6_to_33_tb is
end decoder_6_to_33_tb;

architecture Behavioral of decoder_6_to_33_tb is

    component decoder_6_to_33
    Port(s : in std_logic_vector (4 downto 0);
         td : in std_logic;
         Q0 : out std_logic;
         Q1 : out std_logic;
         Q2 : out std_logic;
         Q3 : out std_logic;
         Q4 : out std_logic;
         Q5 : out std_logic;
         Q6 : out std_logic;
         Q7 : out std_logic;
         Q8 : out std_logic;
         Q9 : out std_logic;
         Q10 : out std_logic;
         Q11 : out std_logic;
         Q12 : out std_logic;
         Q13 : out std_logic;
         Q14 : out std_logic;
         Q15 : out std_logic;
         Q16 : out std_logic;
         Q17 : out std_logic;
         Q18 : out std_logic;
         Q19 : out std_logic;
         Q20 : out std_logic;
         Q21 : out std_logic;
         Q22 : out std_logic;
         Q23 : out std_logic;
         Q24 : out std_logic;
         Q25 : out std_logic;
         Q26 : out std_logic;
         Q27 : out std_logic;
         Q28 : out std_logic;
         Q29 : out std_logic;
         Q30 : out std_logic;
         Q31 : out std_logic;
         Q32 : out std_logic;
         load_enable : in std_logic
         );
    end component; 

    signal s : std_logic_vector(4 downto 0) := "00000";
    signal td : std_logic := '0';
    signal load_enable : std_logic := '1';
    signal Q0 : std_logic;
    signal Q1 : std_logic;
    signal Q2 : std_logic;
    signal Q3 : std_logic;
    signal Q4 : std_logic;
    signal Q5 : std_logic;
    signal Q6 : std_logic;
    signal Q7 : std_logic;
    signal Q8 : std_logic;
    signal Q9 : std_logic;
    signal Q10 : std_logic;
    signal Q11 : std_logic;
    signal Q12 : std_logic;
    signal Q13 : std_logic;
    signal Q14 : std_logic;
    signal Q15 : std_logic;
    signal Q16 : std_logic;
    signal Q17 : std_logic;
    signal Q18 : std_logic;
    signal Q19 : std_logic;
    signal Q20 : std_logic;
    signal Q21 : std_logic;
    signal Q22 : std_logic;
    signal Q23 : std_logic;
    signal Q24 : std_logic;
    signal Q25 : std_logic;
    signal Q26 : std_logic;
    signal Q27 : std_logic;
    signal Q28 : std_logic;
    signal Q29 : std_logic;
    signal Q30 : std_logic;
    signal Q31 : std_logic;
    signal Q32 : std_logic;

    constant clk: Time:= 20 ns;
        
begin
    unit_under_test: decoder_6_to_33
    Port map(s => s,
             td => td,
             Q0 => Q0,
             Q1 => Q1,
             Q2 => Q2,
             Q3 => Q3,
             Q4 => Q4,
             Q5 => Q5,
             Q6 => Q6,
             Q7 => Q7,
             Q8 => Q8,
             Q9 => Q9,
             Q10 => Q10,
             Q11 => Q11,
             Q12 => Q12,
             Q13 => Q13,
             Q14 => Q14,
             Q15 => Q15,
             Q16 => Q16,
             Q17 => Q17,
             Q18 => Q18,
             Q19 => Q19,
             Q20 => Q20,
             Q21 => Q21,
             Q22 => Q22,
             Q23 => Q23,
             Q24 => Q24,
             Q25 => Q25,
             Q26 => Q26,
             Q27 => Q27,
             Q28 => Q28,
             Q29 => Q29,
             Q30 => Q30,
             Q31 => Q31,
             Q32 => Q32,
             load_enable => load_enable
            );

    simulation_process : process
    begin
        -- 
        s <= "00000";
        wait for clk;
        s <= "00001";
        wait for clk;
        s <= "00010";
        wait for clk;
        s <= "00011";
        wait for clk;
        s <= "00100";
        wait for clk;
        s <= "00101";
        wait for clk;
        s <= "00110";
        wait for clk;
        s <= "00111";   
        wait for clk;
        s <= "01000";
        wait for clk;
        s <= "01001";
        wait for clk;
        s <= "01010";
        wait for clk;
        s <= "01011";
        wait for clk;
        s <= "01100";
        wait for clk;
        s <= "01101";
        wait for clk;
        s <= "01110";
        wait for clk;
        s <= "01111";
        wait for clk;
        s <= "10000";
        wait for clk;
        s <= "10001";
        wait for clk;
        s <= "10010";
        wait for clk;
        s <= "10011";
        wait for clk;
        s <= "10100";
        wait for clk;
        s <= "10101";
        wait for clk;
        s <= "10110";
        wait for clk;
        s <= "10111";   
        wait for clk;
        s <= "11000";
        wait for clk;
        s <= "11001";
        wait for clk;
        s <= "11010";
        wait for clk;
        s <= "11011";
        wait for clk;
        s <= "11100";
        wait for clk;
        s <= "11101";
        wait for clk;
        s <= "11110";
        wait for clk;
        s <= "11111";
        --test td
        wait for clk;
        TD <= '1';
        
    end process;
end Behavioral;
