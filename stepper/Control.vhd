library ieee;
use ieee.std_logic_1164.all;
	
entity Control is
	port(
		clk,dir, rst: in std_logic;
		stepperDrive: out std_logic_vector(3 downto 0)
	);
end Control;

architecture arch of Control is
	type mystate is (S0, S1, S2, S3);
	signal PS: mystate := S0;
	BEGIN
	
	process(rst, clk) is
	begin
		if (rst = '0') then
			PS <= S0;
		elsif (clk'event AND clk = '1') then
			case (PS) is
				when S0 =>
					if (dir = '1') then
						PS <= S1;
					else
						PS <= S3;
					end if;
					stepperDrive <= "0101";
				when S1 =>
					if (dir = '1') then
						PS <= S2;
					else
						PS <= S0;
					end if;
					stepperDrive <= "0110";
				when S2 =>
					if (dir = '1') then
						PS <= S3;
					else
						PS <= S1;
					end if;
					stepperDrive <= "1010";
				when S3 =>
					if (dir = '1') then
						PS <= S0;
					else
						PS <= S2;
					end if;
					stepperDrive <= "1001";
				when others =>
					PS <= S0;
					stepperDrive <= "0000";
			end case;
		end if;
	end process;
end arch;