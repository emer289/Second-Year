library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_tb is
end datapath_tb;

architecture Behavioral of datapath_tb is
    component datapath is
        Port( 
                Data_in : in std_logic_vector(31 downto 0);
        const : in std_logic_vector(4 downto 0); 
        pc_in : in std_logic_vector(31 downto 0);
        
        
        AA : in std_logic_vector(4 downto 0);
        BA : in std_logic_vector(4 downto 0);
        DA : in std_logic_vector(4 downto 0);
        ta : in std_logic;
        tb : in std_logic;
        td : in std_logic;
        clk : in std_logic;
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
    
    -- inputs
    
    signal AA: std_logic_vector(4 downto 0) := "00000";
    signal BA: std_logic_vector(4 downto 0) := "00000";
    signal DA: std_logic_vector(4 downto 0) := "00000";
    
    signal mb, mm, tb, td, ta, clk: std_logic := '0'; 
    signal md: std_logic := '1'; 
    
    signal RW: std_logic := '1';
    signal FS: std_logic_vector(4 downto 0) := "00000";
    signal data_in: std_logic_vector(31 downto 0) := x"00000000";
    
    signal const: std_logic_vector(4 downto 0) := "00000";
    
    -- outputs
    
    signal mux_m_out: std_logic_vector(31 downto 0) := x"00000000";
    signal bus_B_data_out: std_logic_vector(31 downto 0) := x"00000000";
    signal F_unit_data_out, pc_in: std_logic_vector(31 downto 0) := x"00000000";
    
    signal Vout: std_logic := '0'; 
    signal Cout: std_logic := '0'; 
    signal Nout: std_logic := '0'; 
    signal Zout: std_logic := '0'; 
        
begin
    UUT: datapath
    Port Map(
             data_in => data_in,
    		 const => const,
    		 pc_in => pc_in,
    		 AA => AA,
    		 BA => BA,
    	 	 DA => DA,
    	 	 FS => FS,
    		 RW => RW,
    		 ta => ta,
    		 tb => tb,
    		 td => td,
    		 clk => clk,
    		 Vout => Vout,
    		 Cout => Cout,
    		 Nout => Nout,
    		 Zout => Zout,
    		 mb => mb,
    		 mm => mm,
    		 md => md,
    		 mux_m_out => mux_m_out,
    		 mb_outt => bus_B_data_out,
    		 
    		 f_unit_data_out => F_unit_data_out

    );
    
        
clk_process : process
begin 
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
end process;
    
    
    simulation_process: process
    begin
        
        -- Loading registers with values
        
        
        --reg1
        data_in <= x"000FF00B";
        DA <= "00001";
        wait for 100 ns;      
 
 
        --reg30
        data_in <= x"00000005";
        DA <= "11110";
        wait for 100 ns;

        -- seleting register 1
        AA <= "00001";
        wait for 100 ns;

        -- seleting register 30 
        BA <= "11110";
        wait for 100 ns;
        
       
       
        -- Test Arithmetic Unit 

        
        -- F = A = reg1 = 0x000ff00B
        FS <= "00000";
        wait for 100 ns;
        
        -- F = A + 1 = reg1 + 1 = 0x00FF00b + 0x00000001 = 0x000ff00c   
        FS <= "00001";
        wait for 100 ns;

        -- FS = 00010 F = A + B = reg1 + reg30 = 0x000FF00B + 0x00000005 = 0x000FF010   
        FS <= "00010";
        wait for 100 ns;        

        -- FS = 00011 F = A + B + 1 = reg1 + reg30 + 1 = 0x000FF00B + 0x00000005 + 0x0001= 0x000FF011  
        FS <= "00011";
        wait for 100 ns;
      
        -- FS = 00100 F = A + B' = reg1 + reg30' = 0x000FF00B + 0xFFFFFFFa = 0x000FF005    
        FS <= "00100";
        wait for 200 ns;
        
        -- F = A + B' + 1 = reg1 + reg30' = 0x00FF00B + 0xFFFFFFFa + 1 = 0x000FF006   
        FS <= "00101";
        wait for 100 ns;
        
        -- F = A-1 = reg1 - 1 = 0x000FF00B - 1 = 0x00FF00A   
        FS <= "00110";
        wait for 100 ns;

        -- F = A = reg1 = 0x000FF00B   
        FS <= "00111";
        wait for 100 ns;        

        -- Test Logic Unit
        
        -- F = A and B = reg1 AND reg30 = 0x000FF00B and 0x00000005 = 0x00000001    
        FS <= "01000";
        wait for 100 ns;
      
        -- F = A or B = reg1 OR reg30 = 0x000FF00B or 0x00000005 = 0x000FF00F   
        FS <= "01010";
        wait for 100 ns;
        
        -- F = A xor B = reg1 XOR reg30 = 0x000FF00B xor 0x00000005 = 0x000FF00E   
        FS <= "01100";
        wait for 100 ns;
        
        -- F = not A = NOT reg1 = not 0x000FF00B = 0xFFF00FF4    
        FS <= "01110";
        wait for 100 ns;
        
        
        -- Test Shifter
        
        
        -- F = B = reg30 = 0x00000005    
        FS <= "10000";
        wait for 100 ns;
      
        --F = sr B = >> reg30 = >> 0x00000005 = 0x00000002    
        FS <= "10100";
        wait for 100 ns;
        
        -- F = sl B = << reg30 = << 0x00000005 = 0x0000000a    
        FS <= "11000"; 
        wait for 100 ns;
        
        -- Test addition with constant

        -- F = const + A = 0x00000001 + 0x000FF00B = 0x000FF00C
        const <= "00001"; 
        mb <= '1';
        FS <= "00010";
        wait for 100 ns;
        
        --Test mux M
        -- mux_m_out = 0x22222222
        Pc_in <= x"22222222";
        mm <='1';
        wait for 100 ns;
        
        -- mux_m_out = A = 0x000FF00B
        mm <= '0';
        
        

     wait;           
     end process;
    
end Behavioral;