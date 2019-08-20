

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_sost4 is
	Port (ent: in STD_LOGIC_VECTOR(3 downto 0);
			clock, resetn, ld,  en: in STD_LOGIC;
			sal: out STD_LOGIC_VECTOR(3 downto 0));
end reg_sost4;

Architecture sol of reg_sost4 is
SIGNAL temp: STD_LOGIC_VECTOR(3 downto 0);
Begin
	process (clock, resetn)
	begin
		if resetn ='0' then temp <= "0000";
		elsif (clock'event and clock='1') then
			if ld = '1' then temp <= "0000";
			elsif en = '1' then temp <= ent;
			end if;
		end if;
	sal <= temp;
	end process;	
end sol;