
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY mult10 IS
	PORT (a : IN std_logic_vector(3 DOWNTO 0);  
         salida : OUT std_logic_vector(6 DOWNTO 0));
   END mult10;
 
ARCHITECTURE sol OF mult10 IS
	BEGIN
	salida <= conv_std_logic_vector(conv_integer(a) * 10, salida'length);
	
END sol;