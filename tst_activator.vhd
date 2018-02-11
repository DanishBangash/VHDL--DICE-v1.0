--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:04:14 01/09/2011
-- Design Name:   
-- Module Name:   C:/Xilinx/10.1/Projects/Dice/dice/tst_activator.vhd
-- Project Name:  dice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: activator
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
 
ENTITY tst_activator IS
END tst_activator;
 
ARCHITECTURE behavior OF tst_activator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT activator
    PORT(
         clk : IN  std_logic;
         button : IN  std_logic;
         reset : OUT  std_logic;
         enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal button : std_logic := '0';
	signal end_test : std_logic := '0';

 	--Outputs
   signal reset : std_logic;
   signal enable : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: activator PORT MAP (
          clk => clk,
          button => button,
          reset => reset,
          enable => enable
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
		wait for clk_period*5;
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
