entity Mux2to1_Nbit is
	generic(N : integer := 4); 
	port(
		D0, D1 : in STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
		S :  IN  STD_LOGIC;
		SUM :  OUT  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	);
END Mux2to1_Nbit;


ARCHITECTURE Mux2to1_Nbit_arch OF Mux2to1_Nbit IS 