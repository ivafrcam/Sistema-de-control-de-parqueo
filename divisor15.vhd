
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY divisor15 IS
	PORT (a : IN std_logic_vector(15 DOWNTO 0); 
			b : IN std_logic_vector(15 DOWNTO 0); 
         salida : OUT std_logic_vector(15 DOWNTO 0));
   END divisor15;
 
ARCHITECTURE sol OF divisor15 IS
	BEGIN
	salida <= conv_std_logic_vector(conv_integer(a) / conv_integer(b),salida'length) when b>"0000000000000000"	else "0000000000000000";
	
END sol;