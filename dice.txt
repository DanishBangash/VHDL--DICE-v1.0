----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:35:43 01/09/2011 
-- Design Name: 
-- Module Name:    dice - Behavioral 
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

entity dice is
    Port ( clk,button : in  STD_LOGIC;
           LEDs : out  STD_LOGIC_VECTOR (6 downto 0));
end dice;

architecture Behavioral of dice is

	COMPONENT activator
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		reset : OUT std_logic;
		enable : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT counter
	PORT(
		enable : IN std_logic;
		reset : IN std_logic;
		clk : IN std_logic;          
		Q : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	
	COMPONENT decoder
	PORT(
		Q : IN std_logic_vector(2 downto 0);          
		LEDs : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

signal tmp_reset: std_logic;
signal tmp_enable: std_logic;
signal tmp_Q: std_logic_vector (2 downto 0);
begin


Inst_activator: activator PORT MAP(
		clk => clk,
		button => button,
		reset => tmp_reset,
		enable => tmp_enable
			
		
	);
	
Inst_counter: counter PORT MAP(
		enable => tmp_enable,
		reset => tmp_reset,
		clk => clk,
		Q => tmp_Q
	);
	
Inst_decoder: decoder PORT MAP(
		Q => tmp_Q,
		LEDs => LEDs
	);


end Behavioral;

