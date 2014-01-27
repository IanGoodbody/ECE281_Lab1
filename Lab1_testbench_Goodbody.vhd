--------------------------------------------------------------------------------
-- Company: United States Air Force Academy Department of Electrical and Computer Engineering
-- Engineer: 		Ian Goodbody
--
-- Create Date:   15:40:16 01/23/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Ian.Goodbody/Documents/Classes/ECE281/Lab1/Lab1_testbench_Goodbody.vhd
-- Project Name:  Lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab1_Goodbody
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Lab1_testbench_Goodbody IS
END Lab1_testbench_Goodbody;
 
ARCHITECTURE behavior OF Lab1_testbench_Goodbody IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab1_Goodbody
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         X : OUT  std_logic;
         Y : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal X : std_logic;
   signal Y : std_logic;
   signal Z : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab1_Goodbody PORT MAP (
          A => A,
          B => B,
          C => C,
          X => X,
          Y => Y,
          Z => Z
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		-- Input two's compliment binary 0
		A <= '0';
		B <= '0';
		C <= '0';
		wait for 100 ns;	
		
		-- Input two's compliment binary 1
		A <= '0';
		B <= '0';
		C <= '1';
		wait for 100 ns;	
		
		-- Input two's compliment binary 2
		A <= '0';
		B <= '1';
		C <= '0';
		wait for 100 ns;
		
		-- Input two's compliment binary 3
		A <= '0';
		B <= '1';
		C <= '1';
		wait for 100 ns;
		
		-- Input two's compliment binary -4
		A <= '1';
		B <= '0';
		C <= '0';
		wait for 100 ns;
		
		-- Input two's compliment binary -3
		A <= '1';
		B <= '0';
		C <= '1';
		wait for 100 ns;
		
		-- Input two's compliment binary -2
		A <= '1';
		B <= '1';
		C <= '0';
		wait for 100 ns;
		
		-- Input two's compliment binary -1
		A <= '1';
		B <= '1';
		C <= '1';

      wait;
   end process;

END;
