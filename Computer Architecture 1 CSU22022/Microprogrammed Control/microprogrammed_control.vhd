library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity microprogrammed_control is 
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
end microprogrammed_control;

architecture Behavioral of microprogrammed_control is

component pc
    Port(
        PC_in : in std_logic_vector(31 downto 0);
        PL: in std_logic;
        PI: in std_logic;
        Clk: in std_logic; 
        Reset: in std_logic;
        PC_Out: out std_logic_vector(31 downto 0)
    );
end component;

component Flag_reg
    Port(
        V, C, N, Z : in STD_LOGIC;
        FL, reset, Clk : in STD_LOGIC;
        RV, RC, RN, RZ : in STD_LOGIC;
        flag_out : out std_logic_vector(3 downto 0)
    );
end component;

component extend
    Port(
        extend_in : in std_logic_vector(9 downto 0);
        extend_out : out std_logic_vector(31 downto 0)
    );
end component;

component IR
    Port( Instruction : in STD_LOGIC_VECTOR(31 downto 0);
          IL, Clk : in STD_LOGIC;
          OPCODE :  out STD_LOGIC_VECTOR(16 downto 0);
          DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0)
    );
end component;

component car
    Port(
        car_in : in std_logic_vector(16 downto 0);
        mux_s, reset, clk : in std_logic;
        car_out : out std_logic_vector(16 downto 0)
    );
end component;

component multiplexer_2_to_17
    Port( s : in  std_logic;
          in0 : in  std_logic_vector (16 downto 0);
          in1 : in  STD_LOGIC_VECTOR (16 downto 0);
          z : out  STD_LOGIC_VECTOR (16 downto 0)
    );
end component;

component multiplexer_8_to_1
    Port(
		 s: in std_logic_vector(2 downto 0);
        In0: in std_logic;
        In1: in std_logic;
        In2: in std_logic;
        In3: in std_logic;
        In4: in std_logic;
        In5: in std_logic;
        In6: in std_logic;
        In7: in std_logic;
        z : out std_logic
    );
end component;

component control_memory
    Port(
	        in_car : in STD_LOGIC_VECTOR(16 downto 0);
    FL : out STD_LOGIC; 
    RZ : out STD_LOGIC;
    RN : out STD_LOGIC;
    RC : out STD_LOGIC;
    RV : out STD_LOGIC;
    MW : out STD_LOGIC;
    MM : out STD_LOGIC;
    RW : out STD_LOGIC;
    MD : out STD_LOGIC; 
    MB : out STD_LOGIC; 
    TB : out STD_LOGIC;
    TA : out STD_LOGIC; 
    TD : out STD_LOGIC; 
    PL : out STD_LOGIC; 
    PI : out STD_LOGIC; 
    IL : out STD_LOGIC; 
    MC : out STD_LOGIC;
    FS : out STD_LOGIC_VECTOR(4 downto 0);
    MS : out STD_LOGIC_VECTOR(2 downto 0);
    NA : out STD_LOGIC_VECTOR(16 downto 0)
    );
end component;

    signal PL_out, PI_out, IL_out, MC_out : std_logic;
    signal MS_out : std_logic_vector(2 downto 0);
    signal NA_out : std_logic_vector(16 downto 0);
    signal MUX_S_OUT : std_logic; 
    signal notC : std_logic; 
    signal notZ : std_logic;
    signal FL, RV, RC, RN, RZ : std_logic;
    signal DR_OP : std_logic_vector(4 downto 0); 
    signal SA_OP : std_logic_vector(4 downto 0);
    signal SB_OP : std_logic_vector(4 downto 0);
    signal IN_CAR : std_logic_vector(16 downto 0);
    signal MUX_C_OUT : std_logic_vector(16 downto 0);
    signal OPCODE : std_logic_vector(16 downto 0);
    signal PC_in : std_logic_vector(31 downto 0);
    signal P_Cout : std_logic_vector(31 downto 0);
    signal Flag_out : std_logic_vector(3 downto 0);

begin

    ext0 : extend
        Port Map(
            extend_in(4 downto 0) => SB_OP,
            extend_in(9 downto 5) => DR_OP,  
            extend_out => PC_in
        );

    program_counter : pc
        Port Map(
            PC_in => PC_in,
            PL => PL_out,
            PI => PI_out,
            Clk => clk,
            Reset => reset,
            PC_Out => PC_out
        );

notC <= not flag_out(0);
notZ <= not flag_out(2);

    mux_s : multiplexer_8_to_1
        Port Map(
            in0 => '0',
            in1 => '1',
            in2 => flag_out(0),
            in3 => flag_out(1),
            in4 => flag_out(2),
            in5 => flag_out(3),
            in6 => notC,
            in7 => notZ,
            s(0) => MS_out(0),
            s(1) => MS_out(1),
            s(2) => MS_out(2),           
            Z => MUX_S_out
        );

    flag_regs : Flag_reg
        Port Map(
             V => v,
             C => c,
             N => n,
             Z => z,
             FL => FL,
             reset => reset,
             Clk => clk,
             RV => RV, 
             RC => RC, 
             RN => RN, 
             RZ => RZ,
             flag_out => flag_out           
        );

    instruction_register : IR 
        Port Map(
            instruction => instruction_sel,
            il => IL_out,
            clk => clk,
            dr => DR_OP,
            sa => SA_OP,
            sb => SB_OP,
            opcode => OPCODE
        );

    control_mem : control_memory
        Port Map(
            IN_CAR => IN_CAR,
            MM => MM,
            MW => MW,
            RW => RW,
            MD => MD,
            FS => FS,
            MB => MB,
            TB => TB,
            TA => TA,
            TD => TD,
            rv => RV,
            RC => RC,
            RZ => RZ,
            RN => RN,
            PI => PI_out,
            PL => PL_out,
            IL => IL_out,
            MC => MC_out,
            MS => MS_out,
            NA => NA_out
        );

    car0 : car
        Port Map(
            car_in => MUX_C_OUT,
            CAR_out => IN_CAR,
            reset => reset,
            clk => clk,
            MUX_S => MUX_S_OUT
        );

    mux_c : multiplexer_2_to_17
        Port Map(
            in1 => OPCODE,
            in0 => NA_out,
            S => MC_out,
            Z => MUX_C_OUT
        );

    PL <= PL_out;
    PI <= PI_out;
    IL <= IL_out;
    MC <= MC_out;
    MS <= MS_out;
    NA <= NA_out;
    DR <= DR_OP;
    SA <= SA_OP;
    SB <= SB_OP;  
end Behavioral ; 