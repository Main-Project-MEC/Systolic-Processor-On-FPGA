--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:32:48 02/16/2016
-- Design Name:   
-- Module Name:   E:/Works/GitHub/Systolic-Processor-On-FPGA/ISE Design Files/PIPO10/PIPO10_tb.vhd
-- Project Name:  PIPO10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PIPO10
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
library ieee;
use ieee.std_logic_1164.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity PIPO10_tb is
end PIPO10_tb;
 
architecture behavior of PIPO10_tb is
	component PIPO10
   Port ( Rin, CLK, Preset, Clear : in  STD_LOGIC_VECTOR (9 downto 0);
           Rout : out  STD_LOGIC_VECTOR (9 downto 0));
   end component;
   
   signal Rin: std_logic_vector(9 downto 0);
	signal CLK,Preset,Clear : std_logic;
   signal Rout: std_logic_vector(9 downto 0);
   constant CLK_period : time := 10 ns;
	
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
