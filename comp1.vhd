

library ieee;
use ieee.std_logic_1164.all;

entity comp1 is
port (A, B: in std_logic;
		Aigual: out std_logic);
end comp1;

architecture sol of comp1 is
begin
process(A, B)
begin
	Aigual <='0';
	if A=B then Aigual<='1';
	end if;
end process;
end sol;