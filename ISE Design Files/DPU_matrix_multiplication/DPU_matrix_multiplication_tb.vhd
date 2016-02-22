library ieee;
use ieee.std_logic_1164.all;

entity DPU_matrix_multiplication_tb is
end DPU_matrix_multiplication_tb;
 
architecture behavior of DPU_matrix_multiplication_tb is
	Component DPU_matrix_multiplication
		port(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         Aout : OUT  std_logic_vector(3 downto 0);
         Bout : OUT  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(9 downto 0)
        );
    end component;
    
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

   signal Aout : std_logic_vector(3 downto 0);
   signal Bout : std_logic_vector(3 downto 0);
   signal Result : std_logic_vector(9 downto 0);


   constant CLK_period : time := 10 ns;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DPU_matrix_multiplication PORT MAP (
          Ain => Ain,
          Bin => Bin,
          CLK => CLK,
          Aout => Aout,
          Bout => Bout,
          Result => Result
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
