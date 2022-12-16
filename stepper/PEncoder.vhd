library ieee;
use ieee.std_logic_1164.all;

entity PEncoder is
	port(
		Inp: in std_logic_vector(7 downto 0);
		Outp: out std_logic_vector(2 downto 0);
		GS: out std_logic
	);
end PEncoder;

architecture combinational of PEncoder is
	BEGIN
	Outp <= "111" when Inp(7) = '1' else
				  "110" when Inp(6) = '1' else
				  "101" when Inp(5) = '1' else
				  "100" when Inp(4) = '1' else
				  "011" when Inp(3) = '1' else
				  "010" when Inp(2) = '1' else
				  "001" when Inp(1) = '1' else
				  "000";
	GS <= '0' when (Inp = "00000000") else
		  '1';
end combinational;