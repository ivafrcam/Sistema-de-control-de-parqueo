
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY mult100 IS
	PORT (a : IN std_logic_vector(3 DOWNTO 0); 
         salida : OUT std_logic_vector(9 DOWNTO 0));
   END mult100;
 
ARCHITECTURE sol OF mult100 IS
	BEGIN
	salida <= conv_std_logic_vector(conv_integer(a) * 100, salida'length);
	
END sol;