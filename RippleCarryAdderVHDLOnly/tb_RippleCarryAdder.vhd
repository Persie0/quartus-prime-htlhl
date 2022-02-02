

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_RippleCarryAdder IS
END tb_RippleCarryAdder;
ARCHITECTURE RippleCarryAdder_arch OF tb_RippleCarryAdder IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CI : STD_LOGIC;
SIGNAL CO : STD_LOGIC;
SIGNAL SUM : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT RippleCarryAdder
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	CI : IN STD_LOGIC;
	CO : OUT STD_LOGIC;
	SUM : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RippleCarryAdder
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	CI => CI,
	CO => CO,
	SUM => SUM
	);
p_input: PROCESS
    BEGIN
        A <= "1111"; 
		  
		  B <= "0000";

		  wait for 100 ns;
		  B <= "0000";

		  wait;
    END PROCESS p_input;                                 
END RippleCarryAdder_arch;
