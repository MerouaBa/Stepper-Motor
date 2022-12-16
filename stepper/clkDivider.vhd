library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clkDivider is
	port(
		clk, rst: in std_logic;
		divider: in std_logic_vector(2 downto 0);
		clkslow: out std_logic
	);
end clkDivider;

architecture arch of clkDivider is
	signal counter: unsigned(23 downto 0) := (others => '0');
	begin
	
	process(clk, rst) is	
	begin
		if (rst = '0') then
			counter <= (others => '0');
		elsif (clk'event and clk = '1') then
			if (counter = X"FFFFFF") then
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	--division selection
	with divider select
		clkslow <= counter(23) when "111",
				  counter(22) when "110",
				  counter(21) when "101",
				  counter(20) when "100",
				  counter(19) when "011",
				  counter(18) when "010",
				  counter(17) when "001",
				  counter(16) when "000";
end arch;