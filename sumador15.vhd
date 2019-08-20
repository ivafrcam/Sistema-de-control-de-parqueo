
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;
ENTITY sumador15 IS
	PORT (a : IN std_logic_vector(15 DOWNTO 0); 
         b : IN std_logic_vector(15 DOWNTO 0);  
         salida : OUT std_logic_vector(15 DOWNTO 0));
end sumador15;
ARCHITECTURE sol OF sumador15 IS
	BEGIN
		salida <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
END sol;