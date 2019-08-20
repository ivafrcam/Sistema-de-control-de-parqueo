library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity decoder_numero is
	Port (ent: in STD_LOGIC_VECTOR(3 downto 0);
			dispA : OUT STD_LOGIC_VECTOR(6 downto 0));
end decoder_numero;

Architecture sol of decoder_numero is
Begin
	process(Ent)
	begin
	end process;
			  --abcdefg
	dispA <=	"0000001"	when ent = "0000"  ELSE --0
				"1001111"  	when ent = "0001"  ELSE --1
				"0010010" 	when ent = "0010"  ELSE --2
				"0000110"	when ent = "0011"  ELSE --3
				"1001100"	when ent = "0100"  ELSE --4
				"0100100"	when ent = "0101"  ELSE --5
				"0100000"	when ent = "0110"  ELSE --6
				"0001111"	when ent = "0111"  ELSE --7
				"0000000"	when ent = "1000"  ELSE --8
				"0000100"	when ent = "1001"  ELSE --9
				"0000001";
		
end sol;