--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:49:26 01/09/2011
-- Design Name:   
-- Module Name:   C:/Xilinx/10.1/Projects/Dice/dice/tst_dice.vhd
-- Project Name:  dice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dice
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tst_dice IS
END tst_dice;
 
ARCHITECTURE behavior OF tst_dice IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dice
    PORT(
         clk : IN  std_logic;
         button : IN  std_logic;
         LEDs : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal button : std_logic := '0';
	signal end_test : std_logic := '0';

 	--Outputs
   signal LEDs : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dice PORT MAP (
          clk => clk,
          button => button,
          LEDs => LEDs
        );

-- Clock process definitions
   clk_process :process
   begin
	while end_test='0' loop
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end loop;
	wait;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for clk_period*5;
		button<='1';
		wait for clk_period*10;
		button<='0';
		wait for clk_period*5;
		button<='1';
		wait for clk_period*5;
		button<='0';
		wait for clk_period*5;
		button<='1';
		wait for clk_period*5;
		
		end_test<='1';	

      wait;
   end process;

END;
