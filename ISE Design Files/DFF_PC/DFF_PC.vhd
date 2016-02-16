library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DFF_PC is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Preset : in  STD_LOGIC;
           Clear : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qnot : out  STD_LOGIC);
end DFF_PC;

architecture DFF_PC_arch of DFF_PC is
begin
	
	process (CLK, clear)
	begin
		if clear='0' then   
			Q <= '0';
		elsif (CLK'event and CLK='1') then 
			Q <= D;
		end if;
	end process;

end DFF_PC_arch;