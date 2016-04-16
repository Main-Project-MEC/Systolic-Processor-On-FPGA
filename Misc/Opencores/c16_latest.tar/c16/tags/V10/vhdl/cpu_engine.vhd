library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.cpu_pack.ALL;

entity cpu_engine is
	PORT(	CLK_I    : in  std_logic;
			T2       : out std_logic;
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

			-- external memory
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
end cpu_engine;

architecture Behavioral of cpu_engine is

	COMPONENT memory
	PORT(	CLK_I : IN  std_logic;
			T2    : IN  std_logic;
			CE    : IN  std_logic;
			PC    : IN  std_logic_vector(15 downto 0);
			ADR   : IN  std_logic_vector(15 downto 0);
			WR    : IN  std_logic;
			WDAT  : IN  std_logic_vector(7 downto 0);

			OPC   : OUT std_logic_vector(7 downto 0);
			RDAT  : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT opcode_fetch
	PORT(	CLK_I  : IN  std_logic;
			T2     : IN  std_logic;
			CLR    : IN  std_logic;
			CE     : IN  std_logic;
			PC_OP  : IN  std_logic_vector(2 downto 0);
			JDATA  : IN  std_logic_vector(15 downto 0);
			RR     : IN  std_logic_vector(15 downto 0);
			RDATA  : IN  std_logic_vector(7 downto 0);
			PC     : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	COMPONENT opcode_decoder
	PORT(	CLK_I  : IN  std_logic;
			T2     : IN  std_logic;
			CLR    : IN  std_logic;
			CE     : IN  std_logic;
			OPCODE : in std_logic_vector(7 downto 0);
			OP_CYC : in cycle;
			INT    : in std_logic;
			RRZ    : in std_logic;

			OP_CAT : out op_category;

			-- select signals
			D_SX    : out std_logic_vector(1 downto 0);		-- ALU select X
			D_SY    : out std_logic_vector(3 downto 0);		-- ALU select Y
			D_OP    : out std_logic_vector(4 downto 0);		-- ALU operation
			D_SA    : out std_logic_vector(4 downto 0);		-- select address
			D_SMQ   : out std_logic;

			-- write enable/select signal
			D_WE_RR  : out std_logic;
			D_WE_LL  : out std_logic;
			D_WE_M   : out std_logic;
			D_WE_SP  : out SP_OP;

			-- input/output
			IO_RD    : out std_logic;
			IO_WR    : out std_logic;

			PC_OP  : out std_logic_vector(2 downto 0);

			LAST_M : out std_logic;
			HLT    : out std_logic
		);
	END COMPONENT;

	COMPONENT data_core
	PORT(	CLK_I : in  std_logic;
			T2    : in  std_logic;
			CLR   : in  std_logic;
			CE    : in  std_logic;

			-- select signals
			SX    : in  std_logic_vector( 1 downto 0);
			SY    : in  std_logic_vector( 3 downto 0);
			OP    : in  std_logic_vector( 4 downto 0);		-- alu op
			PC    : in  std_logic_vector(15 downto 0);		-- PC
			QU    : in  std_logic_vector( 3 downto 0);		-- quick operand
			SA    : in  std_logic_vector(4 downto 0);			-- select address
			SMQ   : in  std_logic;							-- select MQ (H/L)

			-- write enable/select signal
			WE_RR  : in  std_logic;
			WE_LL  : in  std_logic;
			WE_SP  : in  SP_OP;

			-- data in signals
			IMM : in  std_logic_vector(15 downto 0);		-- immediate data
			M_RDAT : in  std_logic_vector( 7 downto 0);		-- memory data

			-- memory control signals
			ADR   : out std_logic_vector(15 downto 0);
			MQ    : out std_logic_vector( 7 downto 0);

			-- input/output
			IO_RDAT  : in  std_logic_vector( 7 downto 0);

			Q_RR  : out std_logic_vector(15 downto 0);
			Q_LL  : out std_logic_vector(15 downto 0);
			Q_SP  : out std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	-- global signals
	signal CE      : std_logic;
	signal LT2     : std_logic;

	-- memory signals
	signal	MEM_WDAT : std_logic_vector(7 downto 0);
	signal	MEM_RDAT : std_logic_vector(7 downto 0);
	signal	M_PC     : std_logic_vector(15 downto 0);
	signal	M_OPC    : std_logic_vector(7 downto 0);

	-- decoder signals
	--
	signal	D_CAT    : op_category;
	signal	D_OPC    : std_logic_vector(7 downto 0);
	signal	D_CYC    : cycle;          
	signal	D_PC     : std_logic_vector(15 downto 0);	-- debug signal
	signal	D_PC_OP  : std_logic_vector( 2 downto 0);
	signal	D_LAST_M : std_logic;
	signal	D_IO_RD  : std_logic;
	signal	D_IO_WR  : std_logic;
	-- select signals
	signal	D_SX    : std_logic_vector(1 downto 0);
	signal	D_SY    : std_logic_vector(3 downto 0);
	signal	D_OP    : std_logic_vector(4 downto 0);
	signal	D_SA    : std_logic_vector(4 downto 0);
	signal	D_SMQ   : std_logic;
	-- write enable/select signals
	signal	D_WE_RR  : std_logic;
	signal	D_WE_LL  : std_logic;
	signal	D_WE_SP  : SP_OP;
	signal	D_MEM_WE : std_logic;
	signal	MEM_WE   : std_logic;

	-- core signals
	--
	signal	C_IMM  : std_logic_vector(15 downto 0);
	signal	ADR    : std_logic_vector(15 downto 0);

	signal	C_CYC    : cycle;								-- debug signal
	signal	C_PC     : std_logic_vector(15 downto 0);		-- debug signal
	signal	C_OPC    : std_logic_vector( 7 downto 0);		-- debug signal
	signal	C_RR     : std_logic_vector(15 downto 0);
												 
	signal	RRZ      : std_logic;
	signal	OC_JD    : std_logic_vector(15 downto 0);
	signal	C_MQ     : std_logic_vector(7 downto 0);

	-- select signals
	signal	C_SX     : std_logic_vector(1 downto 0);
	signal	C_SY     : std_logic_vector(3 downto 0);
	signal	C_OP     : std_logic_vector(4 downto 0);
	signal	C_SA     : std_logic_vector(4 downto 0);
	signal	C_SMQ    : std_logic;
	signal	C_WE_RR  : std_logic;
	signal	C_WE_LL  : std_logic;
	signal	C_WE_SP  : SP_OP;

	signal XM_OPC    : std_logic_vector(7 downto 0);
	signal LM_OPC    : std_logic_vector(7 downto 0);
	signal LM_RDAT   : std_logic_vector(7 downto 0);
	signal LXM_RDAT   : std_logic_vector(7 downto 0);
	signal OPCS      : std_logic;
	signal RDATS     : std_logic;

begin

	memo: memory
	PORT MAP(	CLK_I => CLK_I,
				T2    => LT2,
				CE    => CE,

				-- read in T1
				PC    => M_PC,
				OPC   => LM_OPC,

				-- read or written in T2
				ADR   => ADR,
				WR    => MEM_WE,
				WDAT  => MEM_WDAT,
				RDAT  => LM_RDAT
			);

	ocf: opcode_fetch
	 PORT MAP(	CLK_I    => CLK_I,
				T2       => LT2,
				CLR      => CLR,
				CE       => CE,
				PC_OP    => D_PC_OP,
				JDATA    => OC_JD,
				RR       => C_RR,
				RDATA    => MEM_RDAT,
				PC       => M_PC
			);

	opdec: opcode_decoder
	PORT MAP(	CLK_I    => CLK_I,
				T2       => LT2,
				CLR      => CLR,
				CE       => CE,
				OPCODE  => D_OPC,
				OP_CYC  => D_CYC,
				INT     => INT,
				RRZ     => RRZ,

				OP_CAT  => D_CAT,
				-- select signals
				D_SX    => D_SX,
				D_SY    => D_SY,
				D_OP    => D_OP,
				D_SA    => D_SA,
				D_SMQ   => D_SMQ,

				-- write enable/select signal
				D_WE_RR => D_WE_RR,
				D_WE_LL => D_WE_LL,
				D_WE_M  => D_MEM_WE,
				D_WE_SP => D_WE_SP,

				IO_RD   => D_IO_RD,
				IO_WR   => D_IO_WR,

				PC_OP   => D_PC_OP,
				LAST_M  => D_LAST_M,
				HLT     => HALT
	);

	dcore: data_core
	PORT MAP(	CLK_I  => CLK_I,
				T2     => LT2,
				CLR    => CLR,
				CE     => CE,

				-- select signals
				SX     => C_SX,
				SY     => C_SY,
				OP     => C_OP,
				PC     => C_PC,
				QU     => C_OPC(3 downto 0),
				SA     => C_SA,
				SMQ    => C_SMQ,

				-- write enable/select signal
				WE_RR  => C_WE_RR,
				WE_LL  => C_WE_LL,
				WE_SP  => C_WE_SP,

				IMM    => C_IMM,
				M_RDAT   => MEM_RDAT,
				ADR    => ADR,
				MQ     => MEM_WDAT,

				IO_RDAT => IO_RDAT,

				Q_RR   => C_RR,
				Q_LL   => Q_LL,
				Q_SP   => Q_SP
	);

	CE     <= '1';
	T2     <= LT2;

	IO_ADR <= ADR(7 downto 0);
	Q_RR   <= C_RR;
	RRZ    <= '1' when (C_RR = X"0000") else '0';
	OC_JD  <= M_OPC & C_IMM(7 downto 0);

	Q_PC   <= C_PC;
	Q_OPC  <= C_OPC;
	Q_CYC  <= C_CYC;
	Q_IMM  <= C_IMM;

	-- select signals
	Q_SX    <= C_SX;
	Q_SY    <= C_SY;
	Q_OP    <= C_OP;
	Q_SA    <= C_SA;
	Q_SMQ   <= C_SMQ;

	-- write enable/select signal
	Q_WE_RR <= C_WE_RR;
	Q_WE_LL <= C_WE_LL;
	Q_WE_SP <= C_WE_SP;

	XM_WDAT  <= MEM_WDAT;

	process(CLK_I)
	begin
		if (rising_edge(CLK_I)) then
			LT2 <= not LT2;
		end if;
	end process;

	process(CLK_I)
	begin
		if (rising_edge(CLK_I)) then
			if (LT2 = '1') then
				RDATS    <= ADR(15) or ADR(14) or ADR(13);
				LXM_RDAT <= XM_RDAT;
			end if;
		end if;
	end process;

	process(CLK_I)
	begin
		if (rising_edge(CLK_I)) then
			if (LT2 = '0') then
				OPCS   <= M_PC(15) or M_PC(14) or M_PC(13);
				XM_OPC <= XM_RDAT;
			end if;
		end if;
	end process;

	process(OPCS, LM_OPC, XM_OPC)
	begin
		if (OPCS = '0') then	M_OPC <= LM_OPC;
		else   					M_OPC <= XM_OPC;
		end if;
	end process;

	process(RDATS, LXM_RDAT, LM_RDAT)
	begin
		if (RDATS = '0') then	MEM_RDAT <= LM_RDAT;
		else   					MEM_RDAT <= LXM_RDAT;
		end if;
	end process;

	process(LT2, M_PC, ADR, MEM_WE)
	begin
		if (LT2 = '0') then		-- opcode fetch
			XM_ADR   <= M_PC;
			XM_WE    <= '0';
			XM_CE    <= M_PC(15) or M_PC(14) or M_PC(13);
		else					-- data
			XM_ADR   <= ADR;
			XM_WE    <= MEM_WE;
			XM_CE    <= ADR(15) or ADR(14) or ADR(13);
		end if;
	end process;

	process(CLK_I)
	begin
		if (rising_edge(CLK_I)) then
			if (LT2 = '1') then
				if (CLR = '1') then
					D_PC  <= X"0000";
					D_OPC  <= X"01";
					D_CYC  <= M1;

					C_PC  <= X"0000";
					C_OPC <= X"01";
					C_CYC <= M1;
					C_IMM <= X"FFFF";

					C_SX    <= "00";
					C_SY    <= "0000";
					C_OP    <= "00000";
					C_SA    <= "00000";
					C_SMQ   <= '0';
					C_WE_RR <= '0';
					C_WE_LL <= '0';
					C_WE_SP <= SP_NOP;
					MEM_WE  <= '0';

				elsif (CE = '1') then
					C_CYC    <= D_CYC;
					Q_CAT    <= D_CAT;
					C_PC     <= D_PC;
					C_OPC    <= D_OPC;
					C_SX     <= D_SX;
					C_SY     <= D_SY;
					C_OP     <= D_OP;
					C_SA     <= D_SA;
					C_SMQ    <= D_SMQ;
					C_WE_RR  <= D_WE_RR;
					C_WE_LL  <= D_WE_LL;
					C_WE_SP  <= D_WE_SP;
					IO_RD    <= D_IO_RD;
					IO_WR    <= D_IO_WR;
					MEM_WE   <= D_MEM_WE;

					if (D_LAST_M = '1') then	-- D goes to M1
						-- signals valid for entire opcode...
						D_OPC <= M_OPC;
						D_PC  <= M_PC;
						D_CYC <= M1;
					else 
						case D_CYC is
							when M1 =>	D_CYC <= M2;	-- C goes to M1
										C_IMM <= X"00" & M_OPC;
							when M2 =>	D_CYC <= M3;
										C_IMM(15 downto 8) <= M_OPC;
							when M3 =>	D_CYC <= M4;
							when M4 =>	D_CYC <= M5;
							when M5 =>	D_CYC <= M1;
						end case;
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
