
library ieee;
use ieee.std_logic_1164.all;

entity comp_igual4 is
port (A, B: in std_logic_vector(3 downto 0);
		Aigual: out std_logic);
end comp_igual4;

architecture sol of comp_igual4 is
begin
process(A, B)
begin
	if A=B then Aigual<='1';
	end if;
end process;
end sol;