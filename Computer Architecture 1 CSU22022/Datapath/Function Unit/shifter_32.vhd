library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;
 
entity shifter_32 is
	Port(
		 B: in std_logic_vector (31 downto 0);
		 HS: in std_logic_vector (1 downto 0);
		 Lr: in std_logic;
		 Ll: in std_logic;
		 H: out std_logic_vector (31 downto 0)
	);
end shifter_32;
 
architecture Behavioral of shifter_32 is
 	component shifter
		Port( 
			 In0: in std_logic;
			 In1: in std_logic;
			 In2: in std_logic;
			 HS: in std_logic_vector(1 downto 0);
			 Z: out std_logic
		);
	end component;


 
begin
	 
	S0: shifter 
	Port Map(
			 In0 => B(0),
			 In1 => B(1),
			 In2 => Ll,
			 HS => HS,
			 Z => H(0)
	);
		
	S1: shifter 
	Port Map(
			 In0 => B(1),
			 In1 => B(2),
			 In2 => B(0),
			 HS => Hs,
			 Z => H(1)
	);
		
	S2: shifter 
	Port Map(
			 In0 => B(2),
			 In1 => B(3),
			 In2 => B(1),
			 HS => HS,
			 Z => H(2)
	);
		
	S3: shifter 
	Port Map(
			 In0 => B(3),
			 In1 => B(4),
			 In2 => B(2),
			 HS => HS,
			 Z => H(3)
	);

	S4: shifter 
	Port Map(
			 In0 => B(4),
			 In1 => B(5),
			 In2 => B(3),
			 HS => HS,
			 Z => H(4)
	);
		
	S5: shifter 
	Port Map(
			 In0 => B(5),
			 In1 => B(6),
			 In2 => B(4),
			 HS => HS,
			 Z => H(5)
	);
		
	S6: shifter 
	Port Map(
			 In0 => B(6),
			 In1 => B(7),
			 In2 => B(5),
			 HS => HS,
			 Z => H(6)
	);
		
	S7: shifter 
	Port Map(
			 In0 => B(7),
			 In1 => B(8),
			 In2 => B(6),
			 HS => HS,
			 Z => H(7)
	);
		
	S8: shifter 
	Port Map(
			 In0 => B(8),
			 In1 => B(9),
			 In2 => B(7),
			 HS => HS,
			 Z => H(8)
	);
		
	S9: shifter 
	Port Map(
			 In0 => B(9),
			 In1 => B(10),
			 In2 => B(8),
			 HS => HS,
			 Z => H(9)
	);

	S10: shifter 
	Port Map(
			 In0 => B(10),
			 In1 => B(11),
			 In2 => B(9),
			 HS => HS,
			 Z => H(10)
	);
		
	S11: shifter 
	Port Map(
			 In0 => B(11),
			 In1 => B(12),
			 In2 => B(10),
			 HS => HS,
			 Z => H(11)
	);
		
	S12: shifter 
	Port Map(
			 In0 => B(12),
			 In1 => B(13),
			 In2 => B(11),
			 HS => HS,
			 Z => H(12)
	);
	 
	S13: shifter 
	Port Map(
			 In0 => B(13),
			 In1 => B(14),
			 In2 => B(12),
			 HS => HS,
			 Z => H(13)
	);
		
	S14: shifter 
	Port Map(
			 In0 => B(14),
			 In1 => B(15),
			 In2 => B(13),
			 HS => HS,
			 Z => H(14)
	);
		
	S15: shifter 
	Port Map(
			 In0 => B(15),
			 In1 => B(16),
			 In2 => B(14),
			 HS => HS,
			 Z => H(15)
	);
	
	S16: shifter 
    Port Map(
             In0 => B(16),
             In1 => B(17),
             In2 => B(15),
             HS => HS,
             Z => H(16)
    );
        
    S17: shifter 
    Port Map(
             In0 => B(17),
             In1 => B(18),
             In2 => B(16),
             HS => HS,
             Z => H(17)
    );
        
    S18: shifter 
    Port Map(
             In0 => B(18),
             In1 => B(19),
             In2 => B(17),
             HS => HS,
             Z => H(18)
    );
        
    S19: shifter 
    Port Map(
             In0 => B(19),
             In1 => B(20),
             In2 => B(18),
             HS => HS,
             Z => H(19)
    );

    S20: shifter 
    Port Map(
             In0 => B(20),
             In1 => B(21),
             In2 => B(19),
             HS => HS,
             Z => H(20)
    );
        
    S21: shifter 
    Port Map(
             In0 => B(21),
             In1 => B(22),
             In2 => B(20),
             HS => HS,
             Z => H(21)
    );
        
    S22: shifter 
    Port Map(
             In0 => B(22),
             In1 => B(23),
             In2 => B(21),
             HS => HS,
             Z => H(22)
    );
        
    S23: shifter 
    Port Map(
             In0 => B(23),
             In1 => B(24),
             In2 => B(22),
             HS => HS,
             Z => H(23)
    );
        
    S24: shifter 
    Port Map(
             In0 => B(24),
             In1 => B(25),
             In2 => B(23),
             HS => HS,
             Z => H(24)
    );
        
    S25: shifter 
    Port Map(
             In0 => B(25),
             In1 => B(26),
             In2 => B(24),
             HS => HS,
             Z => H(25)
    );

    S26: shifter 
    Port Map(
             In0 => B(26),
             In1 => B(27),
             In2 => B(25),
             HS => HS,
             Z => H(26)
    );
        
    S27: shifter 
    Port Map(
             In0 => B(27),
             In1 => B(28),
             In2 => B(26),
             HS => HS,
             Z => H(27)
    );
        
    S28: shifter 
    Port Map(
             In0 => B(28),
             In1 => B(29),
             In2 => B(27),
             HS => HS,
             Z => H(28)
    );
     
    S29: shifter 
    Port Map(
             In0 => B(29),
             In1 => B(30),
             In2 => B(28),
             HS => HS,
             Z => H(29)
    );
        
    S30: shifter 
    Port Map(
             In0 => B(30),
             In1 => B(31),
             In2 => B(29),
             HS => HS,
             Z => H(30)
    );
        
    S31: shifter 
    Port Map(
             In0 => B(31),
             In1 => Lr,
             In2 => B(30),
             HS => HS,
             Z => H(31)
    );	
	
	 
end Behavioral;