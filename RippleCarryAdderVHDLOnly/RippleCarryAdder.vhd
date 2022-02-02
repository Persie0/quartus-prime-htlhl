LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RippleCarryAdder IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		CI :  IN  STD_LOGIC;
		SUM :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		CO :  OUT  STD_LOGIC
	);
END RippleCarryAdder;


ARCHITECTURE RippleCarryAdder_arch OF RippleCarryAdder IS 

COMPONENT FullAdder
	PORT(
		CI, A, B : IN STD_LOGIC;
		SUM, CO : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	carry01 :  STD_LOGIC;
SIGNAL	carry12 :  STD_LOGIC;
SIGNAL	carry23 :  STD_LOGIC;


BEGIN 
FA0 : FullAdder PORT MAP(
		 CI => CI,
		 A => A(0),
		 B => B(0),
		 SUM => SUM(0),
		 CO => carry01
);


FA1 : FullAdder
PORT MAP(
		 CI => carry01,
		 A => A(1),
		 B => B(1),
		 SUM => SUM(1),
		 CO => carry12);


FA2 : FullAdder
PORT MAP(CI => carry12,
		 A => A(2),
		 B => B(2),
		 SUM => SUM(2),
		 CO => carry23);


FA3 : FullAdder
PORT MAP(CI => carry23,
		 A => A(3),
		 B => B(3),
		 SUM => SUM(3),
		 CO => CO);

END RippleCarryAdder_arch;