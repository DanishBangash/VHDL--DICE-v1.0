----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:03 01/09/2011 
-- Design Name: 
-- Module Name:    activator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity activator is
    Port ( clk,button : in  STD_LOGIC;
           reset,enable : out  STD_LOGIC);
end activator;

architecture Behavioral of activator is

type stateType is (state1, state2, state3, state4);
signal crst, nxst : stateType;

begin

state_mem: process (clk,nxst)
	begin 
		if rising_edge(clk) then
			crst<=nxst;
		end if;
	end process state_mem;
	
next_state_output_logic: process (button,crst)
	begin
		case crst is
			when state1 => reset<='1'; enable<='0';
				if button='1' then
					nxst<=state2;
				else
					nxst<=state1;
				end if;
			
			when state2 => reset<='0'; enable<='1';
				if button='0' then
					nxst<=state3;
				else
					nxst<=state2;
				end if;
			
			when state3 => reset<='0'; enable<='0';
				if button='1' then
					nxst<=state4;
				else
					nxst<=state3;
				end if;
			
			when state4 => reset<='1'; enable<='0';
				if button='0' then
					nxst<=state1;
				else
					nxst<=state4;
				end if;
				
			when others => reset<='1'; enable<='0';
				nxst<=state1;
		end case;
	end process next_state_output_logic;

end Behavioral;

