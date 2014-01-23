----------------------------------------------------------------------------------
-- Company: 		 United States Air Force Academy Department of Electrical and Computer Engineering
-- Engineer: 		 Ian Goodbody
-- 
-- Create Date:    15:24:56 01/23/2014 
-- Design Name: 
-- Module Name:    Lab1_Goodbody - Behavioral 
-- Project Name: 	 Lab 1
-- Target Devices: Digilent NEXYS 2
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab1_Goodbody is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           X : out  STD_LOGIC;
           Y : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end Lab1_Goodbody;

architecture Behavioral of Lab1_Goodbody is

begin
	X <= A xor (B or C);
	Y <= B xor C;
	Z <= C;
end Behavioral;

