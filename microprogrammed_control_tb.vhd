library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity microprogrammed_control_tb is
end microprogrammed_control_tb;

architecture Behavioral of microprogrammed_control_tb is

    component microprogrammed_control
        Port(
        instruction_sel : in std_logic_vector(31 downto 0);
        reset : in std_logic;
        clk : in std_logic;

        v : in std_logic; 
        c : in std_logic; 
        n : in std_logic;
        z : in std_logic;

        pc_out : out std_logic_vector(31 downto 0);
        dr : out std_logic_vector(4 downto 0);
        sa : out std_logic_vector(4 downto 0);
        sb : out std_logic_vector(4 downto 0);
        td : out std_logic;
        ta : out std_logic;
        tb : out std_logic;
        mb : out std_logic;
        fs : out std_logic_vector(4 downto 0);
        md : out std_logic;
        rw : out std_logic;
        mm : out std_logic;
        mw : out std_logic;
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(16 downto 0)
            
        );
    end component;

    signal v, c, n, z : std_logic;
    signal instruction_sel : std_logic_vector(31 downto 0);
    signal clk : std_logic;
    signal reset : std_logic;
    signal PC : std_logic_vector(31 downto 0);
    signal TD : std_logic;
    signal TA : std_logic;
    signal TB : std_logic; 
    signal MB : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal MD : std_logic;
    signal RW : std_logic;
    signal MM : std_logic;
    signal MW : std_logic;
    signal PL : std_logic;
    signal PI : std_logic;
    signal IL : std_logic;
    signal MC : std_logic;
    signal MS : std_logic_vector(2 downto 0);
    signal NA : std_logic_vector(16 downto 0);
    signal DR : std_logic_vector(4 downto 0);
    signal SA : std_logic_vector(4 downto 0);
    signal SB : std_logic_vector(4 downto 0);

begin

    uut : microprogrammed_control
        Port Map(
            instruction_sel => instruction_sel,
            v => v,
            c => c,
            n => n,
            z => z,
            clk => clk,
            reset => reset,
            pc_out => PC,
            TD => TD,
            TA => TA,
            TB => TB,
            MB => MB,
            FS => FS,
            MD => MD,
            RW => RW,
            MM => MM,
            MW => MW,
            PL => PL,
            PI => PI,
            IL => IL,
            MC => MC,
            MS => MS,
            NA => NA,
            DR => DR,
            SA => SA,
            SB => SB 
        );

     clk_process :process
         begin
              Clk <= '0';
              wait for 5ns;
              Clk <= '1';
              wait for 5ns;
         end process;
    sim : process
    begin
        v <= '0';
        c <= '0';
        n <= '0';
        z <= '0';

        reset <= '1';
        wait for 10 ns;
        
        reset <= '0';
        wait for 10 ns;

        instruction_sel <= x"00008801";
        wait for 10 ns;


    end process;

end Behavioral ; 