
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec_bcd is
	Port (Ent: in STD_LOGIC_VECTOR(9 downto 0);
			Salida : OUT STD_LOGIC_VECTOR(3 downto 0));
end dec_bcd;

Architecture sol of dec_bcd is
signal Temp:STD_LOGIC_VECTOR(3 downto 0);
Begin
	process(Ent)
	Begin
		if Ent="0000000001" then Temp<="0001"; 
		elsif Ent="0000000010" then Temp<="0010";
		elsif Ent="0000000100" then Temp<="0011";
		elsif Ent="0000001000" then Temp<="0100";
		elsif Ent="0000010000" then Temp<="0101";
		elsif Ent="0000100000" then Temp<="0110";
		elsif Ent="0001000000" then Temp<="0111";
		elsif Ent="0010000000" then Temp<="1000";
		elsif Ent="0100000000" then Temp<="1001";
		elsif Ent="1000000000" then Temp<="1010";
		else Temp<="0000"; end if;
	end process;
	Salida<=Temp;
end sol;