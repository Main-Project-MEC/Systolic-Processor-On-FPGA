
-- VHDL Test Bench Created from source file cpu_engine.vhd -- 12:41:11 06/20/2003
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.cpu_pack.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT cpu_engine
	PORT(	CLK      : in  std_logic;
			CCK      : in  std_logic;
			CLR      : in  std_logic;
			Q_PC   : out std_logic_vector(15 downto 0);
			Q_OPC  : out std_logic_vector( 7 downto 0);
			Q_CAT  : out op_category;
			Q_IMM  : out std_logic_vector(15 downto 0);
			Q_CYC  : out cycle;

			-- input/output
			INT      : in  std_logic;
			IO_ADR   : out std_logic_vector(7 downto 0);
			IO_RD    : out std_logic;
			IO_WR    : out std_logic;
			IO_RDAT  : in  std_logic_vector( 7 downto 0);

			-- memory
			XM_ADR  : out std_logic_vector(15 downto 0);
			XM_RDAT : in  std_logic_vector( 7 downto 0);
			XM_WDAT : out std_logic_vector( 7 downto 0);
			XM_WE   : out std_logic;
			XM_CE   : out std_logic;

			-- select signals
			Q_SX    : out std_logic_vector(1 downto 0);
			Q_SY    : out std_logic_vector(3 downto 0);
			Q_OP    : out std_logic_vector(4 downto 0);
			Q_SA    : out std_logic_vector(4 downto 0);
			Q_SMQ   : out std_logic;

			-- write enable/select signal
			Q_WE_RR  : out std_logic;
			Q_WE_LL  : out std_logic;
			Q_WE_SP  : out SP_OP;

			Q_RR     : out std_logic_vector(15 downto 0);
			Q_LL     : out std_logic_vector(15 downto 0);
			Q_SP     : out std_logic_vector(15 downto 0);
			HALT       : out std_logic
		);
	END COMPONENT;

	signal	CLK      : std_logic;
	signal	CLR      : std_logic;
	signal	Q_PC   : std_logic_vector(15 downto 0);
	signal	Q_OPC  : std_logic_vector( 7 downto 0);
	signal	Q_CAT  : op_category;
	signal	Q_CYC  : cycle;
	signal	Q_IMM  : std_logic_vector(15 downto 0);

	signal	Q_SP     : std_logic_vector(15 downto 0);
	signal	Q_LL     : std_logic_vector(15 downto 0);
	signal	Q_RR     : std_logic_vector(15 downto 0);

	-- input/output
	signal	INT      : std_logic;
	signal	IO_RD    : std_logic;
	signal	IO_ADR   : std_logic_vector( 7 downto 0);
	signal	IO_WR    : std_logic;
	signal	IO_RDAT  : std_logic_vector( 7 downto 0);
	signal	HALT     : std_logic;

			-- memory
	signal	XM_ADR  : std_logic_vector(15 downto 0);
	signal	XM_RDAT : std_logic_vector( 7 downto 0);
	signal	XM_WDAT : std_logic_vector( 7 downto 0);
	signal	XM_WE   : std_logic;
	signal	XM_CE   : std_logic;

			-- select signals
	signal	Q_SX    : std_logic_vector(1 downto 0);
	signal	Q_SY    : std_logic_vector(3 downto 0);
	signal	Q_OP    : std_logic_vector(4 downto 0);
	signal	Q_SA    : std_logic_vector(4 downto 0);
	signal	Q_SMQ   : std_logic;

			-- write enable/select signal
	signal	Q_WE_RR  : std_logic;
	signal	Q_WE_LL  : std_logic;
	signal	Q_WE_SP  : SP_OP;

	signal clk_counter : INTEGER := 0;

BEGIN

	uut: cpu_engine PORT MAP(
		CLK        => CLK,
		CCK        => CLK,
		CLR        => CLR,
		Q_PC     => Q_PC,
		Q_OPC    => Q_OPC,
		Q_CAT    => Q_CAT,
		Q_IMM    => Q_IMM,
		Q_CYC    => Q_CYC,

		INT        => INT,
		IO_ADR     => IO_ADR,
		IO_RD      => IO_RD,
		IO_WR      => IO_WR,
		IO_RDAT    => IO_RDAT,

		XM_ADR     => XM_ADR,
		XM_RDAT    => XM_RDAT,
		XM_WDAT    => XM_WDAT,
		XM_WE      => XM_WE,
		XM_CE      => XM_CE,

		Q_SX     => Q_SX,
		Q_SY     => Q_SY,
		Q_OP     => Q_OP,
		Q_SA     => Q_SA,
		Q_SMQ    => Q_SMQ,

		Q_WE_RR  => Q_WE_RR,
		Q_WE_LL  => Q_WE_LL,
		Q_WE_SP  => Q_WE_SP,

		Q_RR     => Q_RR,
		Q_LL     => Q_LL,
		Q_SP     => Q_SP,
		HALT     => HALT
	);

-- *** Test Bench - User Defined Section ***
	PROCESS -- clock process for CLK,
	BEGIN
		CLOCK_LOOP : LOOP
			CLK <= transport '0';
			WAIT FOR 1 ns;
			CLK <= transport '1';
			WAIT FOR 1 ns;
			WAIT FOR 11 ns;
			CLK <= transport '0';
			WAIT FOR 12 ns;
		END LOOP CLOCK_LOOP;
	END PROCESS;

	PROCESS(CLK)
	BEGIN
		if (rising_edge(CLK)) then
			if (Q_CYC = M1) then
				CLK_COUNTER <= CLK_COUNTER + 1;
			end if;

			if (XM_ADR(0) = '0') then		IO_RDAT <= X"44";	-- data
			else							IO_RDAT <= X"01";	-- control
			end if;

			case CLK_COUNTER is
				when 0		=>	CLR <= '1';   INT <= '0';
				when 1		=>	CLR <= '0';
--				when 20		=>	INT <= '1';


				when 1000	=>	CLK_COUNTER <= 0;
								ASSERT (FALSE) REPORT
									"simulation done (no error)"
									SEVERITY FAILURE;
				when others	=>
			end case;
		end if;
	END PROCESS;

END;
