----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:12 01/09/2011 
-- Design Name: 
-- Module Name:    decoder - Behavioral 
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

entity decoder is
    Port ( Q : in  STD_LOGIC_VECTOR (2 downto 0);
           LEDs : out  STD_LOGIC_VECTOR (6 downto 0));
end decoder;

architecture Behavioral of decoder is

begin

LEDs<="0000000" when Q="000" else
		"1000000" when Q="001" else
		"0001100" when Q="010" else
		"1001100" when Q="011" else
		"0101101" when Q="100" else
		"1101101" when Q="101" else
		"0111111" when Q="110" else
		"0000000";

end Behavioral;

