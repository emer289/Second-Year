library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
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
end datapath;

architecture Behavioral of datapath is

   	component Zero_Fill
       Port(
             SB : in  STD_LOGIC_VECTOR (4 downto 0);
             Zero_Fill_out : out STD_LOGIC_VECTOR (31 downto 0)
         );
    end component;
	component register_file
		Port(
                Dsel : in std_logic_vector (4 downto 0);
                Asel : in std_logic_vector (4 downto 0);
                Bsel : in std_logic_vector (4 downto 0);
                ta : in std_logic;
                tb : in std_logic;
                td : in std_logic;
                clk : in std_logic;
                load_enable : in std_logic;
                
                D_data : in std_logic_vector (31 downto 0);
                
                A_out : out std_logic_vector (31 downto 0);
                B_out : out std_logic_vector (31 downto 0)
		);
	end component;
	
	component multiplexer_2_to_32
		Port(
			 In0: in std_logic_vector(31 downto 0);
			 In1: in std_logic_vector(31 downto 0);
			 S: in std_logic;
			 Z: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component function_unit
		Port(
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        FS: in std_logic_vector(4 downto 0);
        V: out std_logic;
        C: out std_logic;
        Z: out std_logic; --return 1 if 0
        N: out std_logic; --return MSB
        F: out std_logic_vector(31 downto 0)
		);
	end component;
	
	
	signal Zero_out, A_data, B_data, bus_b_out, F_unit_out, md_out : std_logic_vector(31 downto 0);
		
	begin

	Z_Filll: Zero_Fill
    Port Map(
        SB => const,
        Zero_fill_out => Zero_out
    );	
	
	reg_file: register_file 
	Port Map(
                 Asel => AA,	
                 Bsel => BA,
                 Dsel => DA,
                 ta=> ta,
                 clk => clk,
                 tb => tb,
                 td => td,
                 load_enable => RW,
                 D_data => md_out,
                 
                 A_out => A_data,
                 B_out => B_data
	);
	
    
	mux_B: multiplexer_2_to_32 
	Port Map(
			 In0 => B_data,
			 In1 => zero_out, --zero_out
			 S => mb,
			 Z => bus_b_out
	);
	
	funct_unit: function_unit 
	Port Map(
			 A => A_data,
			 B => bus_b_out,
			 
			 FS => FS,
			 
			 V => Vout,
			 C => Cout,
			 N => Nout,
			 Z => Zout,	
			 
			 F => F_unit_out
	);

	mux_M: multiplexer_2_to_32 
    Port Map(
             In0 => A_data,
             In1 => pc_in,
             S => mm,
             Z => mux_m_out
    );
	mux_D: multiplexer_2_to_32 
	Port Map(
			 In0 => F_unit_out,
			 In1 => data_in,
			 S => md,
			 Z => md_out
	);
	
	mb_outt <= bus_b_out;
	f_unit_data_out <= F_unit_out;

	 
end Behavioral;