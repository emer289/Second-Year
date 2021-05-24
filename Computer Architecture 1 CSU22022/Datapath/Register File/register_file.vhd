library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
	Port(
	     Dsel : in std_logic_vector (4 downto 0);
	     TD : in std_logic;
         Asel : in std_logic_vector (4 downto 0);
         TA : in std_logic;
         Bsel : in std_logic_vector (4 downto 0);
         TB : in std_logic;
         clk : in std_logic;
		 load_enable : in std_logic;
		 D_data : in std_logic_vector (31 downto 0);
		 
		 A_out : out std_logic_vector (31 downto 0);
		 B_out : out std_logic_vector (31 downto 0)
		);
end register_file;

architecture Behavioral of register_file is
	component register_32
	Port(load : in std_logic;
	     clk : in std_logic;
		 D : in std_logic_vector (31 downto 0);
		 Q : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component multiplexer_2_to_32
    Port ( s : in  std_logic;
           in0 : in  std_logic_vector (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0)
           );
    end component;

	component multiplexer_32_to_32
	Port(s : in std_logic_vector (4 downto 0);
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
        z : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;

	component decoder_6_to_33
	Port(  s : in std_logic_vector(4 downto 0);
	       load_enable : in std_logic;
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
             Q32 : out std_logic
            );
	end component;
	signal da_out : std_logic_vector(32 downto 0);
    signal za, zb, reg0_out, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out,
    reg8_out, reg9_out, reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out,
    reg16_out, reg17_out, reg18_out, reg19_out, reg20_out, reg21_out, reg22_out, reg23_out,
        reg24_out, reg25_out, reg26_out, reg27_out, reg28_out, reg29_out, reg30_out, reg31_out, reg32_out: std_logic_vector(31 downto 0);

begin

	--register 0
reg00 : register_32 
Port Map( D => D_data,
         load => da_out(0),
         clk => clk,
         Q => reg0_out
        );
--register 1
reg01 : register_32 
Port Map( D => D_data,
        load => da_out(1),
         clk => clk,
         Q => reg1_out
        );
--register 2
reg02 : register_32 
Port Map( D => D_data,
        load => da_out(2),
         clk => clk,
         Q => reg2_out
        );
--register 3
reg03 : register_32 
Port Map( D => D_data,
        load => da_out(3),
         clk => clk,
         Q => reg3_out
        );
--register 4
reg04 : register_32 
Port Map( D => D_data,
        load => da_out(4),
         clk => clk,
         Q => reg4_out
        );
--register 5
reg05 : register_32 
Port Map( D => D_data,
        load => da_out(5),
         clk => clk,
         Q => reg5_out
        );
--register 6
reg06 : register_32 
Port Map( D => D_data,
        load => da_out(6),
         clk => clk,
         Q => reg6_out
        );
--register 7
reg07 : register_32 
Port Map( D => D_data,
        load => da_out(7),
        clk => clk,
         Q => reg7_out
        );
--register 8
reg08 : register_32 
Port Map( D => D_data,
        load => da_out(8),
         clk => clk,
         Q => reg8_out
        );
--register 9
reg09 : register_32 
Port Map( D => D_data,
        load => da_out(9),
         clk => clk,
         Q => reg9_out
        );
--register 10
reg010 : register_32 
Port Map( D => D_data,
        load => da_out(10),
         clk => clk,
         Q => reg10_out
        );
--register 11
reg011 : register_32 
Port Map( D => D_data,
        load => da_out(11),
         clk => clk,
         Q => reg11_out
        );
--register 12
reg012 : register_32 
Port Map( D => D_data,
        load => da_out(12),
        clk => clk,
         Q => reg12_out
        );
--register 13
reg013 : register_32 
Port Map( D => D_data,
        load => da_out(13),
        clk => clk,
         Q => reg13_out
        );
--register 14
reg014 : register_32 
Port Map( D => D_data,
        load => da_out(14),
        clk => clk,
         Q => reg14_out
        );
--register 15
reg015 : register_32 
Port Map( D => D_data,
        load => da_out(15),
        clk => clk,
         Q => reg15_out
        );
--register 16
reg016 : register_32 
Port Map( D => D_data,
        load => da_out(16),
        clk => clk,
         Q => reg16_out
        );
--register 17
reg017 : register_32 
Port Map( D => D_data,
        load => da_out(17),
        clk => clk,
         Q => reg17_out
        );
--register 18
reg018 : register_32 
Port Map( D => D_data,
        load => da_out(18),
        clk => clk,
         Q => reg18_out
        );
--register 19
reg019 : register_32 
Port Map( D => D_data,
        load => da_out(19),
        clk => clk,
         Q => reg19_out
        );
--register 20
reg020 : register_32 
Port Map( D => D_data,
        load => da_out(20),
        clk => clk,
         Q => reg20_out
        );
--register 21
reg021 : register_32 
Port Map( D => D_data,
        load => da_out(21),
        clk => clk,
         Q => reg21_out
        );
--register 22
reg022 : register_32 
Port Map( D => D_data,
        load => da_out(22),
        clk => clk,
         Q => reg22_out
        );
--register 23
reg023 : register_32 
Port Map( D => D_data,
        load => da_out(23),
        clk => clk,
         Q => reg23_out
        );
--register 24
reg024 : register_32 
Port Map( D => D_data,
        load => da_out(24),
        clk => clk,
         Q => reg24_out
        );
--register 25
reg025 : register_32 
Port Map( D => D_data,
        load => da_out(25),
        clk => clk,
         Q => reg25_out
        );
--register 26
reg026 : register_32 
Port Map( D => D_data,
        load => da_out(26),
        clk => clk,
         Q => reg26_out
        );
--register 27
reg027 : register_32 
Port Map( D => D_data,
        load => da_out(27),
        clk => clk,
         Q => reg27_out
        );
--register 28 
reg028 : register_32 
Port Map( D => D_data,
        load => da_out(28),
        clk => clk,
         Q => reg28_out
        );
--register 29
reg029 : register_32 
Port Map( D => D_data,
        load => da_out(29),
        clk => clk,
         Q => reg29_out
        );
--register 30
reg030 : register_32 
Port Map( D => D_data,
        load => da_out(30),
        clk => clk,
         Q => reg30_out
        );
--register 31
reg031 : register_32 
Port Map( D => D_data,
        load => da_out(31),
        clk => clk,
         Q => reg31_out
        );
        
--register 32
reg032 : register_32
Port Map( D => D_data,
load => da_out(32),
clk => clk,
Q => reg32_out
        );

	destination_decoder_6_to_33 : decoder_6_to_33 
	Port Map(
	         load_enable => load_enable,  
	         s => dsel,
	         td => TD,
			 Q0 => da_out(0),
			 Q1 => da_out(1),
			 Q2 => da_out(2),
			 Q3 => da_out(3),
			 Q4 => da_out(4),
			 Q5 => da_out(5),
			 Q6 => da_out(6),
			 Q7 => da_out(7),
			 Q8 => da_out(8),
             Q9 => da_out(9),
             Q10 => da_out(10),
             Q11 => da_out(11),
             Q12 => da_out(12),
             Q13 => da_out(13),
             Q14 => da_out(14),
             Q15 => da_out(15),
             Q16 => da_out(16),
             Q17 => da_out(17),
             Q18 => da_out(18),
             Q19 => da_out(19),
             Q20 => da_out(20),
             Q21 => da_out(21),
             Q22 => da_out(22),
             Q23 => da_out(23),
             Q24 => da_out(24),
             Q25 => da_out(25),
             Q26 => da_out(26),
             Q27 => da_out(27),
             Q28 => da_out(28),
             Q29 => da_out(29),
             Q30 => da_out(30),
             Q31 => da_out(31),
             Q32 => da_out(32)
			);


	a_multiplexer_32_to_32 : multiplexer_32_to_32
	Port Map(in0 => reg0_out,
			 in1 => reg1_out,
			 in2 => reg2_out,
			 in3 => reg3_out,
			 in4 => reg4_out,
			 in5 => reg5_out,
			 in6 => reg6_out,
			 in7 => reg7_out,
			 in8 => reg8_out,
             in9 => reg9_out,
             in10 => reg10_out,
             in11 => reg11_out,
             in12 => reg12_out,
             in13 => reg13_out,
             in14 => reg14_out,
             in15 => reg15_out,
             in16 => reg16_out,
             in17 => reg17_out,
             in18 => reg18_out,
             in19 => reg19_out,
             in20 => reg20_out,
             in21 => reg21_out,
             in22 => reg22_out,
             in23 => reg23_out,
             in24 => reg24_out,
             in25 => reg25_out,
             in26 => reg26_out,
             in27 => reg27_out,
             in28 => reg28_out,
             in29 => reg29_out,
             in30 => reg30_out,
             in31 => reg31_out,
			 s => Asel,
             z => za
			);
			
	a_multiplexer_2_to_32 : multiplexer_2_to_32
	       Port Map(s => TA,
	                 in0 => za,
	                 in1 => reg32_out,
	                 z => A_out
	                 );  
	b_multiplexer_32_to_32 : multiplexer_32_to_32
            Port Map(in0 => reg0_out,
                     in1 => reg1_out,
                     in2 => reg2_out,
                     in3 => reg3_out,
                     in4 => reg4_out,
                     in5 => reg5_out,
                     in6 => reg6_out,
                     in7 => reg7_out,
                     in8 => reg8_out,
                     in9 => reg9_out,
                     in10 => reg10_out,
                     in11 => reg11_out,
                     in12 => reg12_out,
                     in13 => reg13_out,
                     in14 => reg14_out,
                     in15 => reg15_out,
                     in16 => reg16_out,
                     in17 => reg17_out,
                     in18 => reg18_out,
                     in19 => reg19_out,
                     in20 => reg20_out,
                     in21 => reg21_out,
                     in22 => reg22_out,
                     in23 => reg23_out,
                     in24 => reg24_out,
                     in25 => reg25_out,
                     in26 => reg26_out,
                     in27 => reg27_out,
                     in28 => reg28_out,
                     in29 => reg29_out,
                     in30 => reg30_out,
                     in31 => reg31_out,
                     s => Bsel,
                     z => zb
                    );
 b_multiplexer_2_to_32 : multiplexer_2_to_32
            Port Map(s => TB,
                     in0 => zb,
                     in1 => reg32_out,
                     z => B_out
                     );                


end Behavioral;


