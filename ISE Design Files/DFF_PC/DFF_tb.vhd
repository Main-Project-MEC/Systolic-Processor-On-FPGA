--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:17:16 02/14/2016
-- Design Name:   
-- Module Name:   E:/Works/GitHub/Systolic-Processor-On-FPGA/ISE Design Files/DFF_PC/DFF_tb.vhd
-- Project Name:  DFF_PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DFF_PC
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
 
ENTITY DFF_tb IS
END DFF_tb;
 
ARCHITECTURE behavior OF DFF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFF_PC
    PORT(
         D : IN  std_logic;
         CLK : IN  std_logic;
         Preset : IN  std_logic;
         Clear : IN  std_logic;
         Q : OUT  std_logic;
         Qnot : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Preset : std_logic := '0';
   signal Clear : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qnot : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFF_PC PORT MAP (
          D => D,
          CLK => CLK,
          Preset => Preset,
          Clear => Clear,
          Q => Q,
          Qnot => Qnot
        );

   -- Clock process definitions
   CLK_process :process
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
