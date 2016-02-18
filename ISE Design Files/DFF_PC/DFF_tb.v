library ieee;
use ieee.std_logic_1164.all;
 
entity FA10_tb is
end FA10_tb;
 
architecture tb of FA10_tb is
 
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
	
	begin
	mapping: FA10 port map(A,B,Sout,Cout);