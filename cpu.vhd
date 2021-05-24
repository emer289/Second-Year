library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity cpu is 
    Port(
        clk : in std_logic;
        reset : in std_logic
    );
end cpu;

architecture Behavioral of cpu is

    component datapath
        Port(
                Data_in : in std_logic_vector(31 downto 0);
        const : in std_logic_vector(4 downto 0);
        Pc_in : in std_logic_vector(31 downto 0);
        
        AA : in std_logic_vector(4 downto 0);
        BA : in std_logic_vector(4 downto 0);
        DA : in std_logic_vector(4 downto 0);
        ta : in std_logic;
        tb : in std_logic;
        td : in std_logic;
        clk: in std_logic;
        FS : in std_logic_vector(4 downto 0);
        RW : in std_logic;
        
        Vout : out std_logic;
        Cout : out std_logic;
        Nout : out std_logic;
        Zout : out std_logic;
        
        mb : in std_logic;
        md : in std_logic;
        mm : in std_logic;
        
        mux_m_out : out std_logic_vector(31 downto 0);
        mb_outt : out std_logic_vector(31 downto 0);
        
        f_unit_data_out : out std_logic_vector(31 downto 0)

        );
    end component; 

    component microprogrammed_control
        Port(
        instruction_sel : in std_logic_vector(31 downto 0);
        reset : in std_logic;
        clk : in std_logic;

        v : in std_logic; 
        c : in std_logic; --flags
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

        -- extra stuff for ease of functionality later
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(16 downto 0)
            
        );
    end component;

    component memory
        Port(
            data_in : in std_logic_vector(31 downto 0);
        address_in : in unsigned(31 downto 0);
        mw: in std_logic;
        Clk: in std_logic;
        data_out : out std_logic_vector(31 downto 0)
        );
    end component;

    signal adr_out : std_logic_vector(31 downto 0);
    signal data_out : std_logic_vector(31 downto 0);
    signal V : std_logic;
    signal C : std_logic;
    signal N : std_logic;
    signal Z : std_logic;
    signal PC : std_logic_vector(31 downto 0);
    signal DR, SA, SB : std_logic_vector(4 downto 0);
    signal TD, TA, TB : std_logic;
    signal MB, MM, MW, MD : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal RW : std_logic;
    signal const : std_logic_vector(4 downto 0);
    signal memOut : std_logic_vector(31 downto 0);
    signal pcOut : std_logic_vector(31 downto 0);
    signal f_unit_data_out : std_logic_vector(31 downto 0);



begin
    mc : microprogrammed_control
            Port Map(
                instruction_sel => memOut,
                clk => clk,
                reset => reset,
                
                v => V,
                c => C,
                n => N,
                z => Z,
                
                pc_out => pcOut,
                DR => DR,
                SA => SA,
                SB => SB,
                
                TD => TD,
                TA => TA,
                TB => TB,
                mb => MB,
                FS => FS,
                MD => MD,
                RW => RW,
                MM => MM,
                MW => MW
            );

    dp : datapath
        Port Map(
             data_in => memOut,
             Pc_in => pcOut,
             const => const,
             AA => SA,
             BA => SB,
             DA => DR,
             TD => TD,
             TA => TA,
             TB => TB,
             
             Clk => clk,
             
             FS => FS,
             
             RW => RW,
             
             MB => MB,
             MD => MD,
             mm => mm,
              
             mux_m_out => adr_out,
             mb_outt => data_out,
             
             f_unit_data_out => f_unit_data_out,
             
             vout => V,
             cout => C,
             nout => N,
             zout => Z
        );

    mem : memory
        Port Map(
            address_in => unsigned(adr_out),
            data_out => data_out,
            MW => MW,
            clk => clk,
            data_in => memOut
        );

    
end Behavioral ; -- Behavioral