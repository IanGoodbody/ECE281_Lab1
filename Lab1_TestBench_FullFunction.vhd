--------------------------------------------------------------------------------
-- Company: United States Air Force Academy Department of Electrical and Computer Engineering
-- Engineer: 		Ian Goodbody
--
-- Create Date:   20:36:05 01/26/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Ian.Goodbody/Documents/Classes/ECE281/Lab1/Lab1_TestBench_FullFunction.vhd
-- Project Name:  Lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab1_FullFunction_Goodbody
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
--
-- Documentation: C2C Ryan Good showed me that indexes were noted parenteses () and 
-- not carrots <>. That infomation was also in the course text...
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Lab1_TestBench_FullFunction IS
END Lab1_TestBench_FullFunction;
 
ARCHITECTURE behavior OF Lab1_TestBench_FullFunction IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab1_FullFunction_Goodbody
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         X : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal X : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab1_FullFunction_Goodbody PORT MAP (
          A => A,
          X => X
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      
      -- insert stimulus here 
		A(0) <= '1';
		A(1) <= '0';
		A(2) <= '0';
		A(3) <= '0';
		A(4) <= '0';
		A(5) <= '0';
		A(6) <= '0';
		A(7) <= '0';
		
		wait for 100 ns;
		A(0) <= '1';
		A(1) <= '0';
		A(2) <= '1';
		A(3) <= '0';
		A(4) <= '1';
		A(5) <= '1';
		A(6) <= '0';
		A(7) <= '1';
		wait for 100 ns;
		
		A(0) <= '0';
		A(1) <= '0';
		A(2) <= '0';
		A(3) <= '0';
		A(4) <= '0';
		A(5) <= '0';
		A(6) <= '0';
		A(7) <= '1';
		wait for 100 ns;
		
		A(0) <= '1';
		A(1) <= '1';
		A(2) <= '1';
		A(3) <= '1';
		A(4) <= '1';
		A(5) <= '1';
		A(6) <= '1';
		A(7) <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
