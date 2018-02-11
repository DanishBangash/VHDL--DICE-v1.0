----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:10 01/09/2011 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    Port ( enable,reset,clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end counter;

architecture Behavioral of counter is

signal count: STD_LOGIC_VECTOR (2 downto 0);

begin
process(clk,enable,reset)
begin
	if reset='1' then
		count<="000";
	elsif rising_edge(clk) then
		if enable='1' then
			if count="110" then
				count<="001";
			else
			count<=count+"001";
			end if;
		end if;
	end if;
end process;
Q<=count;

end Behavioral;

