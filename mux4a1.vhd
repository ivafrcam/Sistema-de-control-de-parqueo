
library ieee;
use ieee.std_logic_1164.all;

Entity mux4a1 is
PORT(	A, B: IN std_logic_vector(6 downto 0);
		C, D: in std_logic_vector(3 downto 0);
		S: IN std_logic_vector(1 downto 0);
		Q: OUT std_logic_vector(6 downto 0));
end mux4a1;

Architecture sol of mux4a1 is
Begin
	with S select
	Q <=	A when "00",
			B when "01",
			"000"&C when "10",
			"000"&D when "11";
end sol;