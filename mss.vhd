
library ieee;
use ieee.std_logic_1164.all;

entity mss is
port(marcha, start, rstn, clk, parqueo, aceptar, salida, tecla, hayespacios, okpos, ocupadoout, listo, existe: in std_logic;
		ledamarillo, ledverde, ldn, en1, en2, en3, enmenos, ldmenos, ldpuesto, enpuesto, modo, ocupadoin, ledrojo, ledtransparente, enmas, sel, enram, ldram, modo1, ldclave, enclave: out std_logic;
		estados: out std_logic_vector(4 downto 0));
		
end entity;

architecture comp of mss is
	type estado is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27);
	signal y: estado;
	
begin
	process(rstn, clk)
	begin
		if rstn = '0' then y <= s0;
		elsif (clk'event and clk = '1') then 
			case y is 
				
				when s0 => if marcha = '1' then y <= s1;
							  else y <= s0;
							  end if;
							  
				when s1 => if marcha = '1' then y <= s1;
							  else y <= s2;
							  end if;
				  
				when s2 => if start = '1' then y <= s3;
							  elsif start = '0' then 
								if salida = '0' then y <= s2;
								elsif salida = '1' then y <= s20;
								end if;
							  end if;
							  
			   when s3 => if start = '1' then y <= s3;
							  elsif start = '0' then 
								if hayespacios = '0' then y <= s2;
								elsif hayespacios = '1' then y <= s4;
								end if;
							  end if;
							  
				when s4 => if tecla = '1' then y <= s5;
							  else y <= s4;
							  end if;
							  
			   when s5 => if tecla = '1' then y <= s5;
							  else y <= s6;
							  end if;
							  
				when s6 => if okpos = '1' then y <= s7;
							  else y <= s4;
							  end if;	  
			  
				when s7 => if ocupadoout = '1' then y <= s4;
							  else y <= s8;
							  end if;			  
							  
				when s8 => if tecla = '1' then y <= s10;
							  elsif tecla = '0' then
								if parqueo = '0' then y <= s8;
								elsif parqueo = '1' then y <= s9;
								end if;
							  end if;
				
				when s10 => y <= s5;
				
				when s9 => if parqueo = '1' then y <= s9;
							  elsif parqueo = '0' then y <= s11;
							  end if;
							  
			   when s11 => if tecla = '1' then y <= s12;
								else y <= s11;
								end if;
								
				when s12 => if tecla = '1' then y <= s12;
								else y <= s13;
								end if; 
								
				when s13 => if tecla = '1' then y <= s14;
								else y <= s13;
								end if; 
								
				when s14 => if tecla = '1' then y <= s14;
								else y <= s15;
								end if; 
								
				when s15 => if tecla = '1' then y <= s16;
								else y <= s15;
								end if; 				
							
				when s16 => if tecla = '1' then y <= s16;
								else y <= s22;
								end if; 
								
				when s22 => if existe = '1' then y <= s11;
								elsif existe = '0' then
									if listo = '0' then y <= s22;
									elsif listo = '1' then y <= s17;
									end if;
								end if;
								
				when s17 => if aceptar = '1' then y <= s18;
								else y <= s17;
								end if; 	
					
				when s18 => if aceptar = '1' then y <= s18;
								else y <= s19;
								end if; 
							
				when s19 => y <= s2;
				
				when s20 => if salida = '1' then y <= s20;
						      elsif salida = '0' then y <= s21;
								end if;
											
				when s21 => if tecla = '1' then y <= s23;
								else y <= s21;
								end if;
				
				when s23 => if tecla = '1'then y <= s23;
								else y <= s24;
								end if;
								
				when s24 => if tecla = '1' then y <= s25;
								else y <= s24;
								end if;
								
				when s25 =>	if tecla  = '1' then y <= s25;
								else y <= s26;
								end if;
								
				when s26 =>	if tecla  = '1' then y <= s27;
								else y <= s26;	
								end if;
					
					
				when s27 =>	
			end case;
		end if;
	end process;
	
	process(y, tecla, start, hayespacios, parqueo, aceptar, ocupadoout, existe, listo)
	begin
		ledamarillo <= '0'; ledverde <= '0'; ldn <= '0'; en1 <= '0'; en2 <= '0'; en3 <= '0'; ldmenos <= '0'; enmenos <= '0';
		ldpuesto <= '0'; enpuesto <= '0'; estados <= "00000"; modo <= '0'; ocupadoin <= '0'; ledrojo <= '0'; ledtransparente <= '0';
		enmas <= '0';  sel <= '0'; enram <= '0'; ldram <= '0'; modo1 <= '0'; ldclave <= '0'; enclave<= '0';
		
		case y is 
		
			when s0 => ldn <= '1'; ldmenos <= '1'; ldpuesto <= '1'; ldram <= '1'; ldclave <= '1'; estados <= "00000";
			
			when s1 => estados <= "00001";
			
			when s2 => if start = '1' then 
							if hayespacios = '1' then ledamarillo <= '1';
							elsif hayespacios = '0' then ledrojo <= '1';
							end if;
						  end if; 
						  estados <= "00010";
						  
			when s3 => estados <= "00011";	  
			
			when s4 => if tecla = '1' then enpuesto <= '1';
						  end if;
						  estados <= "00100";	 
						  
		   when s5 => estados <= "00101";	
			
			when s6 => estados <= "00110";
						  
		   when s7 => if ocupadoout = '0' then modo <= '1'; ocupadoin <= '1';
						  end if;
						  estados <= "00111";
			
			when s8 => if tecla = '1'then modo <= '1';
						  elsif tecla = '0' then 
							if parqueo = '1' then ledverde <= '1'; 
							end if;
						  end if;
						  estados <= "01000";
						  
			when s9 => estados <= "01001";

			when s10 => enpuesto <= '1'; estados <= "01010";
			
			when s11 => if tecla = '1' then en1 <= '1';
							end if;
							estados <= "01011";
								
			when s12 => estados <= "01100";
							
			when s13 => if tecla = '1' then en2 <= '1';
							end if;
							estados <= "01101"; 
							
			when s14 => estados <= "01110"; 
							
			when s15 => if tecla = '1' then en3 <= '1';
							end if;
							estados <= "01111";		
						
			when s16 => enclave <= '1'; estados <= "10000"; 
							
			when s17 => if aceptar = '1' then enmenos <= '1';
							end if;
						   modo1 <= '1'; ldclave <= '1'; estados <= "10001"; 
				
			when s18 => if aceptar = '1'then ledverde <= '1'; 
							end if;
							estados <= "10010";
						
			when s19 => estados <= "10011";
			
			when s20 => estados <= "10100";
			
			when s21 => if tecla = '1' then en1 <= '1';
							end if;
							estados <= "10101";
			
			when s22 => if existe = '1' then ldram <= '1';
							elsif existe = '0' then
								if listo = '0' then enram <= '1';
								elsif listo = '1' then sel <= '0'; ldram <= '1'; 
								end if;
							end if;
						   sel <= '1'; estados <= "10110";
							
			when s23 => estados <= "10111";
			
			when s24 => if tecla = '1' then en2 <= '1';
							end if;
							estados <= "11000";
			
			when s25 => estados <= "11001";
			
			when s26 => if tecla = '1' then en3 <= '1';
							end if;
							estados <= "11010";
							
			when s27 => estados <= "11011";
			
			
			
		
			
		end case;
	end process;
end comp;