library ieee;
use ieee.std_logic_1164.all;
 
entity FA10_tb is
end FA10_tb;
 
architecture tb of FA10_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component FA10
    port(
         A : in  std_logic_vector(9 downto 0);
         B : in  std_logic_vector(9 downto 0);
         Sout : out  std_logic_vector(9 downto 0);
         Cout : out  std_logic
        );
    end component;
    
   signal A : std_logic_vector(9 downto 0);
   signal B : std_logic_vector(9 downto 0);
   signal Sout : std_logic_vector(9 downto 0);
   signal Cout : std_logic;
	
	signal i,j : integer;
	i<=0;
	j<=0;
	begin
	mapping: FA10 port map(A,B,Sout,Cin);
	
	process
	begin
		loop
			A(
 
end tb;