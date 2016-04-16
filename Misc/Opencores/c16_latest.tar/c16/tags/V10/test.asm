IN_RX_DATA		= 0x00		;
IN_STATUS		= 0x01		;
IN_TEMPERAT		= 0x02		;
IN_DIP_SWITCH		= 0x03		;
IN_CLK_CTR_LOW		= 0x05		;
IN_CLK_CTR_HIGH		= 0x06		;

MEMTOP	=0x2000

OUT_TX_DATA		= 0x00		;
OUT_LEDS		= 0x02		;
OUT_INT_MASK		= 0x03		;
OUT_RESET_TIMER		= 0x04		;
OUT_START_CLK_CTR	= 0x05		;
OUT_STOP_CLK_CTR	= 0x06		;
;---------------------------------------;
	MOVE	#MEMTOP, RR		;
	MOVE	RR, SP			;
	EI				;
	JMP	Cmain			;
	JMP	Cinterrupt		;
;---------------------------------------;
mult_div:				;
	MD_STP				; 1
	MD_STP				; 2
	MD_STP				; 3
	MD_STP				; 4
	MD_STP				; 5
	MD_STP				; 6
	MD_STP				; 7
	MD_STP				; 8
	MD_STP				; 9
	MD_STP				; 10
	MD_STP				; 11
	MD_STP				; 12
	MD_STP				; 13
	MD_STP				; 14
	MD_STP				; 15
	MD_STP				; 16
	RET				;
;---------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_in_buffer:			; 
	.BYTE	0			; VOID [0]
	.BYTE	0			; VOID [1]
	.BYTE	0			; VOID [2]
	.BYTE	0			; VOID [3]
	.BYTE	0			; VOID [4]
	.BYTE	0			; VOID [5]
	.BYTE	0			; VOID [6]
	.BYTE	0			; VOID [7]
	.BYTE	0			; VOID [8]
	.BYTE	0			; VOID [9]
	.BYTE	0			; VOID [10]
	.BYTE	0			; VOID [11]
	.BYTE	0			; VOID [12]
	.BYTE	0			; VOID [13]
	.BYTE	0			; VOID [14]
	.BYTE	0			; VOID [15]
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_in_get:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_in_put:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_in_length:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_in_overflow:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = rx_interrupt
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = rx_interrupt
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Crx_interrupt:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
	IN   (IN_RX_DATA), RU
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (serial_in_length)
;--	load_rr_var serial_in_length, (8 bit)
	MOVE	(Cserial_in_length), RU
;;;           } 5 Expression (variable name)
;--	l < r
	SLO	RR, #0x0010
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L2_else_1
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = serial_in_buffer
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr l[r]
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (serial_in_put)
;--	load_rr_var serial_in_put, (8 bit)
	MOVE	(Cserial_in_put), RU
;;;                   } 9 Expression (variable name)
;--	scale_rr *1
;--	add_address serial_in_buffer
	ADD	RR, #Cserial_in_buffer
;;;                 } 8 Expr l[r]
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RU
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = serial_in_put
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l & r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr ++r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (serial_in_put)
;--	load_rr_var serial_in_put, (8 bit)
	MOVE	(Cserial_in_put), RU
;;;                     } 10 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_put
	MOVE	R, (Cserial_in_put)
;;;                   } 9 Expr ++r
;--	l & r
	AND	RR, #0x000F
;;;                 } 8 Expr l & r
;--	store_rr_var serial_in_put
	MOVE	R, (Cserial_in_put)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (serial_in_length)
;--	load_rr_var serial_in_length, (8 bit)
	MOVE	(Cserial_in_length), RU
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_length
	MOVE	R, (Cserial_in_length)
;;;               } 7 Expr ++r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
;--	branch
	JMP	L2_endif_1
L2_else_1:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = serial_in_overflow
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 255 = 0xFF)
;--	load_rr_constant
	MOVE	#0x00FF, RR
;;;                 } 8 NumericExpression (constant 255 = 0xFF)
;--	store_rr_var serial_in_overflow
	MOVE	R, (Cserial_in_overflow)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L2_endif_1:
;;;       } 3 IfElseStatement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L2_return:
;--	pop 1 bytes
	ADD	SP, #1
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_out_buffer:			; 
	.BYTE	0			; VOID [0]
	.BYTE	0			; VOID [1]
	.BYTE	0			; VOID [2]
	.BYTE	0			; VOID [3]
	.BYTE	0			; VOID [4]
	.BYTE	0			; VOID [5]
	.BYTE	0			; VOID [6]
	.BYTE	0			; VOID [7]
	.BYTE	0			; VOID [8]
	.BYTE	0			; VOID [9]
	.BYTE	0			; VOID [10]
	.BYTE	0			; VOID [11]
	.BYTE	0			; VOID [12]
	.BYTE	0			; VOID [13]
	.BYTE	0			; VOID [14]
	.BYTE	0			; VOID [15]
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_out_get:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_out_put:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cserial_out_length:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = tx_interrupt
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = tx_interrupt
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Ctx_interrupt:
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (serial_out_length)
;--	load_rr_var serial_out_length, (8 bit)
	MOVE	(Cserial_out_length), RU
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L3_else_2
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l[r]
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = serial_out_buffer
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l[r]
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (serial_out_get)
;--	load_rr_var serial_out_get, (8 bit)
	MOVE	(Cserial_out_get), RU
;;;                   } 9 Expression (variable name)
;--	scale_rr *1
;--	add_address serial_out_buffer
	ADD	RR, #Cserial_out_buffer
;;;                 } 8 Expr l[r]
;--	content
	MOVE	(RR), RU
;;;               } 7 Expr l[r]
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
	OUT  R, (OUT_TX_DATA)
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = serial_out_get
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l & r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr ++r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (serial_out_get)
;--	load_rr_var serial_out_get, (8 bit)
	MOVE	(Cserial_out_get), RU
;;;                     } 10 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_out_get
	MOVE	R, (Cserial_out_get)
;;;                   } 9 Expr ++r
;--	l & r
	AND	RR, #0x000F
;;;                 } 8 Expr l & r
;--	store_rr_var serial_out_get
	MOVE	R, (Cserial_out_get)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr --r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (serial_out_length)
;--	load_rr_var serial_out_length, (8 bit)
	MOVE	(Cserial_out_length), RU
;;;                 } 8 Expression (variable name)
;--	--
	SUB	RR, #0x0001
;--	store_rr_var serial_out_length
	MOVE	R, (Cserial_out_length)
;;;               } 7 Expr --r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
;--	branch
	JMP	L3_endif_2
L3_else_2:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
	MOVE #0x05, RR
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
	OUT  R, (OUT_INT_MASK)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L3_endif_2:
;;;       } 3 IfElseStatement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L3_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cmilliseconds:			; 
	.WORD	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cseconds_low:			; 
	.WORD	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cseconds_mid:			; 
	.WORD	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cseconds_high:			; 
	.WORD	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cseconds_changed:			; 
	.BYTE	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = timer_interrupt
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = timer_interrupt
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Ctimer_interrupt:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	OUT  R, (OUT_RESET_TIMER)
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l == r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr ++r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (milliseconds)
;--	load_rr_var milliseconds, (16 bit)
	MOVE	(Cmilliseconds), RR
;;;             } 6 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var milliseconds
	MOVE	RR, (Cmilliseconds)
;;;           } 5 Expr ++r
;--	l == r
	SEQ	RR, #0x03E8
;;;         } 4 Expr l == r
;--	branch_false
	JMP	RRZ, L4_endif_3
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = milliseconds
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var milliseconds
	MOVE	RR, (Cmilliseconds)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = seconds_changed
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 255 = 0xFF)
;--	load_rr_constant
	MOVE	#0x00FF, RR
;;;                 } 8 NumericExpression (constant 255 = 0xFF)
;--	store_rr_var seconds_changed
	MOVE	R, (Cseconds_changed)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l == r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (seconds_low)
;--	load_rr_var seconds_low, (16 bit)
	MOVE	(Cseconds_low), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var seconds_low
	MOVE	RR, (Cseconds_low)
;;;                 } 8 Expr ++r
;--	l == r
	SEQ	RR, #0x0000
;;;               } 7 Expr l == r
;--	branch_false
	JMP	RRZ, L4_endif_4
;;;               { 7 CompoundStatement
;;;                 { 8 List<IfElseStatement>
;;;                   { 9 IfElseStatement
;;;                     { 10 Expr l == r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expr ++r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (seconds_mid)
;--	load_rr_var seconds_mid, (16 bit)
	MOVE	(Cseconds_mid), RR
;;;                         } 12 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var seconds_mid
	MOVE	RR, (Cseconds_mid)
;;;                       } 11 Expr ++r
;--	l == r
	SEQ	RR, #0x0000
;;;                     } 10 Expr l == r
;--	branch_false
	JMP	RRZ, L4_endif_5
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr ++r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (seconds_high)
;--	load_rr_var seconds_high, (16 bit)
	MOVE	(Cseconds_high), RR
;;;                         } 12 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var seconds_high
	MOVE	RR, (Cseconds_high)
;;;                       } 11 Expr ++r
;;;                     } 10 ExpressionStatement
L4_endif_5:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<IfElseStatement>
;;;               } 7 CompoundStatement
L4_endif_4:
;;;             } 6 IfElseStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L4_endif_3:
;;;       } 3 IfElseStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L4_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = interrupt
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = interrupt
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cinterrupt:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	MOVE RR, -(SP)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE LL, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE RR, -(SP)
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l & r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
	IN   (IN_STATUS), RU
;--	l & r
	AND	RR, #0x0010
;;;         } 4 Expr l & r
;--	branch_false
	JMP	RRZ, L5_endif_6
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = rx_interrupt
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;--	push 0 bytes
;--	call
	CALL	Crx_interrupt
;--	pop 0 bytes
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L5_endif_6:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l & r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
	IN   (IN_STATUS), RU
;--	l & r
	AND	RR, #0x0020
;;;         } 4 Expr l & r
;--	branch_false
	JMP	RRZ, L5_endif_7
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = tx_interrupt
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;--	push 0 bytes
;--	call
	CALL	Ctx_interrupt
;--	pop 0 bytes
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L5_endif_7:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l & r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
	IN   (IN_STATUS), RU
;--	l & r
	AND	RR, #0x0040
;;;         } 4 Expr l & r
;--	branch_false
	JMP	RRZ, L5_endif_8
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = timer_interrupt
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;--	push 0 bytes
;--	call
	CALL	Ctimer_interrupt
;--	pop 0 bytes
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L5_endif_8:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
	MOVE (SP)+, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE RR, LL
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE (SP)+, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	RETI
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L5_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = strlen
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = strlen
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = buffer
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cstrlen:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_POINTER
;;;         { 4 List<Ptr>
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;         } 4 List<Ptr>
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = from
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expression (variable name)
;;;         expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;       } 3 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L6_cont_9
L6_loop_9:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l - r
;;;             { 6 Expr ++r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;               } 7 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var buffer = 2(FP), SP at -2
	MOVE	RR, 4(SP)
;;;             } 6 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;           } 5 Expr l - r
;;;         } 4 ExpressionStatement
L6_cont_9:
;;;         { 4 Expr * r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	content
	MOVE	(RR), RS
;;;         } 4 Expr * r
;--	branch_true
	JMP	RRNZ, L6_loop_9
L6_brk_10:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expr l - r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (from)
;--	load_rr_var from = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;           } 5 Expression (variable name)
;--	scale_rr *1
;--	l - r
	SUB	LL, RR
;--	scale *1
;;;         } 4 Expr l - r
;--	branch
	JMP	L6_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L6_return:
;--	pop 2 bytes
	ADD	SP, #2
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = putchr
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = putchr
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = c
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cputchr:
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
L7_loop_11:
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L7_cont_11:
;;;         { 4 Expr l == r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (serial_out_length)
;--	load_rr_var serial_out_length, (8 bit)
	MOVE	(Cserial_out_length), RU
;;;           } 5 Expression (variable name)
;--	l == r
	SEQ	RR, #0x0010
;;;         } 4 Expr l == r
;--	branch_true
	JMP	RRNZ, L7_loop_11
L7_brk_12:
;;;       } 3 while Statement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned char (22000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = serial_out_buffer
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = 2(FP), SP at 0 (8 bit)
	MOVE	2(SP), RS
;;;           } 5 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           { 5 Expr l[r]
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (serial_out_put)
;--	load_rr_var serial_out_put, (8 bit)
	MOVE	(Cserial_out_put), RU
;;;             } 6 Expression (variable name)
;--	scale_rr *1
;--	add_address serial_out_buffer
	ADD	RR, #Cserial_out_buffer
;;;           } 5 Expr l[r]
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RU
;--	assign (8 bit)
	MOVE	R, (LL)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned char (22000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = serial_out_put
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l & r
;;;             { 6 TypeName (internal)
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned int (82000)
;;;               } 7 TypeSpecifier (all)
;;;             } 6 TypeName (internal)
;;;             { 6 Expr ++r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (serial_out_put)
;--	load_rr_var serial_out_put, (8 bit)
	MOVE	(Cserial_out_put), RU
;;;               } 7 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_out_put
	MOVE	R, (Cserial_out_put)
;;;             } 6 Expr ++r
;--	l & r
	AND	RR, #0x000F
;;;           } 5 Expr l & r
;--	store_rr_var serial_out_put
	MOVE	R, (Cserial_out_put)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr ++r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (serial_out_length)
;--	load_rr_var serial_out_length, (8 bit)
	MOVE	(Cserial_out_length), RU
;;;           } 5 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_out_length
	MOVE	R, (Cserial_out_length)
;;;         } 4 Expr ++r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	EI
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE #0x07, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	OUT  R, (OUT_INT_MASK)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;         } 4 NumericExpression (constant 1 = 0x1)
;;;       } 3 ExpressionStatement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L7_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = print_string
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = print_string
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = buffer
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cprint_string:
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L8_cont_13
L8_loop_13:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = putchr
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = char (20000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = c
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var buffer = 2(FP), SP at 0
	MOVE	RR, 2(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
;--	content
	MOVE	(RR), RS
;;;             } 6 Expr * r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L8_cont_13:
;;;         { 4 Expr * r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;           } 5 Expression (variable name)
;--	content
	MOVE	(RR), RS
;;;         } 4 Expr * r
;--	branch_true
	JMP	RRNZ, L8_loop_13
L8_brk_14:
;;;       } 3 while Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L8_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = print_hex
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = print_hex
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = dest
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = value
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = hex
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cprint_hex:
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x1000
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L9_endif_15
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = dest
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l[r]
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = const char (20100)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = hex
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;               { 7 Expr l[r]
;;;                 { 8 Expr l & r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr l >> r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l >> r
	ASR	RR, #0x000C
;;;                   } 9 Expr l >> r
;--	l & r
	AND	RR, #0x000F
;;;                 } 8 Expr l & r
;--	scale_rr *1
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (hex)
;--	load_rr_var hex = 6(FP), SP at -2 (16 bit)
	MOVE	8(SP), RR
;;;                 } 8 Expression (variable name)
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	+ (element)
	ADD	LL, RR
;;;               } 7 Expr l[r]
;--	content
	MOVE	(RR), RS
;;;             } 6 Expr l[r]
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
;;;             } 6 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L9_endif_15:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x0100
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L9_endif_16
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = dest
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l[r]
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = const char (20100)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = hex
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;               { 7 Expr l[r]
;;;                 { 8 Expr l & r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr l >> r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l >> r
	ASR	RR, #0x0008
;;;                   } 9 Expr l >> r
;--	l & r
	AND	RR, #0x000F
;;;                 } 8 Expr l & r
;--	scale_rr *1
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (hex)
;--	load_rr_var hex = 6(FP), SP at -2 (16 bit)
	MOVE	8(SP), RR
;;;                 } 8 Expression (variable name)
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	+ (element)
	ADD	LL, RR
;;;               } 7 Expr l[r]
;--	content
	MOVE	(RR), RS
;;;             } 6 Expr l[r]
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
;;;             } 6 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L9_endif_16:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x0010
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L9_endif_17
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = dest
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l[r]
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = const char (20100)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = hex
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;               { 7 Expr l[r]
;;;                 { 8 Expr l & r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr l >> r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l >> r
	ASR	RR, #0x0004
;;;                   } 9 Expr l >> r
;--	l & r
	AND	RR, #0x000F
;;;                 } 8 Expr l & r
;--	scale_rr *1
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (hex)
;--	load_rr_var hex = 6(FP), SP at -2 (16 bit)
	MOVE	8(SP), RR
;;;                 } 8 Expression (variable name)
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	+ (element)
	ADD	LL, RR
;;;               } 7 Expr l[r]
;--	content
	MOVE	(RR), RS
;;;             } 6 Expr l[r]
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
;;;             } 6 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L9_endif_17:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = dest
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l[r]
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = const char (20100)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = hex
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l[r]
;;;               { 7 Expr l & r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                 } 8 Expression (variable name)
;--	l & r
	AND	RR, #0x000F
;;;               } 7 Expr l & r
;--	scale_rr *1
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (hex)
;--	load_rr_var hex = 6(FP), SP at -2 (16 bit)
	MOVE	8(SP), RR
;;;               } 7 Expression (variable name)
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	+ (element)
	ADD	LL, RR
;;;             } 6 Expr l[r]
;--	content
	MOVE	(RR), RS
;;;           } 5 Expr l[r]
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           { 5 Expr * r
;;;             { 6 Expr l - r
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;               } 7 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;             } 6 Expr l - r
;;;           } 5 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = dest
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;           } 5 NumericExpression (constant 0 = 0x0)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L9_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = print_unsigned
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = print_unsigned
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = dest
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = value
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cprint_unsigned:
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x2710
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L10_endif_18
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = dest
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l + r
;;;                   { 9 Expr l / r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = unsigned int (82000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l / r
	MOVE	RR, LL
	MOVE	#0x2710, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                   } 9 Expr l / r
;--	l + r
	ADD	RR, #0x0030
;;;                 } 8 Expr l + r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expr l - r
;;;                     { 10 Expr ++r
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                       } 11 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                     } 10 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                   } 9 Expr l - r
;;;                 } 8 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l %= r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = value
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l % r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;--	l % r
	MOVE	RR, LL
	MOVE	#0x2710, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;                 } 8 Expr l % r
;--	store_rr_var value = 4(FP), SP at 0
	MOVE	RR, 4(SP)
;;;               } 7 Expr l %= r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L10_endif_18:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x03E8
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L10_endif_19
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = dest
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l + r
;;;                   { 9 Expr l / r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = unsigned int (82000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l / r
	MOVE	RR, LL
	MOVE	#0x03E8, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                   } 9 Expr l / r
;--	l + r
	ADD	RR, #0x0030
;;;                 } 8 Expr l + r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expr l - r
;;;                     { 10 Expr ++r
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                       } 11 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                     } 10 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                   } 9 Expr l - r
;;;                 } 8 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l %= r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = value
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l % r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;--	l % r
	MOVE	RR, LL
	MOVE	#0x03E8, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;                 } 8 Expr l % r
;--	store_rr_var value = 4(FP), SP at 0
	MOVE	RR, 4(SP)
;;;               } 7 Expr l %= r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L10_endif_19:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x0064
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L10_endif_20
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = dest
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l + r
;;;                   { 9 Expr l / r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = unsigned int (82000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l / r
	MOVE	RR, LL
	MOVE	#0x0064, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                   } 9 Expr l / r
;--	l + r
	ADD	RR, #0x0030
;;;                 } 8 Expr l + r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expr l - r
;;;                     { 10 Expr ++r
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                       } 11 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                     } 10 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                   } 9 Expr l - r
;;;                 } 8 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l %= r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = value
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l % r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;--	l % r
	MOVE	RR, LL
	MOVE	#0x0064, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;                 } 8 Expr l % r
;--	store_rr_var value = 4(FP), SP at 0
	MOVE	RR, 4(SP)
;;;               } 7 Expr l %= r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L10_endif_20:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l >= r
	SHS	RR, #0x000A
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L10_endif_21
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = dest
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l + r
;;;                   { 9 Expr l / r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = unsigned int (82000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;--	l / r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                   } 9 Expr l / r
;--	l + r
	ADD	RR, #0x0030
;;;                 } 8 Expr l + r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expr l - r
;;;                     { 10 Expr ++r
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                       } 11 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;                     } 10 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                   } 9 Expr l - r
;;;                 } 8 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l %= r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = value
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l % r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;--	l % r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;                 } 8 Expr l % r
;--	store_rr_var value = 4(FP), SP at 0
	MOVE	RR, 4(SP)
;;;               } 7 Expr l %= r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L10_endif_21:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = dest
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l + r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;             } 6 Expression (variable name)
;--	l + r
	ADD	RR, #0x0030
;;;           } 5 Expr l + r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           { 5 Expr * r
;;;             { 6 Expr l - r
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var dest = 2(FP), SP at -1
	MOVE	RR, 3(SP)
;;;               } 7 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;             } 6 Expr l - r
;;;           } 5 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = dest
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;           } 5 NumericExpression (constant 0 = 0x0)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (dest)
;--	load_rr_var dest = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L10_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = print_item
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = print_item
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = buffer
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = flags
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = sign
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = pad
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = alt
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = field_w
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = min_w
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = min_p
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cprint_item:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = filllen
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = signlen
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = altlen
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = padlen
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = buflen
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr l(r)
;;;         { 4 TypeName
;;;           { 5 TypeSpecifier (all)
;;;             spec = int (80000)
;;;           } 5 TypeSpecifier (all)
;;;           { 5 List<DeclItem>
;;;             { 6 DeclItem
;;;               what = DECL_NAME
;;;               name = strlen
;;;             } 6 DeclItem
;;;           } 5 List<DeclItem>
;;;         } 4 TypeName
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = buffer
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at -8 (16 bit)
	MOVE	10(SP), RR
;;;         } 4 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cstrlen
;--	pop 2 bytes
	ADD	SP, #2
;;;       } 3 Expr l(r)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = len
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = i
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expr l > r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (min_w)
;--	load_rr_var min_w = 11(FP), SP at -14 (16 bit)
	MOVE	25(SP), RR
;;;           } 5 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (buflen)
;--	load_rr_var buflen = -10(FP), SP at -14 (16 bit)
	MOVE	4(SP), RR
;;;           } 5 Expression (variable name)
;--	l > r
	SGT	LL, RR
;;;         } 4 Expr l > r
;--	branch_false
	JMP	RRZ, L11_endif_22
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = padlen
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l - r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (min_w)
;--	load_rr_var min_w = 11(FP), SP at -14 (16 bit)
	MOVE	25(SP), RR
;;;               } 7 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (buflen)
;--	load_rr_var buflen = -10(FP), SP at -14 (16 bit)
	MOVE	4(SP), RR
;;;               } 7 Expression (variable name)
;--	scale_rr *1
;--	l - r
	SUB	LL, RR
;--	scale *1
;;;             } 6 Expr l - r
;--	store_rr_var padlen = -8(FP), SP at -14
	MOVE	RR, 6(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L11_endif_22:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (sign)
;--	load_rr_var sign = 5(FP), SP at -14 (8 bit)
	MOVE	19(SP), RS
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L11_endif_23
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = signlen
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;             } 6 NumericExpression (constant 1 = 0x1)
;--	store_rr_var signlen = -4(FP), SP at -14
	MOVE	RR, 10(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L11_endif_23:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l && r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 IfElseStatement
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (alt)
;--	load_rr_var alt = 7(FP), SP at -14 (16 bit)
	MOVE	21(SP), RR
;;;             } 6 Expression (variable name)
;--	branch_false
	JMP	RRZ, L11_endif_25
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l & r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (flags)
;--	load_rr_var flags = 4(FP), SP at -14 (8 bit)
	MOVE	18(SP), RS
;;;                 } 8 Expression (variable name)
;--	l & r
	AND	RR, #0x0001
;;;               } 7 Expr l & r
;;;             } 6 ExpressionStatement
L11_endif_25:
;;;           } 5 IfElseStatement
;;;         } 4 Expr l && r
;--	branch_false
	JMP	RRZ, L11_endif_24
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = altlen
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l(r)
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = strlen
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = const char (20100)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_POINTER
;;;                       { 11 List<Ptr>
;;;                         { 12 Ptr
;;;                         } 12 Ptr
;;;                       } 11 List<Ptr>
;;;                     } 10 DeclItem
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = buffer
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (alt)
;--	load_rr_var alt = 7(FP), SP at -14 (16 bit)
	MOVE	21(SP), RR
;;;               } 7 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cstrlen
;--	pop 2 bytes
	ADD	SP, #2
;;;             } 6 Expr l(r)
;--	store_rr_var altlen = -6(FP), SP at -14
	MOVE	RR, 8(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L11_endif_24:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = len
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l + r
;;;             { 6 Expr l + r
;;;               { 7 Expr l + r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (signlen)
;--	load_rr_var signlen = -4(FP), SP at -14 (16 bit)
	MOVE	10(SP), RR
;;;                 } 8 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (altlen)
;--	load_rr_var altlen = -6(FP), SP at -14 (16 bit)
	MOVE	8(SP), RR
;;;                 } 8 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;               } 7 Expr l + r
;--	move_rr_to_ll
	MOVE	RR, LL
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (padlen)
;--	load_rr_var padlen = -8(FP), SP at -14 (16 bit)
	MOVE	6(SP), RR
;;;               } 7 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;             } 6 Expr l + r
;--	move_rr_to_ll
	MOVE	RR, LL
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (buflen)
;--	load_rr_var buflen = -10(FP), SP at -14 (16 bit)
	MOVE	4(SP), RR
;;;             } 6 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;           } 5 Expr l + r
;--	store_rr_var len = -12(FP), SP at -14
	MOVE	RR, 2(SP)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l & r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr ~ r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (flags)
;--	load_rr_var flags = 4(FP), SP at -14 (8 bit)
	MOVE	18(SP), RS
;;;             } 6 Expression (variable name)
;--	16 bit ~ r
	NOT	RR
;;;           } 5 Expr ~ r
;--	l & r
	AND	RR, #0x0002
;;;         } 4 Expr l & r
;--	branch_false
	JMP	RRZ, L11_endif_26
;;;         { 4 CompoundStatement
;;;           { 5 List<for Statement>
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = i
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (len)
;--	load_rr_var len = -12(FP), SP at -14 (16 bit)
	MOVE	2(SP), RR
;;;                   } 9 Expression (variable name)
;--	store_rr_var i = -14(FP), SP at -14
	MOVE	RR, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L11_tst_27
L11_loop_27:
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = putchr
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = false
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = char (20000)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = c
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (pad)
;--	load_rr_var pad = 6(FP), SP at -14 (8 bit)
	MOVE	20(SP), RS
;;;                   } 9 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                 } 8 Expr l(r)
;;;               } 7 ExpressionStatement
L11_cont_27:
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (i)
;--	load_rr_var i = -14(FP), SP at -14 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var i = -14(FP), SP at -14
	MOVE	RR, 0(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
L11_tst_27:
;;;               { 7 Expr l < r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (i)
;--	load_rr_var i = -14(FP), SP at -14 (16 bit)
	MOVE	0(SP), RR
;;;                 } 8 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (field_w)
;--	load_rr_var field_w = 9(FP), SP at -14 (16 bit)
	MOVE	23(SP), RR
;;;                 } 8 Expression (variable name)
;--	l < r
	SLT	LL, RR
;;;               } 7 Expr l < r
;--	branch_true
	JMP	RRNZ, L11_loop_27
L11_brk_28:
;;;             } 6 for Statement
;;;           } 5 List<for Statement>
;;;         } 4 CompoundStatement
L11_endif_26:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (sign)
;--	load_rr_var sign = 5(FP), SP at -14 (8 bit)
	MOVE	19(SP), RS
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L11_endif_29
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = putchr
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = char (20000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = c
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (sign)
;--	load_rr_var sign = 5(FP), SP at -14 (8 bit)
	MOVE	19(SP), RS
;;;             } 6 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L11_endif_29:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (alt)
;--	load_rr_var alt = 7(FP), SP at -14 (16 bit)
	MOVE	21(SP), RR
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L11_endif_30
;;;         { 4 CompoundStatement
;;;           { 5 List<IfElseStatement>
;;;             { 6 IfElseStatement
;;;               { 7 Expr l & r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (flags)
;--	load_rr_var flags = 4(FP), SP at -14 (8 bit)
	MOVE	18(SP), RS
;;;                 } 8 Expression (variable name)
;--	l & r
	AND	RR, #0x0001
;;;               } 7 Expr l & r
;--	branch_false
	JMP	RRZ, L11_endif_31
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = void (10000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = print_string
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = false
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = const char (20100)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_POINTER
;;;                           { 13 List<Ptr>
;;;                             { 14 Ptr
;;;                             } 14 Ptr
;;;                           } 13 List<Ptr>
;;;                         } 12 DeclItem
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = buffer
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (alt)
;--	load_rr_var alt = 7(FP), SP at -14 (16 bit)
	MOVE	21(SP), RR
;;;                   } 9 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cprint_string
;--	pop 2 bytes
	ADD	SP, #2
;;;                 } 8 Expr l(r)
;;;               } 7 ExpressionStatement
L11_endif_31:
;;;             } 6 IfElseStatement
;;;           } 5 List<IfElseStatement>
;;;         } 4 CompoundStatement
L11_endif_30:
;;;       } 3 IfElseStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = i
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;             } 6 NumericExpression (constant 0 = 0x0)
;--	store_rr_var i = -14(FP), SP at -14
	MOVE	RR, 0(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
;--	branch
	JMP	L11_tst_32
L11_loop_32:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = putchr
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = char (20000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = c
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (min_p)
;--	load_rr_var min_p = 13(FP), SP at -14 (8 bit)
	MOVE	27(SP), RS
;;;             } 6 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L11_cont_32:
;;;         { 4 Expr l - r
;;;           { 5 Expr ++r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (i)
;--	load_rr_var i = -14(FP), SP at -14 (16 bit)
	MOVE	0(SP), RR
;;;             } 6 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var i = -14(FP), SP at -14
	MOVE	RR, 0(SP)
;;;           } 5 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;         } 4 Expr l - r
L11_tst_32:
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (i)
;--	load_rr_var i = -14(FP), SP at -14 (16 bit)
	MOVE	0(SP), RR
;;;           } 5 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (padlen)
;--	load_rr_var padlen = -8(FP), SP at -14 (16 bit)
	MOVE	6(SP), RR
;;;           } 5 Expression (variable name)
;--	l < r
	SLT	LL, RR
;;;         } 4 Expr l < r
;--	branch_true
	JMP	RRNZ, L11_loop_32
L11_brk_33:
;;;       } 3 for Statement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = print_string
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = const char (20100)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_POINTER
;;;                   { 9 List<Ptr>
;;;                     { 10 Ptr
;;;                     } 10 Ptr
;;;                   } 9 List<Ptr>
;;;                 } 8 DeclItem
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = buffer
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (buffer)
;--	load_rr_var buffer = 2(FP), SP at -14 (16 bit)
	MOVE	16(SP), RR
;;;           } 5 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cprint_string
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l & r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (flags)
;--	load_rr_var flags = 4(FP), SP at -14 (8 bit)
	MOVE	18(SP), RS
;;;           } 5 Expression (variable name)
;--	l & r
	AND	RR, #0x0002
;;;         } 4 Expr l & r
;--	branch_false
	JMP	RRZ, L11_endif_34
;;;         { 4 CompoundStatement
;;;           { 5 List<for Statement>
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = i
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (len)
;--	load_rr_var len = -12(FP), SP at -14 (16 bit)
	MOVE	2(SP), RR
;;;                   } 9 Expression (variable name)
;--	store_rr_var i = -14(FP), SP at -14
	MOVE	RR, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L11_tst_35
L11_loop_35:
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = putchr
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = false
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = char (20000)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = c
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (pad)
;--	load_rr_var pad = 6(FP), SP at -14 (8 bit)
	MOVE	20(SP), RS
;;;                   } 9 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                 } 8 Expr l(r)
;;;               } 7 ExpressionStatement
L11_cont_35:
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (i)
;--	load_rr_var i = -14(FP), SP at -14 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var i = -14(FP), SP at -14
	MOVE	RR, 0(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
L11_tst_35:
;;;               { 7 Expr l < r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (i)
;--	load_rr_var i = -14(FP), SP at -14 (16 bit)
	MOVE	0(SP), RR
;;;                 } 8 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (field_w)
;--	load_rr_var field_w = 9(FP), SP at -14 (16 bit)
	MOVE	23(SP), RR
;;;                 } 8 Expression (variable name)
;--	l < r
	SLT	LL, RR
;;;               } 7 Expr l < r
;--	branch_true
	JMP	RRNZ, L11_loop_35
L11_brk_36:
;;;             } 6 for Statement
;;;           } 5 List<for Statement>
;;;         } 4 CompoundStatement
L11_endif_34:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (len)
;--	load_rr_var len = -12(FP), SP at -14 (16 bit)
	MOVE	2(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L11_return
;;;       } 3 return Statement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L11_return:
;--	pop 14 bytes
	ADD	SP, #14
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = printf
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = printf
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = true
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = const char (20100)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = format
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cprintf:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_POINTER
;;;         { 4 List<Ptr>
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;         } 4 List<Ptr>
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = args
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr l + r
;;;         { 4 Expr & r
;--	load_address format = 2(FP), SP at 0
	LEA	2(SP), RR
;;;         } 4 Expr & r
;--	l + r
	ADD	RR, #0x0002
;;;       } 3 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = len
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = flags
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = sign
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = pad
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_POINTER
;;;         { 4 List<Ptr>
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;         } 4 List<Ptr>
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = alt
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = field_w
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = min_w
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_POINTER
;;;         { 4 List<Ptr>
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;         } 4 List<Ptr>
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = which_w
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = buffer
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_ARRAY
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 12 bytes
	CLRW	-(SP)
	CLRW	-(SP)
	CLRW	-(SP)
	CLRW	-(SP)
	CLRW	-(SP)
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L12_cont_37
L12_loop_37:
;;;         { 4 CompoundStatement
;;;           { 5 List<IfElseStatement>
;;;             { 6 IfElseStatement
;;;               { 7 Expr l != r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -5(FP), SP at -28 (8 bit)
	MOVE	23(SP), RS
;;;                 } 8 Expression (variable name)
;--	l != r
	SNE	RR, #0x0025
;;;               } 7 Expr l != r
;--	branch_false
	JMP	RRZ, L12_endif_39
;;;               { 7 CompoundStatement
;;;                 { 8 List<ExpressionStatement>
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = len
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = putchr
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = false
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = c
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (c)
;--	load_rr_var c = -5(FP), SP at -28 (8 bit)
	MOVE	23(SP), RS
;;;                           } 13 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                         } 12 Expr l(r)
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L12_cont_37
;;;                   } 9 break/continue Statement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L12_endif_39:
;;;             } 6 IfElseStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = flags
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var flags = -6(FP), SP at -28
	MOVE	R, 22(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = sign
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var sign = -7(FP), SP at -28
	MOVE	R, 21(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = pad
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 32 = 0x20)
;--	load_rr_constant
	MOVE	#0x0020, RR
;;;                 } 8 NumericExpression (constant 32 = 0x20)
;--	store_rr_var pad = -8(FP), SP at -28
	MOVE	R, 20(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = field_w
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var field_w = -12(FP), SP at -28
	MOVE	RR, 16(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = min_w
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var min_w = -14(FP), SP at -28
	MOVE	RR, 14(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_POINTER
;;;                       { 11 List<Ptr>
;;;                         { 12 Ptr
;;;                         } 12 Ptr
;;;                       } 11 List<Ptr>
;;;                     } 10 DeclItem
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = which_w
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr & r
;--	load_address field_w = -12(FP), SP at -28
	LEA	16(SP), RR
;;;                 } 8 Expr & r
;--	store_rr_var which_w = -16(FP), SP at -28
	MOVE	RR, 12(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;               } 7 ExpressionStatement
L12_loop_40:
;;;               { 7 CompoundStatement
;;;                 { 8 List<SwitchStatement>
;;;                   { 9 SwitchStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = char (20000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = c
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr * r
;;;                         { 12 Expr l - r
;;;                           { 13 Expr ++r
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (format)
;--	load_rr_var format = 2(FP), SP at -28 (16 bit)
	MOVE	30(SP), RR
;;;                             } 14 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var format = 2(FP), SP at -28
	MOVE	RR, 30(SP)
;;;                           } 13 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                         } 12 Expr l - r
;--	content
	MOVE	(RR), RS
;;;                       } 11 Expr * r
;--	store_rr_var c = -5(FP), SP at -28
	MOVE	R, 23(SP)
;;;                     } 10 Expr l = r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	branch_case (8 bit)
	SEQ	LL, #0x0058
	JMP	RRNZ, L12_case_42_0058
;--	branch_case (8 bit)
	SEQ	LL, #0x0064
	JMP	RRNZ, L12_case_42_0064
;--	branch_case (8 bit)
	SEQ	LL, #0x0073
	JMP	RRNZ, L12_case_42_0073
;--	branch_case (8 bit)
	SEQ	LL, #0x0075
	JMP	RRNZ, L12_case_42_0075
;--	branch_case (8 bit)
	SEQ	LL, #0x0078
	JMP	RRNZ, L12_case_42_0078
;--	branch_case (8 bit)
	SEQ	LL, #0x0063
	JMP	RRNZ, L12_case_42_0063
;--	branch_case (8 bit)
	SEQ	LL, #0x0023
	JMP	RRNZ, L12_case_42_0023
;--	branch_case (8 bit)
	SEQ	LL, #0x002D
	JMP	RRNZ, L12_case_42_002D
;--	branch_case (8 bit)
	SEQ	LL, #0x0020
	JMP	RRNZ, L12_case_42_0020
;--	branch_case (8 bit)
	SEQ	LL, #0x002B
	JMP	RRNZ, L12_case_42_002B
;--	branch_case (8 bit)
	SEQ	LL, #0x002E
	JMP	RRNZ, L12_case_42_002E
;--	branch_case (8 bit)
	SEQ	LL, #0x0030
	JMP	RRNZ, L12_case_42_0030
;--	branch_case (8 bit)
	SEQ	LL, #0x0031
	JMP	RRNZ, L12_case_42_0031
;--	branch_case (8 bit)
	SEQ	LL, #0x0032
	JMP	RRNZ, L12_case_42_0032
;--	branch_case (8 bit)
	SEQ	LL, #0x0033
	JMP	RRNZ, L12_case_42_0033
;--	branch_case (8 bit)
	SEQ	LL, #0x0034
	JMP	RRNZ, L12_case_42_0034
;--	branch_case (8 bit)
	SEQ	LL, #0x0035
	JMP	RRNZ, L12_case_42_0035
;--	branch_case (8 bit)
	SEQ	LL, #0x0036
	JMP	RRNZ, L12_case_42_0036
;--	branch_case (8 bit)
	SEQ	LL, #0x0037
	JMP	RRNZ, L12_case_42_0037
;--	branch_case (8 bit)
	SEQ	LL, #0x0038
	JMP	RRNZ, L12_case_42_0038
;--	branch_case (8 bit)
	SEQ	LL, #0x0039
	JMP	RRNZ, L12_case_42_0039
;--	branch_case (8 bit)
	SEQ	LL, #0x002A
	JMP	RRNZ, L12_case_42_002A
;--	branch_case (8 bit)
	SEQ	LL, #0x0000
	JMP	RRNZ, L12_case_42_0000
;--	branch
	JMP	L12_deflt_42
;;;                     { 10 CompoundStatement
;;;                       { 11 List<case Statement>
;;;                         { 12 case Statement
L12_case_42_0058:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l(r)
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = void (10000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = print_hex
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr (l , r)
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = false
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = const char (20100)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_POINTER
;;;                                         { 20 List<Ptr>
;;;                                           { 21 Ptr
;;;                                           } 21 Ptr
;;;                                         } 20 List<Ptr>
;;;                                       } 19 DeclItem
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = hex
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;;;                                 { 16 StringExpression
;--	load_rr_string
	MOVE	#Cstr_19, RR
;;;                                 } 16 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                 { 16 Expr (l , r)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = unsigned int (82000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = value
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 Expression (cast)r
;;;                                     { 18 Expr * r
;;;                                       { 19 Expr l - r
;;;                                         { 20 Expr ++r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -30 (16 bit)
	MOVE	28(SP), RR
;;;                                           } 21 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -30
	MOVE	RR, 28(SP)
;;;                                         } 20 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                       } 19 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                     } 18 Expr * r
;;;                                   } 17 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_POINTER
;;;                                           { 21 List<Ptr>
;;;                                             { 22 Ptr
;;;                                             } 22 Ptr
;;;                                           } 21 List<Ptr>
;;;                                         } 20 DeclItem
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = dest
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -32
	LEA	4(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                 } 16 Expr (l , r)
;;;                               } 15 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_hex
;--	pop 6 bytes
	ADD	SP, #6
;;;                             } 14 Expr l(r)
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l += r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = int (80000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = len
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l + r
;;;                               { 15 Expr l(r)
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = print_item
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 Expr (l , r)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = min_p
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 NumericExpression (constant 48 = 0x30)
;--	load_rr_constant
	MOVE	#0x0030, RR
;;;                                   } 17 NumericExpression (constant 48 = 0x30)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                   { 17 Expr (l , r)
;;;                                     { 18 ParameterDeclaration
;;;                                       isEllipsis = false
;;;                                       { 19 TypeName
;;;                                         { 20 TypeSpecifier (all)
;;;                                           spec = int (80000)
;;;                                         } 20 TypeSpecifier (all)
;;;                                         { 20 List<DeclItem>
;;;                                           { 21 DeclItem
;;;                                             what = DECL_NAME
;;;                                             name = min_w
;;;                                           } 21 DeclItem
;;;                                         } 20 List<DeclItem>
;;;                                       } 19 TypeName
;;;                                     } 18 ParameterDeclaration
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (min_w)
;--	load_rr_var min_w = -14(FP), SP at -29 (16 bit)
	MOVE	15(SP), RR
;;;                                     } 18 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                     { 18 Expr (l , r)
;;;                                       { 19 ParameterDeclaration
;;;                                         isEllipsis = false
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (all)
;;;                                             spec = int (80000)
;;;                                           } 21 TypeSpecifier (all)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = field_w
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                       } 19 ParameterDeclaration
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (field_w)
;--	load_rr_var field_w = -12(FP), SP at -31 (16 bit)
	MOVE	19(SP), RR
;;;                                       } 19 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                       { 19 Expr (l , r)
;;;                                         { 20 ParameterDeclaration
;;;                                           isEllipsis = false
;;;                                           { 21 TypeName
;;;                                             { 22 TypeSpecifier (all)
;;;                                               spec = const char (20100)
;;;                                             } 22 TypeSpecifier (all)
;;;                                             { 22 List<DeclItem>
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_POINTER
;;;                                                 { 24 List<Ptr>
;;;                                                   { 25 Ptr
;;;                                                   } 25 Ptr
;;;                                                 } 24 List<Ptr>
;;;                                               } 23 DeclItem
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_NAME
;;;                                                 name = alt
;;;                                               } 23 DeclItem
;;;                                             } 22 List<DeclItem>
;;;                                           } 21 TypeName
;;;                                         } 20 ParameterDeclaration
;;;                                         { 20 StringExpression
;--	load_rr_string
	MOVE	#Cstr_20, RR
;;;                                         } 20 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr (l , r)
;;;                                           { 21 ParameterDeclaration
;;;                                             isEllipsis = false
;;;                                             { 22 TypeName
;;;                                               { 23 TypeSpecifier (all)
;;;                                                 spec = char (20000)
;;;                                               } 23 TypeSpecifier (all)
;;;                                               { 23 List<DeclItem>
;;;                                                 { 24 DeclItem
;;;                                                   what = DECL_NAME
;;;                                                   name = pad
;;;                                                 } 24 DeclItem
;;;                                               } 23 List<DeclItem>
;;;                                             } 22 TypeName
;;;                                           } 21 ParameterDeclaration
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (pad)
;--	load_rr_var pad = -8(FP), SP at -35 (8 bit)
	MOVE	27(SP), RS
;;;                                           } 21 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                           { 21 Expr (l , r)
;;;                                             { 22 ParameterDeclaration
;;;                                               isEllipsis = false
;;;                                               { 23 TypeName
;;;                                                 { 24 TypeSpecifier (all)
;;;                                                   spec = char (20000)
;;;                                                 } 24 TypeSpecifier (all)
;;;                                                 { 24 List<DeclItem>
;;;                                                   { 25 DeclItem
;;;                                                     what = DECL_NAME
;;;                                                     name = sign
;;;                                                   } 25 DeclItem
;;;                                                 } 24 List<DeclItem>
;;;                                               } 23 TypeName
;;;                                             } 22 ParameterDeclaration
;;;                                             { 22 Expression (variable name)
;;;                                               expr_type = "identifier" (sign)
;--	load_rr_var sign = -7(FP), SP at -36 (8 bit)
	MOVE	29(SP), RS
;;;                                             } 22 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                             { 22 Expr (l , r)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = char (20000)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = flags
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;;;                                               { 23 Expression (variable name)
;;;                                                 expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -37 (8 bit)
	MOVE	31(SP), RS
;;;                                               } 23 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = const char (20100)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_POINTER
;;;                                                       { 27 List<Ptr>
;;;                                                         { 28 Ptr
;;;                                                         } 28 Ptr
;;;                                                       } 27 List<Ptr>
;;;                                                     } 26 DeclItem
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = buffer
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -38
	LEA	10(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                             } 22 Expr (l , r)
;;;                                           } 21 Expr (l , r)
;;;                                         } 20 Expr (l , r)
;;;                                       } 19 Expr (l , r)
;;;                                     } 18 Expr (l , r)
;;;                                   } 17 Expr (l , r)
;;;                                 } 16 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprint_item
;--	pop 12 bytes
	ADD	SP, #12
;;;                               } 15 Expr l(r)
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                               } 15 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                             } 14 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                           } 13 Expr l += r
;;;                         } 12 ExpressionStatement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0064:
;;;                           { 13 IfElseStatement
;;;                             { 14 Expr l < r
;;;                               { 15 TypeName (internal)
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                               } 15 TypeName (internal)
;;;                               { 15 Expression (cast)r
;;;                                 { 16 Expr * r
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -28 (16 bit)
	MOVE	26(SP), RR
;;;                                   } 17 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                 } 16 Expr * r
;;;                               } 15 Expression (cast)r
;--	l < r
	SLT	RR, #0x0000
;;;                             } 14 Expr l < r
;--	branch_false
	JMP	RRZ, L12_endif_43
;;;                             { 14 CompoundStatement
;;;                               { 15 List<ExpressionStatement>
;;;                                 { 16 ExpressionStatement
;;;                                   { 17 Expr l = r
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = sign
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                     { 18 NumericExpression (constant 45 = 0x2D)
;--	load_rr_constant
	MOVE	#0x002D, RR
;;;                                     } 18 NumericExpression (constant 45 = 0x2D)
;--	store_rr_var sign = -7(FP), SP at -28
	MOVE	R, 21(SP)
;;;                                   } 17 Expr l = r
;;;                                 } 16 ExpressionStatement
;;;                                 { 16 ExpressionStatement
;;;                                   { 17 Expr l = r
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = const char (20100)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_POINTER
;;;                                           { 21 List<Ptr>
;;;                                             { 22 Ptr
;;;                                             } 22 Ptr
;;;                                           } 21 List<Ptr>
;;;                                         } 20 DeclItem
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = args
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                     { 18 Expression (cast)r
;;;                                       { 19 Expr - r
;;;                                         { 20 Expression (cast)r
;;;                                           { 21 Expr * r
;;;                                             { 22 Expression (variable name)
;;;                                               expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -28 (16 bit)
	MOVE	26(SP), RR
;;;                                             } 22 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                           } 21 Expr * r
;;;                                         } 20 Expression (cast)r
;--	16 bit - r
	NEG	RR
;;;                                       } 19 Expr - r
;;;                                     } 18 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                     { 18 Expr * r
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -30 (16 bit)
	MOVE	28(SP), RR
;;;                                       } 19 Expression (variable name)
;;;                                     } 18 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                                   } 17 Expr l = r
;;;                                 } 16 ExpressionStatement
;;;                               } 15 List<ExpressionStatement>
;;;                             } 14 CompoundStatement
L12_endif_43:
;;;                           } 13 IfElseStatement
;;;                         } 12 case Statement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l(r)
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = void (10000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = print_unsigned
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr (l , r)
;;;                               { 15 ParameterDeclaration
;;;                                 isEllipsis = false
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = unsigned int (82000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = value
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                               } 15 ParameterDeclaration
;;;                               { 15 Expression (cast)r
;;;                                 { 16 Expr * r
;;;                                   { 17 Expr l - r
;;;                                     { 18 Expr ++r
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -28 (16 bit)
	MOVE	26(SP), RR
;;;                                       } 19 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -28
	MOVE	RR, 26(SP)
;;;                                     } 18 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                   } 17 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                 } 16 Expr * r
;;;                               } 15 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 ParameterDeclaration
;;;                                 isEllipsis = false
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = char (20000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_POINTER
;;;                                       { 19 List<Ptr>
;;;                                         { 20 Ptr
;;;                                         } 20 Ptr
;;;                                       } 19 List<Ptr>
;;;                                     } 18 DeclItem
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = dest
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                               } 15 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -30
	LEA	2(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                             } 14 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_unsigned
;--	pop 4 bytes
	ADD	SP, #4
;;;                           } 13 Expr l(r)
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l += r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = int (80000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = len
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l + r
;;;                               { 15 Expr l(r)
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = print_item
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 Expr (l , r)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = min_p
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 NumericExpression (constant 48 = 0x30)
;--	load_rr_constant
	MOVE	#0x0030, RR
;;;                                   } 17 NumericExpression (constant 48 = 0x30)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                   { 17 Expr (l , r)
;;;                                     { 18 ParameterDeclaration
;;;                                       isEllipsis = false
;;;                                       { 19 TypeName
;;;                                         { 20 TypeSpecifier (all)
;;;                                           spec = int (80000)
;;;                                         } 20 TypeSpecifier (all)
;;;                                         { 20 List<DeclItem>
;;;                                           { 21 DeclItem
;;;                                             what = DECL_NAME
;;;                                             name = min_w
;;;                                           } 21 DeclItem
;;;                                         } 20 List<DeclItem>
;;;                                       } 19 TypeName
;;;                                     } 18 ParameterDeclaration
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (min_w)
;--	load_rr_var min_w = -14(FP), SP at -29 (16 bit)
	MOVE	15(SP), RR
;;;                                     } 18 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                     { 18 Expr (l , r)
;;;                                       { 19 ParameterDeclaration
;;;                                         isEllipsis = false
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (all)
;;;                                             spec = int (80000)
;;;                                           } 21 TypeSpecifier (all)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = field_w
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                       } 19 ParameterDeclaration
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (field_w)
;--	load_rr_var field_w = -12(FP), SP at -31 (16 bit)
	MOVE	19(SP), RR
;;;                                       } 19 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                       { 19 Expr (l , r)
;;;                                         { 20 ParameterDeclaration
;;;                                           isEllipsis = false
;;;                                           { 21 TypeName
;;;                                             { 22 TypeSpecifier (all)
;;;                                               spec = const char (20100)
;;;                                             } 22 TypeSpecifier (all)
;;;                                             { 22 List<DeclItem>
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_POINTER
;;;                                                 { 24 List<Ptr>
;;;                                                   { 25 Ptr
;;;                                                   } 25 Ptr
;;;                                                 } 24 List<Ptr>
;;;                                               } 23 DeclItem
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_NAME
;;;                                                 name = alt
;;;                                               } 23 DeclItem
;;;                                             } 22 List<DeclItem>
;;;                                           } 21 TypeName
;;;                                         } 20 ParameterDeclaration
;;;                                         { 20 StringExpression
;--	load_rr_string
	MOVE	#Cstr_21, RR
;;;                                         } 20 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr (l , r)
;;;                                           { 21 ParameterDeclaration
;;;                                             isEllipsis = false
;;;                                             { 22 TypeName
;;;                                               { 23 TypeSpecifier (all)
;;;                                                 spec = char (20000)
;;;                                               } 23 TypeSpecifier (all)
;;;                                               { 23 List<DeclItem>
;;;                                                 { 24 DeclItem
;;;                                                   what = DECL_NAME
;;;                                                   name = pad
;;;                                                 } 24 DeclItem
;;;                                               } 23 List<DeclItem>
;;;                                             } 22 TypeName
;;;                                           } 21 ParameterDeclaration
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (pad)
;--	load_rr_var pad = -8(FP), SP at -35 (8 bit)
	MOVE	27(SP), RS
;;;                                           } 21 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                           { 21 Expr (l , r)
;;;                                             { 22 ParameterDeclaration
;;;                                               isEllipsis = false
;;;                                               { 23 TypeName
;;;                                                 { 24 TypeSpecifier (all)
;;;                                                   spec = char (20000)
;;;                                                 } 24 TypeSpecifier (all)
;;;                                                 { 24 List<DeclItem>
;;;                                                   { 25 DeclItem
;;;                                                     what = DECL_NAME
;;;                                                     name = sign
;;;                                                   } 25 DeclItem
;;;                                                 } 24 List<DeclItem>
;;;                                               } 23 TypeName
;;;                                             } 22 ParameterDeclaration
;;;                                             { 22 Expression (variable name)
;;;                                               expr_type = "identifier" (sign)
;--	load_rr_var sign = -7(FP), SP at -36 (8 bit)
	MOVE	29(SP), RS
;;;                                             } 22 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                             { 22 Expr (l , r)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = char (20000)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = flags
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;;;                                               { 23 Expression (variable name)
;;;                                                 expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -37 (8 bit)
	MOVE	31(SP), RS
;;;                                               } 23 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = const char (20100)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_POINTER
;;;                                                       { 27 List<Ptr>
;;;                                                         { 28 Ptr
;;;                                                         } 28 Ptr
;;;                                                       } 27 List<Ptr>
;;;                                                     } 26 DeclItem
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = buffer
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -38
	LEA	10(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                             } 22 Expr (l , r)
;;;                                           } 21 Expr (l , r)
;;;                                         } 20 Expr (l , r)
;;;                                       } 19 Expr (l , r)
;;;                                     } 18 Expr (l , r)
;;;                                   } 17 Expr (l , r)
;;;                                 } 16 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprint_item
;--	pop 12 bytes
	ADD	SP, #12
;;;                               } 15 Expr l(r)
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                               } 15 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                             } 14 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                           } 13 Expr l += r
;;;                         } 12 ExpressionStatement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0073:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l += r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = len
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l(r)
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = int (80000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = print_item
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 Expr (l , r)
;;;                                     { 18 ParameterDeclaration
;;;                                       isEllipsis = false
;;;                                       { 19 TypeName
;;;                                         { 20 TypeSpecifier (all)
;;;                                           spec = char (20000)
;;;                                         } 20 TypeSpecifier (all)
;;;                                         { 20 List<DeclItem>
;;;                                           { 21 DeclItem
;;;                                             what = DECL_NAME
;;;                                             name = min_p
;;;                                           } 21 DeclItem
;;;                                         } 20 List<DeclItem>
;;;                                       } 19 TypeName
;;;                                     } 18 ParameterDeclaration
;;;                                     { 18 NumericExpression (constant 32 = 0x20)
;--	load_rr_constant
	MOVE	#0x0020, RR
;;;                                     } 18 NumericExpression (constant 32 = 0x20)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                     { 18 Expr (l , r)
;;;                                       { 19 ParameterDeclaration
;;;                                         isEllipsis = false
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (all)
;;;                                             spec = int (80000)
;;;                                           } 21 TypeSpecifier (all)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = min_w
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                       } 19 ParameterDeclaration
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (min_w)
;--	load_rr_var min_w = -14(FP), SP at -29 (16 bit)
	MOVE	15(SP), RR
;;;                                       } 19 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                       { 19 Expr (l , r)
;;;                                         { 20 ParameterDeclaration
;;;                                           isEllipsis = false
;;;                                           { 21 TypeName
;;;                                             { 22 TypeSpecifier (all)
;;;                                               spec = int (80000)
;;;                                             } 22 TypeSpecifier (all)
;;;                                             { 22 List<DeclItem>
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_NAME
;;;                                                 name = field_w
;;;                                               } 23 DeclItem
;;;                                             } 22 List<DeclItem>
;;;                                           } 21 TypeName
;;;                                         } 20 ParameterDeclaration
;;;                                         { 20 Expression (variable name)
;;;                                           expr_type = "identifier" (field_w)
;--	load_rr_var field_w = -12(FP), SP at -31 (16 bit)
	MOVE	19(SP), RR
;;;                                         } 20 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr (l , r)
;;;                                           { 21 ParameterDeclaration
;;;                                             isEllipsis = false
;;;                                             { 22 TypeName
;;;                                               { 23 TypeSpecifier (all)
;;;                                                 spec = const char (20100)
;;;                                               } 23 TypeSpecifier (all)
;;;                                               { 23 List<DeclItem>
;;;                                                 { 24 DeclItem
;;;                                                   what = DECL_POINTER
;;;                                                   { 25 List<Ptr>
;;;                                                     { 26 Ptr
;;;                                                     } 26 Ptr
;;;                                                   } 25 List<Ptr>
;;;                                                 } 24 DeclItem
;;;                                                 { 24 DeclItem
;;;                                                   what = DECL_NAME
;;;                                                   name = alt
;;;                                                 } 24 DeclItem
;;;                                               } 23 List<DeclItem>
;;;                                             } 22 TypeName
;;;                                           } 21 ParameterDeclaration
;;;                                           { 21 StringExpression
;--	load_rr_string
	MOVE	#Cstr_22, RR
;;;                                           } 21 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                           { 21 Expr (l , r)
;;;                                             { 22 ParameterDeclaration
;;;                                               isEllipsis = false
;;;                                               { 23 TypeName
;;;                                                 { 24 TypeSpecifier (all)
;;;                                                   spec = char (20000)
;;;                                                 } 24 TypeSpecifier (all)
;;;                                                 { 24 List<DeclItem>
;;;                                                   { 25 DeclItem
;;;                                                     what = DECL_NAME
;;;                                                     name = pad
;;;                                                   } 25 DeclItem
;;;                                                 } 24 List<DeclItem>
;;;                                               } 23 TypeName
;;;                                             } 22 ParameterDeclaration
;;;                                             { 22 NumericExpression (constant 32 = 0x20)
;--	load_rr_constant
	MOVE	#0x0020, RR
;;;                                             } 22 NumericExpression (constant 32 = 0x20)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                             { 22 Expr (l , r)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = char (20000)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = sign
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;;;                                               { 23 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                                               } 23 NumericExpression (constant 0 = 0x0)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                               { 23 Expr (l , r)
;;;                                                 { 24 ParameterDeclaration
;;;                                                   isEllipsis = false
;;;                                                   { 25 TypeName
;;;                                                     { 26 TypeSpecifier (all)
;;;                                                       spec = char (20000)
;;;                                                     } 26 TypeSpecifier (all)
;;;                                                     { 26 List<DeclItem>
;;;                                                       { 27 DeclItem
;;;                                                         what = DECL_NAME
;;;                                                         name = flags
;;;                                                       } 27 DeclItem
;;;                                                     } 26 List<DeclItem>
;;;                                                   } 25 TypeName
;;;                                                 } 24 ParameterDeclaration
;;;                                                 { 24 Expr l & r
;;;                                                   { 25 TypeName (internal)
;;;                                                     { 26 TypeSpecifier (all)
;;;                                                       spec = int (80000)
;;;                                                     } 26 TypeSpecifier (all)
;;;                                                   } 25 TypeName (internal)
;;;                                                   { 25 Expression (variable name)
;;;                                                     expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -37 (8 bit)
	MOVE	31(SP), RS
;;;                                                   } 25 Expression (variable name)
;--	l & r
	AND	RR, #0x0002
;;;                                                 } 24 Expr l & r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                                 { 24 ParameterDeclaration
;;;                                                   isEllipsis = false
;;;                                                   { 25 TypeName
;;;                                                     { 26 TypeSpecifier (all)
;;;                                                       spec = const char (20100)
;;;                                                     } 26 TypeSpecifier (all)
;;;                                                     { 26 List<DeclItem>
;;;                                                       { 27 DeclItem
;;;                                                         what = DECL_POINTER
;;;                                                         { 28 List<Ptr>
;;;                                                           { 29 Ptr
;;;                                                           } 29 Ptr
;;;                                                         } 28 List<Ptr>
;;;                                                       } 27 DeclItem
;;;                                                       { 27 DeclItem
;;;                                                         what = DECL_NAME
;;;                                                         name = buffer
;;;                                                       } 27 DeclItem
;;;                                                     } 26 List<DeclItem>
;;;                                                   } 25 TypeName
;;;                                                 } 24 ParameterDeclaration
;;;                                                 { 24 Expr * r
;;;                                                   { 25 Expr l - r
;;;                                                     { 26 Expr ++r
;;;                                                       { 27 Expression (variable name)
;;;                                                         expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -38 (16 bit)
	MOVE	36(SP), RR
;;;                                                       } 27 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -38
	MOVE	RR, 36(SP)
;;;                                                     } 26 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                                   } 25 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                                 } 24 Expr * r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                               } 23 Expr (l , r)
;;;                                             } 22 Expr (l , r)
;;;                                           } 21 Expr (l , r)
;;;                                         } 20 Expr (l , r)
;;;                                       } 19 Expr (l , r)
;;;                                     } 18 Expr (l , r)
;;;                                   } 17 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprint_item
;--	pop 12 bytes
	ADD	SP, #12
;;;                                 } 16 Expr l(r)
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                                 } 16 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                               } 15 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                             } 14 Expr l += r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0075:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l(r)
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = void (10000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = print_unsigned
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr (l , r)
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = false
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = value
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;;;                                 { 16 Expression (cast)r
;;;                                   { 17 Expr * r
;;;                                     { 18 Expr l - r
;;;                                       { 19 Expr ++r
;;;                                         { 20 Expression (variable name)
;;;                                           expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -28 (16 bit)
	MOVE	26(SP), RR
;;;                                         } 20 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -28
	MOVE	RR, 26(SP)
;;;                                       } 19 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                     } 18 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;;;                                 } 16 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = false
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = char (20000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_POINTER
;;;                                         { 20 List<Ptr>
;;;                                           { 21 Ptr
;;;                                           } 21 Ptr
;;;                                         } 20 List<Ptr>
;;;                                       } 19 DeclItem
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = dest
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -30
	LEA	2(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               } 15 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_unsigned
;--	pop 4 bytes
	ADD	SP, #4
;;;                             } 14 Expr l(r)
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l += r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = int (80000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = len
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l + r
;;;                               { 15 Expr l(r)
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = print_item
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 Expr (l , r)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = min_p
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 NumericExpression (constant 48 = 0x30)
;--	load_rr_constant
	MOVE	#0x0030, RR
;;;                                   } 17 NumericExpression (constant 48 = 0x30)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                   { 17 Expr (l , r)
;;;                                     { 18 ParameterDeclaration
;;;                                       isEllipsis = false
;;;                                       { 19 TypeName
;;;                                         { 20 TypeSpecifier (all)
;;;                                           spec = int (80000)
;;;                                         } 20 TypeSpecifier (all)
;;;                                         { 20 List<DeclItem>
;;;                                           { 21 DeclItem
;;;                                             what = DECL_NAME
;;;                                             name = min_w
;;;                                           } 21 DeclItem
;;;                                         } 20 List<DeclItem>
;;;                                       } 19 TypeName
;;;                                     } 18 ParameterDeclaration
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (min_w)
;--	load_rr_var min_w = -14(FP), SP at -29 (16 bit)
	MOVE	15(SP), RR
;;;                                     } 18 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                     { 18 Expr (l , r)
;;;                                       { 19 ParameterDeclaration
;;;                                         isEllipsis = false
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (all)
;;;                                             spec = int (80000)
;;;                                           } 21 TypeSpecifier (all)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = field_w
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                       } 19 ParameterDeclaration
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (field_w)
;--	load_rr_var field_w = -12(FP), SP at -31 (16 bit)
	MOVE	19(SP), RR
;;;                                       } 19 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                       { 19 Expr (l , r)
;;;                                         { 20 ParameterDeclaration
;;;                                           isEllipsis = false
;;;                                           { 21 TypeName
;;;                                             { 22 TypeSpecifier (all)
;;;                                               spec = const char (20100)
;;;                                             } 22 TypeSpecifier (all)
;;;                                             { 22 List<DeclItem>
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_POINTER
;;;                                                 { 24 List<Ptr>
;;;                                                   { 25 Ptr
;;;                                                   } 25 Ptr
;;;                                                 } 24 List<Ptr>
;;;                                               } 23 DeclItem
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_NAME
;;;                                                 name = alt
;;;                                               } 23 DeclItem
;;;                                             } 22 List<DeclItem>
;;;                                           } 21 TypeName
;;;                                         } 20 ParameterDeclaration
;;;                                         { 20 StringExpression
;--	load_rr_string
	MOVE	#Cstr_23, RR
;;;                                         } 20 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr (l , r)
;;;                                           { 21 ParameterDeclaration
;;;                                             isEllipsis = false
;;;                                             { 22 TypeName
;;;                                               { 23 TypeSpecifier (all)
;;;                                                 spec = char (20000)
;;;                                               } 23 TypeSpecifier (all)
;;;                                               { 23 List<DeclItem>
;;;                                                 { 24 DeclItem
;;;                                                   what = DECL_NAME
;;;                                                   name = pad
;;;                                                 } 24 DeclItem
;;;                                               } 23 List<DeclItem>
;;;                                             } 22 TypeName
;;;                                           } 21 ParameterDeclaration
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (pad)
;--	load_rr_var pad = -8(FP), SP at -35 (8 bit)
	MOVE	27(SP), RS
;;;                                           } 21 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                           { 21 Expr (l , r)
;;;                                             { 22 ParameterDeclaration
;;;                                               isEllipsis = false
;;;                                               { 23 TypeName
;;;                                                 { 24 TypeSpecifier (all)
;;;                                                   spec = char (20000)
;;;                                                 } 24 TypeSpecifier (all)
;;;                                                 { 24 List<DeclItem>
;;;                                                   { 25 DeclItem
;;;                                                     what = DECL_NAME
;;;                                                     name = sign
;;;                                                   } 25 DeclItem
;;;                                                 } 24 List<DeclItem>
;;;                                               } 23 TypeName
;;;                                             } 22 ParameterDeclaration
;;;                                             { 22 Expression (variable name)
;;;                                               expr_type = "identifier" (sign)
;--	load_rr_var sign = -7(FP), SP at -36 (8 bit)
	MOVE	29(SP), RS
;;;                                             } 22 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                             { 22 Expr (l , r)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = char (20000)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = flags
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;;;                                               { 23 Expression (variable name)
;;;                                                 expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -37 (8 bit)
	MOVE	31(SP), RS
;;;                                               } 23 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = const char (20100)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_POINTER
;;;                                                       { 27 List<Ptr>
;;;                                                         { 28 Ptr
;;;                                                         } 28 Ptr
;;;                                                       } 27 List<Ptr>
;;;                                                     } 26 DeclItem
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = buffer
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -38
	LEA	10(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                             } 22 Expr (l , r)
;;;                                           } 21 Expr (l , r)
;;;                                         } 20 Expr (l , r)
;;;                                       } 19 Expr (l , r)
;;;                                     } 18 Expr (l , r)
;;;                                   } 17 Expr (l , r)
;;;                                 } 16 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprint_item
;--	pop 12 bytes
	ADD	SP, #12
;;;                               } 15 Expr l(r)
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                               } 15 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                             } 14 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                           } 13 Expr l += r
;;;                         } 12 ExpressionStatement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0078:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l(r)
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = void (10000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = print_hex
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr (l , r)
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = false
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = const char (20100)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_POINTER
;;;                                         { 20 List<Ptr>
;;;                                           { 21 Ptr
;;;                                           } 21 Ptr
;;;                                         } 20 List<Ptr>
;;;                                       } 19 DeclItem
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = hex
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;;;                                 { 16 StringExpression
;--	load_rr_string
	MOVE	#Cstr_24, RR
;;;                                 } 16 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                 { 16 Expr (l , r)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = unsigned int (82000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = value
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 Expression (cast)r
;;;                                     { 18 Expr * r
;;;                                       { 19 Expr l - r
;;;                                         { 20 Expr ++r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -30 (16 bit)
	MOVE	28(SP), RR
;;;                                           } 21 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -30
	MOVE	RR, 28(SP)
;;;                                         } 20 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                       } 19 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                     } 18 Expr * r
;;;                                   } 17 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_POINTER
;;;                                           { 21 List<Ptr>
;;;                                             { 22 Ptr
;;;                                             } 22 Ptr
;;;                                           } 21 List<Ptr>
;;;                                         } 20 DeclItem
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = dest
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -32
	LEA	4(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                 } 16 Expr (l , r)
;;;                               } 15 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_hex
;--	pop 6 bytes
	ADD	SP, #6
;;;                             } 14 Expr l(r)
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l += r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = int (80000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = len
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l + r
;;;                               { 15 Expr l(r)
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = print_item
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 Expr (l , r)
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = min_p
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 NumericExpression (constant 48 = 0x30)
;--	load_rr_constant
	MOVE	#0x0030, RR
;;;                                   } 17 NumericExpression (constant 48 = 0x30)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                   { 17 Expr (l , r)
;;;                                     { 18 ParameterDeclaration
;;;                                       isEllipsis = false
;;;                                       { 19 TypeName
;;;                                         { 20 TypeSpecifier (all)
;;;                                           spec = int (80000)
;;;                                         } 20 TypeSpecifier (all)
;;;                                         { 20 List<DeclItem>
;;;                                           { 21 DeclItem
;;;                                             what = DECL_NAME
;;;                                             name = min_w
;;;                                           } 21 DeclItem
;;;                                         } 20 List<DeclItem>
;;;                                       } 19 TypeName
;;;                                     } 18 ParameterDeclaration
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (min_w)
;--	load_rr_var min_w = -14(FP), SP at -29 (16 bit)
	MOVE	15(SP), RR
;;;                                     } 18 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                     { 18 Expr (l , r)
;;;                                       { 19 ParameterDeclaration
;;;                                         isEllipsis = false
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (all)
;;;                                             spec = int (80000)
;;;                                           } 21 TypeSpecifier (all)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = field_w
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                       } 19 ParameterDeclaration
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (field_w)
;--	load_rr_var field_w = -12(FP), SP at -31 (16 bit)
	MOVE	19(SP), RR
;;;                                       } 19 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                       { 19 Expr (l , r)
;;;                                         { 20 ParameterDeclaration
;;;                                           isEllipsis = false
;;;                                           { 21 TypeName
;;;                                             { 22 TypeSpecifier (all)
;;;                                               spec = const char (20100)
;;;                                             } 22 TypeSpecifier (all)
;;;                                             { 22 List<DeclItem>
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_POINTER
;;;                                                 { 24 List<Ptr>
;;;                                                   { 25 Ptr
;;;                                                   } 25 Ptr
;;;                                                 } 24 List<Ptr>
;;;                                               } 23 DeclItem
;;;                                               { 23 DeclItem
;;;                                                 what = DECL_NAME
;;;                                                 name = alt
;;;                                               } 23 DeclItem
;;;                                             } 22 List<DeclItem>
;;;                                           } 21 TypeName
;;;                                         } 20 ParameterDeclaration
;;;                                         { 20 StringExpression
;--	load_rr_string
	MOVE	#Cstr_25, RR
;;;                                         } 20 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr (l , r)
;;;                                           { 21 ParameterDeclaration
;;;                                             isEllipsis = false
;;;                                             { 22 TypeName
;;;                                               { 23 TypeSpecifier (all)
;;;                                                 spec = char (20000)
;;;                                               } 23 TypeSpecifier (all)
;;;                                               { 23 List<DeclItem>
;;;                                                 { 24 DeclItem
;;;                                                   what = DECL_NAME
;;;                                                   name = pad
;;;                                                 } 24 DeclItem
;;;                                               } 23 List<DeclItem>
;;;                                             } 22 TypeName
;;;                                           } 21 ParameterDeclaration
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (pad)
;--	load_rr_var pad = -8(FP), SP at -35 (8 bit)
	MOVE	27(SP), RS
;;;                                           } 21 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                           { 21 Expr (l , r)
;;;                                             { 22 ParameterDeclaration
;;;                                               isEllipsis = false
;;;                                               { 23 TypeName
;;;                                                 { 24 TypeSpecifier (all)
;;;                                                   spec = char (20000)
;;;                                                 } 24 TypeSpecifier (all)
;;;                                                 { 24 List<DeclItem>
;;;                                                   { 25 DeclItem
;;;                                                     what = DECL_NAME
;;;                                                     name = sign
;;;                                                   } 25 DeclItem
;;;                                                 } 24 List<DeclItem>
;;;                                               } 23 TypeName
;;;                                             } 22 ParameterDeclaration
;;;                                             { 22 Expression (variable name)
;;;                                               expr_type = "identifier" (sign)
;--	load_rr_var sign = -7(FP), SP at -36 (8 bit)
	MOVE	29(SP), RS
;;;                                             } 22 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                             { 22 Expr (l , r)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = char (20000)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = flags
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;;;                                               { 23 Expression (variable name)
;;;                                                 expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -37 (8 bit)
	MOVE	31(SP), RS
;;;                                               } 23 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                                               { 23 ParameterDeclaration
;;;                                                 isEllipsis = false
;;;                                                 { 24 TypeName
;;;                                                   { 25 TypeSpecifier (all)
;;;                                                     spec = const char (20100)
;;;                                                   } 25 TypeSpecifier (all)
;;;                                                   { 25 List<DeclItem>
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_POINTER
;;;                                                       { 27 List<Ptr>
;;;                                                         { 28 Ptr
;;;                                                         } 28 Ptr
;;;                                                       } 27 List<Ptr>
;;;                                                     } 26 DeclItem
;;;                                                     { 26 DeclItem
;;;                                                       what = DECL_NAME
;;;                                                       name = buffer
;;;                                                     } 26 DeclItem
;;;                                                   } 25 List<DeclItem>
;;;                                                 } 24 TypeName
;;;                                               } 23 ParameterDeclaration
;--	load_address buffer = -28(FP), SP at -38
	LEA	10(SP), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                             } 22 Expr (l , r)
;;;                                           } 21 Expr (l , r)
;;;                                         } 20 Expr (l , r)
;;;                                       } 19 Expr (l , r)
;;;                                     } 18 Expr (l , r)
;;;                                   } 17 Expr (l , r)
;;;                                 } 16 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprint_item
;--	pop 12 bytes
	ADD	SP, #12
;;;                               } 15 Expr l(r)
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                               } 15 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                             } 14 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                           } 13 Expr l += r
;;;                         } 12 ExpressionStatement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0063:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l += r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = len
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l(r)
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = int (80000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = putchr
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = c
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 Expression (cast)r
;;;                                     { 18 Expr * r
;;;                                       { 19 Expr l - r
;;;                                         { 20 Expr ++r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -28 (16 bit)
	MOVE	26(SP), RR
;;;                                           } 21 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -28
	MOVE	RR, 26(SP)
;;;                                         } 20 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                       } 19 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                     } 18 Expr * r
;;;                                   } 17 Expression (cast)r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                                 } 16 Expr l(r)
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                                 } 16 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                               } 15 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                             } 14 Expr l += r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0023:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l | r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = char (20000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = flags
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l | r
;;;                                 { 16 TypeName (internal)
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                 } 16 TypeName (internal)
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -28 (8 bit)
	MOVE	22(SP), RS
;;;                                 } 16 Expression (variable name)
;--	l | r
	OR	RR, #0x0001
;;;                               } 15 Expr l | r
;--	store_rr_var flags = -6(FP), SP at -28
	MOVE	R, 22(SP)
;;;                             } 14 Expr l | r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_002D:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l | r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = char (20000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = flags
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l | r
;;;                                 { 16 TypeName (internal)
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                 } 16 TypeName (internal)
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (flags)
;--	load_rr_var flags = -6(FP), SP at -28 (8 bit)
	MOVE	22(SP), RS
;;;                                 } 16 Expression (variable name)
;--	l | r
	OR	RR, #0x0002
;;;                               } 15 Expr l | r
;--	store_rr_var flags = -6(FP), SP at -28
	MOVE	R, 22(SP)
;;;                             } 14 Expr l | r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0020:
;;;                           { 13 IfElseStatement
;;;                             { 14 Expr ! r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (sign)
;--	load_rr_var sign = -7(FP), SP at -28 (8 bit)
	MOVE	21(SP), RS
;;;                               } 15 Expression (variable name)
;--	16 bit ! r
	LNOT	RR
;;;                             } 14 Expr ! r
;--	branch_false
	JMP	RRZ, L12_endif_44
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l = r
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = char (20000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = sign
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 NumericExpression (constant 32 = 0x20)
;--	load_rr_constant
	MOVE	#0x0020, RR
;;;                                 } 16 NumericExpression (constant 32 = 0x20)
;--	store_rr_var sign = -7(FP), SP at -28
	MOVE	R, 21(SP)
;;;                               } 15 Expr l = r
;;;                             } 14 ExpressionStatement
L12_endif_44:
;;;                           } 13 IfElseStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_002B:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = char (20000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = sign
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 NumericExpression (constant 43 = 0x2B)
;--	load_rr_constant
	MOVE	#0x002B, RR
;;;                               } 15 NumericExpression (constant 43 = 0x2B)
;--	store_rr_var sign = -7(FP), SP at -28
	MOVE	R, 21(SP)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_002E:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_POINTER
;;;                                     { 18 List<Ptr>
;;;                                       { 19 Ptr
;;;                                       } 19 Ptr
;;;                                     } 18 List<Ptr>
;;;                                   } 17 DeclItem
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr & r
;--	load_address min_w = -14(FP), SP at -28
	LEA	14(SP), RR
;;;                               } 15 Expr & r
;--	store_rr_var which_w = -16(FP), SP at -28
	MOVE	RR, 12(SP)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0030:
;;;                           { 13 IfElseStatement
;;;                             { 14 Expr * r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                               } 15 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                             } 14 Expr * r
;--	branch_false
	JMP	RRZ, L12_else_45
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l *- r
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = unsigned int (82000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = which_w
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                 { 16 Expr * r
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                   } 17 Expression (variable name)
;;;                                 } 16 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                               } 15 Expr l *- r
;;;                             } 14 ExpressionStatement
;--	branch
	JMP	L12_endif_45
L12_else_45:
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l = r
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = char (20000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = pad
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 NumericExpression (constant 48 = 0x30)
;--	load_rr_constant
	MOVE	#0x0030, RR
;;;                                 } 16 NumericExpression (constant 48 = 0x30)
;--	store_rr_var pad = -8(FP), SP at -28
	MOVE	R, 20(SP)
;;;                               } 15 Expr l = r
;;;                             } 14 ExpressionStatement
L12_endif_45:
;;;                           } 13 IfElseStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0031:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0001
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0032:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0002
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0033:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0003
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0034:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0004
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0035:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0005
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0036:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0006
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0037:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0007
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0038:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0008
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0039:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l * r
;;;                                   { 17 TypeName (internal)
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned int (82000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                   } 17 TypeName (internal)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -28 (16 bit)
	MOVE	12(SP), RR
;;;                                     } 18 Expression (variable name)
;--	content
	MOVE	(RR), RR
;;;                                   } 17 Expr * r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l * r
	DI
	MUL_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                                 } 16 Expr l * r
;--	l + r
	ADD	RR, #0x0009
;;;                               } 15 Expr l + r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_002A:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l = r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = unsigned int (82000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = which_w
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expression (cast)r
;;;                                 { 16 Expr * r
;;;                                   { 17 Expr l - r
;;;                                     { 18 Expr ++r
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (args)
;--	load_rr_var args = -2(FP), SP at -28 (16 bit)
	MOVE	26(SP), RR
;;;                                       } 19 Expression (variable name)
;--	++
	ADD	RR, #0x0002
;--	store_rr_var args = -2(FP), SP at -28
	MOVE	RR, 26(SP)
;;;                                     } 18 Expr ++r
;--	l - r
	SUB	RR, #0x0002
;;;                                   } 17 Expr l - r
;--	content
	MOVE	(RR), RR
;;;                                 } 16 Expr * r
;;;                               } 15 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (which_w)
;--	load_rr_var which_w = -16(FP), SP at -30 (16 bit)
	MOVE	14(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                             } 14 Expr l = r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_cont_40
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_case_42_0000:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l + r
;;;                               { 15 Expr --r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (format)
;--	load_rr_var format = 2(FP), SP at -28 (16 bit)
	MOVE	30(SP), RR
;;;                                 } 16 Expression (variable name)
;--	--
	SUB	RR, #0x0001
;--	store_rr_var format = 2(FP), SP at -28
	MOVE	RR, 30(SP)
;;;                               } 15 Expr --r
;--	l + r
	ADD	RR, #0x0001
;;;                             } 14 Expr l + r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L12_deflt_42:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l += r
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = len
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 Expr l + r
;;;                                 { 16 Expr l(r)
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = int (80000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = putchr
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 ParameterDeclaration
;;;                                     isEllipsis = false
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (all)
;;;                                         spec = char (20000)
;;;                                       } 19 TypeSpecifier (all)
;;;                                       { 19 List<DeclItem>
;;;                                         { 20 DeclItem
;;;                                           what = DECL_NAME
;;;                                           name = c
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                   } 17 ParameterDeclaration
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (c)
;--	load_rr_var c = -5(FP), SP at -28 (8 bit)
	MOVE	23(SP), RS
;;;                                   } 17 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                                 } 16 Expr l(r)
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (len)
;--	load_ll_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), LL
;;;                                 } 16 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                               } 15 Expr l + r
;--	store_rr_var len = -4(FP), SP at -28
	MOVE	RR, 24(SP)
;;;                             } 14 Expr l += r
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L12_brk_42
;;;                         } 12 break/continue Statement
;;;                       } 11 List<case Statement>
;;;                     } 10 CompoundStatement
L12_brk_42:
;;;                   } 9 SwitchStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L12_brk_41
;;;                   } 9 break/continue Statement
;;;                 } 8 List<SwitchStatement>
;;;               } 7 CompoundStatement
L12_cont_40:
;--	branch
	JMP	L12_loop_40
L12_brk_41:
;;;             } 6 for Statement
;;;           } 5 List<IfElseStatement>
;;;         } 4 CompoundStatement
L12_cont_37:
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = c
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr * r
;;;             { 6 Expr l - r
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (format)
;--	load_rr_var format = 2(FP), SP at -28 (16 bit)
	MOVE	30(SP), RR
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var format = 2(FP), SP at -28
	MOVE	RR, 30(SP)
;;;               } 7 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;             } 6 Expr l - r
;--	content
	MOVE	(RR), RS
;;;           } 5 Expr * r
;--	store_rr_var c = -5(FP), SP at -28
	MOVE	R, 23(SP)
;;;         } 4 Expr l = r
;--	branch_true
	JMP	RRNZ, L12_loop_37
L12_brk_38:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (len)
;--	load_rr_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L12_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L12_return:
;--	pop 28 bytes
	ADD	SP, #28
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = getchr
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = getchr
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cgetchr:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
L13_loop_46:
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L13_cont_46:
;;;         { 4 Expr ! r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (serial_in_length)
;--	load_rr_var serial_in_length, (8 bit)
	MOVE	(Cserial_in_length), RU
;;;           } 5 Expression (variable name)
;--	16 bit ! r
	LNOT	RR
;;;         } 4 Expr ! r
;--	branch_true
	JMP	RRNZ, L13_loop_46
L13_brk_47:
;;;       } 3 while Statement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = c
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l[r]
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned char (22000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = serial_in_buffer
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l[r]
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (serial_in_get)
;--	load_rr_var serial_in_get, (8 bit)
	MOVE	(Cserial_in_get), RU
;;;               } 7 Expression (variable name)
;--	scale_rr *1
;--	add_address serial_in_buffer
	ADD	RR, #Cserial_in_buffer
;;;             } 6 Expr l[r]
;--	content
	MOVE	(RR), RU
;;;           } 5 Expr l[r]
;--	store_rr_var c = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned char (22000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = serial_in_get
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l & r
;;;             { 6 TypeName (internal)
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned int (82000)
;;;               } 7 TypeSpecifier (all)
;;;             } 6 TypeName (internal)
;;;             { 6 Expr ++r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (serial_in_get)
;--	load_rr_var serial_in_get, (8 bit)
	MOVE	(Cserial_in_get), RU
;;;               } 7 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_get
	MOVE	R, (Cserial_in_get)
;;;             } 6 Expr ++r
;--	l & r
	AND	RR, #0x000F
;;;           } 5 Expr l & r
;--	store_rr_var serial_in_get
	MOVE	R, (Cserial_in_get)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr --r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (serial_in_length)
;--	load_rr_var serial_in_length, (8 bit)
	MOVE	(Cserial_in_length), RU
;;;           } 5 Expression (variable name)
;--	--
	SUB	RR, #0x0001
;--	store_rr_var serial_in_length
	MOVE	R, (Cserial_in_length)
;;;         } 4 Expr --r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	EI
;;;       } 3 ExpressionStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L13_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L13_return:
;--	pop 1 bytes
	ADD	SP, #1
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = peekchr
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = peekchr
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cpeekchr:
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
L14_loop_48:
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L14_cont_48:
;;;         { 4 Expr ! r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (serial_in_length)
;--	load_rr_var serial_in_length, (8 bit)
	MOVE	(Cserial_in_length), RU
;;;           } 5 Expression (variable name)
;--	16 bit ! r
	LNOT	RR
;;;         } 4 Expr ! r
;--	branch_true
	JMP	RRNZ, L14_loop_48
L14_brk_49:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expr l[r]
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned char (22000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = serial_in_buffer
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l[r]
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (serial_in_get)
;--	load_rr_var serial_in_get, (8 bit)
	MOVE	(Cserial_in_get), RU
;;;             } 6 Expression (variable name)
;--	scale_rr *1
;--	add_address serial_in_buffer
	ADD	RR, #Cserial_in_buffer
;;;           } 5 Expr l[r]
;--	content
	MOVE	(RR), RU
;;;         } 4 Expr l[r]
;--	branch
	JMP	L14_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L14_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = char (20000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = getnibble
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = getnibble
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = echo
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cgetnibble:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr l(r)
;;;         { 4 TypeName
;;;           { 5 TypeSpecifier (all)
;;;             spec = int (80000)
;;;           } 5 TypeSpecifier (all)
;;;           { 5 List<DeclItem>
;;;             { 6 DeclItem
;;;               what = DECL_NAME
;;;               name = peekchr
;;;             } 6 DeclItem
;;;           } 5 List<DeclItem>
;;;         } 4 TypeName
;--	push 2 bytes
;--	call
	CALL	Cpeekchr
;--	pop 0 bytes
;;;       } 3 Expr l(r)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = ret
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0xFFFF, RR
;;;       } 3 NumericExpression (constant 1 = 0x1)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expr l && r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 IfElseStatement
;;;             { 6 Expr l >= r
;;;               { 7 TypeName (internal)
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;               } 7 TypeName (internal)
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;               } 7 Expression (variable name)
;--	l >= r
	SGE	RR, #0x0030
;;;             } 6 Expr l >= r
;--	branch_false
	JMP	RRZ, L15_endif_51
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l <= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                 } 8 Expression (variable name)
;--	l <= r
	SLE	RR, #0x0039
;;;               } 7 Expr l <= r
;;;             } 6 ExpressionStatement
L15_endif_51:
;;;           } 5 IfElseStatement
;;;         } 4 Expr l && r
;--	branch_false
	JMP	RRZ, L15_else_50
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = ret
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l - r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;               } 7 Expression (variable name)
;--	l - r
	SUB	RR, #0x0030
;;;             } 6 Expr l - r
;--	store_rr_var ret = -3(FP), SP at -3
	MOVE	RR, 0(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
;--	branch
	JMP	L15_endif_50
L15_else_50:
;;;         { 4 IfElseStatement
;;;           { 5 Expr l && r
;;;             { 6 TypeName (internal)
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;             } 6 TypeName (internal)
;;;             { 6 IfElseStatement
;;;               { 7 Expr l >= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                 } 8 Expression (variable name)
;--	l >= r
	SGE	RR, #0x0041
;;;               } 7 Expr l >= r
;--	branch_false
	JMP	RRZ, L15_endif_53
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l <= r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                   } 9 Expression (variable name)
;--	l <= r
	SLE	RR, #0x0046
;;;                 } 8 Expr l <= r
;;;               } 7 ExpressionStatement
L15_endif_53:
;;;             } 6 IfElseStatement
;;;           } 5 Expr l && r
;--	branch_false
	JMP	RRZ, L15_else_52
;;;           { 5 ExpressionStatement
;;;             { 6 Expr l = r
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = ret
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;               { 7 Expr l - r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                 } 8 Expression (variable name)
;--	l - r
	SUB	RR, #0x0037
;;;               } 7 Expr l - r
;--	store_rr_var ret = -3(FP), SP at -3
	MOVE	RR, 0(SP)
;;;             } 6 Expr l = r
;;;           } 5 ExpressionStatement
;--	branch
	JMP	L15_endif_52
L15_else_52:
;;;           { 5 IfElseStatement
;;;             { 6 Expr l && r
;;;               { 7 TypeName (internal)
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;               } 7 TypeName (internal)
;;;               { 7 IfElseStatement
;;;                 { 8 Expr l >= r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                   } 9 Expression (variable name)
;--	l >= r
	SGE	RR, #0x0061
;;;                 } 8 Expr l >= r
;--	branch_false
	JMP	RRZ, L15_endif_55
;;;                 { 8 ExpressionStatement
;;;                   { 9 Expr l <= r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                     } 10 Expression (variable name)
;--	l <= r
	SLE	RR, #0x0066
;;;                   } 9 Expr l <= r
;;;                 } 8 ExpressionStatement
L15_endif_55:
;;;               } 7 IfElseStatement
;;;             } 6 Expr l && r
;--	branch_false
	JMP	RRZ, L15_endif_54
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = ret
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l - r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                   } 9 Expression (variable name)
;--	l - r
	SUB	RR, #0x0057
;;;                 } 8 Expr l - r
;--	store_rr_var ret = -3(FP), SP at -3
	MOVE	RR, 0(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
L15_endif_54:
;;;           } 5 IfElseStatement
L15_endif_52:
;;;         } 4 IfElseStatement
L15_endif_50:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l != r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (ret)
;--	load_rr_var ret = -3(FP), SP at -3 (16 bit)
	MOVE	0(SP), RR
;;;           } 5 Expression (variable name)
;--	l != r
	SNE	RR, #0xFFFF
;;;         } 4 Expr l != r
;--	branch_false
	JMP	RRZ, L15_endif_56
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = getchr
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (echo)
;--	load_rr_var echo = 2(FP), SP at -3 (8 bit)
	MOVE	5(SP), RS
;;;               } 7 Expression (variable name)
;--	branch_false
	JMP	RRZ, L15_endif_57
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = putchr
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = false
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = char (20000)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = c
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -3 (8 bit)
	MOVE	2(SP), RS
;;;                   } 9 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                 } 8 Expr l(r)
;;;               } 7 ExpressionStatement
L15_endif_57:
;;;             } 6 IfElseStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L15_endif_56:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (ret)
;--	load_rr_var ret = -3(FP), SP at -3 (16 bit)
	MOVE	0(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L15_return
;;;       } 3 return Statement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L15_return:
;--	pop 3 bytes
	ADD	SP, #3
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = gethex
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = gethex
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = echo
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cgethex:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = ret
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L16_cont_58
L16_loop_58:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = ret
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l | r
;;;               { 7 TypeName (internal)
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;               } 7 TypeName (internal)
;;;               { 7 Expr l << r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (ret)
;--	load_rr_var ret = -2(FP), SP at -3 (16 bit)
	MOVE	1(SP), RR
;;;                 } 8 Expression (variable name)
;--	l << r
	LSL	RR, #0x0004
;;;               } 7 Expr l << r
;--	move_rr_to_ll
	MOVE	RR, LL
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (c)
;--	load_rr_var c = -3(FP), SP at -3 (8 bit)
	MOVE	0(SP), RS
;;;               } 7 Expression (variable name)
;--	l | r
	OR	LL, RR
;;;             } 6 Expr l | r
;--	store_rr_var ret = -2(FP), SP at -3
	MOVE	RR, 1(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L16_cont_58:
;;;         { 4 Expr l != r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = c
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr l(r)
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = char (20000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = getnibble
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = echo
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (echo)
;--	load_rr_var echo = 2(FP), SP at -3 (8 bit)
	MOVE	5(SP), RS
;;;               } 7 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 1 bytes
;--	call
	CALL	Cgetnibble
;--	pop 1 bytes
	ADD	SP, #1
;;;             } 6 Expr l(r)
;--	store_rr_var c = -3(FP), SP at -3
	MOVE	R, 0(SP)
;;;           } 5 Expr l = r
;--	l != r
	SNE	RR, #0xFFFF
;;;         } 4 Expr l != r
;--	branch_true
	JMP	RRNZ, L16_loop_58
L16_brk_59:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (ret)
;--	load_rr_var ret = -2(FP), SP at -3 (16 bit)
	MOVE	1(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L16_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L16_return:
;--	pop 3 bytes
	ADD	SP, #3
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = show_time
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = show_time
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cshow_time:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = sl
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = sm
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = sh
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<do while Statement>
;;;       { 3 do while Statement
L17_loop_60:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = seconds_changed
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var seconds_changed
	MOVE	R, (Cseconds_changed)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = sl
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (seconds_low)
;--	load_rr_var seconds_low, (16 bit)
	MOVE	(Cseconds_low), RR
;;;                 } 8 Expression (variable name)
;--	store_rr_var sl = -2(FP), SP at -6
	MOVE	RR, 4(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = sm
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (seconds_mid)
;--	load_rr_var seconds_mid, (16 bit)
	MOVE	(Cseconds_mid), RR
;;;                 } 8 Expression (variable name)
;--	store_rr_var sm = -4(FP), SP at -6
	MOVE	RR, 2(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = sh
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (seconds_high)
;--	load_rr_var seconds_high, (16 bit)
	MOVE	(Cseconds_high), RR
;;;                 } 8 Expression (variable name)
;--	store_rr_var sh = -6(FP), SP at -6
	MOVE	RR, 0(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L17_cont_60:
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (seconds_changed)
;--	load_rr_var seconds_changed, (8 bit)
	MOVE	(Cseconds_changed), RU
;;;         } 4 Expression (variable name)
;--	branch_true
	JMP	RRNZ, L17_loop_60
L17_brk_61:
;;;       } 3 do while Statement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = printf
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr (l , r)
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = true
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = const char (20100)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_POINTER
;;;                     { 10 List<Ptr>
;;;                       { 11 Ptr
;;;                       } 11 Ptr
;;;                     } 10 List<Ptr>
;;;                   } 9 DeclItem
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = format
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (sl)
;--	load_rr_var sl = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;             } 6 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;             { 6 Expr (l , r)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = true
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = const char (20100)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_POINTER
;;;                       { 11 List<Ptr>
;;;                         { 12 Ptr
;;;                         } 12 Ptr
;;;                       } 11 List<Ptr>
;;;                     } 10 DeclItem
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = format
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (sm)
;--	load_rr_var sm = -4(FP), SP at -8 (16 bit)
	MOVE	4(SP), RR
;;;               } 7 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;               { 7 Expr (l , r)
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = true
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = const char (20100)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_POINTER
;;;                         { 12 List<Ptr>
;;;                           { 13 Ptr
;;;                           } 13 Ptr
;;;                         } 12 List<Ptr>
;;;                       } 11 DeclItem
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = format
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (sh)
;--	load_rr_var sh = -6(FP), SP at -10 (16 bit)
	MOVE	4(SP), RR
;;;                 } 8 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = true
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = const char (20100)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_POINTER
;;;                         { 12 List<Ptr>
;;;                           { 13 Ptr
;;;                           } 13 Ptr
;;;                         } 12 List<Ptr>
;;;                       } 11 DeclItem
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = format
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 StringExpression
;--	load_rr_string
	MOVE	#Cstr_28, RR
;;;                 } 8 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;               } 7 Expr (l , r)
;;;             } 6 Expr (l , r)
;;;           } 5 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 8 bytes
	ADD	SP, #8
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;     } 2 List<do while Statement>
;;;   } 1 CompoundStatement
;--	ret
L17_return:
;--	pop 6 bytes
	ADD	SP, #6
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = display_memory
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = display_memory
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned char (22000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = address
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cdisplay_memory:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = row
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = col
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<for Statement>
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = row
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;             } 6 NumericExpression (constant 0 = 0x0)
;--	store_rr_var row = -3(FP), SP at -5
	MOVE	RR, 2(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
;--	branch
	JMP	L18_tst_62
L18_loop_62:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = printf
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr (l , r)
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = true
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = const char (20100)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_POINTER
;;;                           { 13 List<Ptr>
;;;                             { 14 Ptr
;;;                             } 14 Ptr
;;;                           } 13 List<Ptr>
;;;                         } 12 DeclItem
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = format
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (address)
;--	load_rr_var address = 2(FP), SP at -5 (16 bit)
	MOVE	7(SP), RR
;;;                   } 9 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = true
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = const char (20100)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_POINTER
;;;                           { 13 List<Ptr>
;;;                             { 14 Ptr
;;;                             } 14 Ptr
;;;                           } 13 List<Ptr>
;;;                         } 12 DeclItem
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = format
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 StringExpression
;--	load_rr_string
	MOVE	#Cstr_29, RR
;;;                   } 9 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 } 8 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = col
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                   } 9 NumericExpression (constant 0 = 0x0)
;--	store_rr_var col = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L18_tst_64
L18_loop_64:
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = printf
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expr (l , r)
;;;                     { 10 ParameterDeclaration
;;;                       isEllipsis = true
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = const char (20100)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_POINTER
;;;                             { 14 List<Ptr>
;;;                               { 15 Ptr
;;;                               } 15 Ptr
;;;                             } 14 List<Ptr>
;;;                           } 13 DeclItem
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = format
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                     } 10 ParameterDeclaration
;;;                     { 10 Expr * r
;;;                       { 11 Expr l - r
;;;                         { 12 Expr ++r
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (address)
;--	load_rr_var address = 2(FP), SP at -5 (16 bit)
	MOVE	7(SP), RR
;;;                           } 13 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var address = 2(FP), SP at -5
	MOVE	RR, 7(SP)
;;;                         } 12 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                       } 11 Expr l - r
;--	content
	MOVE	(RR), RU
;;;                     } 10 Expr * r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                     { 10 ParameterDeclaration
;;;                       isEllipsis = true
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = const char (20100)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_POINTER
;;;                             { 14 List<Ptr>
;;;                               { 15 Ptr
;;;                               } 15 Ptr
;;;                             } 14 List<Ptr>
;;;                           } 13 DeclItem
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = format
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                     } 10 ParameterDeclaration
;;;                     { 10 StringExpression
;--	load_rr_string
	MOVE	#Cstr_30, RR
;;;                     } 10 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   } 9 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;                 } 8 Expr l(r)
;;;               } 7 ExpressionStatement
L18_cont_64:
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (col)
;--	load_rr_var col = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var col = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
L18_tst_64:
;;;               { 7 Expr l < r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (col)
;--	load_rr_var col = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                 } 8 Expression (variable name)
;--	l < r
	SLT	RR, #0x0010
;;;               } 7 Expr l < r
;--	branch_true
	JMP	RRNZ, L18_loop_64
L18_brk_65:
;;;             } 6 for Statement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l -= r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned char (22000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_POINTER
;;;                       { 11 List<Ptr>
;;;                         { 12 Ptr
;;;                         } 12 Ptr
;;;                       } 11 List<Ptr>
;;;                     } 10 DeclItem
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = address
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l - r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (address)
;--	load_rr_var address = 2(FP), SP at -5 (16 bit)
	MOVE	7(SP), RR
;;;                   } 9 Expression (variable name)
;--	l - r
	SUB	RR, #0x0010
;;;                 } 8 Expr l - r
;--	store_rr_var address = 2(FP), SP at -5
	MOVE	RR, 7(SP)
;;;               } 7 Expr l -= r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = printf
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = true
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = const char (20100)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_POINTER
;;;                         { 12 List<Ptr>
;;;                           { 13 Ptr
;;;                           } 13 Ptr
;;;                         } 12 List<Ptr>
;;;                       } 11 DeclItem
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = format
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 StringExpression
;--	load_rr_string
	MOVE	#Cstr_31, RR
;;;                 } 8 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = col
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                   } 9 NumericExpression (constant 0 = 0x0)
;--	store_rr_var col = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L18_tst_66
L18_loop_66:
;;;               { 7 CompoundStatement
;;;                 { 8 List<ExpressionStatement>
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = char (20000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = c
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr * r
;;;                         { 12 Expr l - r
;;;                           { 13 Expr ++r
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (address)
;--	load_rr_var address = 2(FP), SP at -5 (16 bit)
	MOVE	7(SP), RR
;;;                             } 14 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var address = 2(FP), SP at -5
	MOVE	RR, 7(SP)
;;;                           } 13 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                         } 12 Expr l - r
;--	content
	MOVE	(RR), RU
;;;                       } 11 Expr * r
;--	store_rr_var c = -1(FP), SP at -5
	MOVE	R, 4(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 IfElseStatement
;;;                     { 10 Expr l < r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -5 (8 bit)
	MOVE	4(SP), RS
;;;                       } 11 Expression (variable name)
;--	l < r
	SLT	RR, #0x0020
;;;                     } 10 Expr l < r
;--	branch_false
	JMP	RRZ, L18_else_68
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = putchr
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 ParameterDeclaration
;;;                           isEllipsis = false
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = char (20000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = c
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                         } 12 ParameterDeclaration
;;;                         { 12 NumericExpression (constant 46 = 0x2E)
;--	load_rr_constant
	MOVE	#0x002E, RR
;;;                         } 12 NumericExpression (constant 46 = 0x2E)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;--	branch
	JMP	L18_endif_68
L18_else_68:
;;;                     { 10 IfElseStatement
;;;                       { 11 Expr l < r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -5 (8 bit)
	MOVE	4(SP), RS
;;;                         } 12 Expression (variable name)
;--	l < r
	SLT	RR, #0x007F
;;;                       } 11 Expr l < r
;--	branch_false
	JMP	RRZ, L18_else_69
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = putchr
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = false
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = c
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -5 (8 bit)
	MOVE	4(SP), RS
;;;                           } 13 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
;--	branch
	JMP	L18_endif_69
L18_else_69:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = putchr
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = false
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = c
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 NumericExpression (constant 46 = 0x2E)
;--	load_rr_constant
	MOVE	#0x002E, RR
;;;                           } 13 NumericExpression (constant 46 = 0x2E)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
L18_endif_69:
;;;                     } 10 IfElseStatement
L18_endif_68:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L18_cont_66:
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (col)
;--	load_rr_var col = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var col = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
L18_tst_66:
;;;               { 7 Expr l < r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (col)
;--	load_rr_var col = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                 } 8 Expression (variable name)
;--	l < r
	SLT	RR, #0x0010
;;;               } 7 Expr l < r
;--	branch_true
	JMP	RRNZ, L18_loop_66
L18_brk_67:
;;;             } 6 for Statement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = printf
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = true
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = const char (20100)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_POINTER
;;;                         { 12 List<Ptr>
;;;                           { 13 Ptr
;;;                           } 13 Ptr
;;;                         } 12 List<Ptr>
;;;                       } 11 DeclItem
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = format
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 StringExpression
;--	load_rr_string
	MOVE	#Cstr_32, RR
;;;                 } 8 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L18_cont_62:
;;;         { 4 Expr l - r
;;;           { 5 Expr ++r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (row)
;--	load_rr_var row = -3(FP), SP at -5 (16 bit)
	MOVE	2(SP), RR
;;;             } 6 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var row = -3(FP), SP at -5
	MOVE	RR, 2(SP)
;;;           } 5 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;         } 4 Expr l - r
L18_tst_62:
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (row)
;--	load_rr_var row = -3(FP), SP at -5 (16 bit)
	MOVE	2(SP), RR
;;;           } 5 Expression (variable name)
;--	l < r
	SLT	RR, #0x0010
;;;         } 4 Expr l < r
;--	branch_true
	JMP	RRNZ, L18_loop_62
L18_brk_63:
;;;       } 3 for Statement
;;;     } 2 List<for Statement>
;;;   } 1 CompoundStatement
;--	ret
L18_return:
;--	pop 5 bytes
	ADD	SP, #5
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = int (80000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = main
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = main
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = argc
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_POINTER
;;;                 { 8 List<Ptr>
;;;                   { 9 Ptr
;;;                   } 9 Ptr
;;;                 } 8 List<Ptr>
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = argv
;;;               } 7 DeclItem
;;;               { 7 DeclItem
;;;                 what = DECL_ARRAY
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cmain:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = noprompt
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = last_c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_POINTER
;;;         { 4 List<Ptr>
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;         } 4 List<Ptr>
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = address
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	MOVE #0x05, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	OUT  R, (OUT_INT_MASK)
;;;       } 3 ExpressionStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L19_loop_70:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = last_c
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -5 (8 bit)
	MOVE	4(SP), RS
;;;                 } 8 Expression (variable name)
;--	store_rr_var last_c = -3(FP), SP at -5
	MOVE	R, 2(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr ! r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (noprompt)
;--	load_rr_var noprompt = -2(FP), SP at -5 (8 bit)
	MOVE	3(SP), RS
;;;                 } 8 Expression (variable name)
;--	16 bit ! r
	LNOT	RR
;;;               } 7 Expr ! r
;--	branch_false
	JMP	RRZ, L19_endif_72
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = printf
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = true
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = const char (20100)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_POINTER
;;;                           { 13 List<Ptr>
;;;                             { 14 Ptr
;;;                             } 14 Ptr
;;;                           } 13 List<Ptr>
;;;                         } 12 DeclItem
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = format
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 StringExpression
;--	load_rr_string
	MOVE	#Cstr_35, RR
;;;                   } 9 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                 } 8 Expr l(r)
;;;               } 7 ExpressionStatement
L19_endif_72:
;;;             } 6 IfElseStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = noprompt
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var noprompt = -2(FP), SP at -5
	MOVE	R, 3(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 SwitchStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = c
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = getchr
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;                 } 8 Expr l(r)
;--	store_rr_var c = -1(FP), SP at -5
	MOVE	R, 4(SP)
;;;               } 7 Expr l = r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	branch_case (8 bit)
	SEQ	LL, #0x000D
	JMP	RRNZ, L19_case_73_000D
;--	branch_case (8 bit)
	SEQ	LL, #0x000A
	JMP	RRNZ, L19_case_73_000A
;--	branch_case (8 bit)
	SEQ	LL, #0x0043
	JMP	RRNZ, L19_case_73_0043
;--	branch_case (8 bit)
	SEQ	LL, #0x0063
	JMP	RRNZ, L19_case_73_0063
;--	branch_case (8 bit)
	SEQ	LL, #0x0044
	JMP	RRNZ, L19_case_73_0044
;--	branch_case (8 bit)
	SEQ	LL, #0x0064
	JMP	RRNZ, L19_case_73_0064
;--	branch_case (8 bit)
	SEQ	LL, #0x0045
	JMP	RRNZ, L19_case_73_0045
;--	branch_case (8 bit)
	SEQ	LL, #0x0065
	JMP	RRNZ, L19_case_73_0065
;--	branch_case (8 bit)
	SEQ	LL, #0x004D
	JMP	RRNZ, L19_case_73_004D
;--	branch_case (8 bit)
	SEQ	LL, #0x006D
	JMP	RRNZ, L19_case_73_006D
;--	branch_case (8 bit)
	SEQ	LL, #0x0053
	JMP	RRNZ, L19_case_73_0053
;--	branch_case (8 bit)
	SEQ	LL, #0x0073
	JMP	RRNZ, L19_case_73_0073
;--	branch_case (8 bit)
	SEQ	LL, #0x0054
	JMP	RRNZ, L19_case_73_0054
;--	branch_case (8 bit)
	SEQ	LL, #0x0074
	JMP	RRNZ, L19_case_73_0074
;--	branch_case (8 bit)
	SEQ	LL, #0x0051
	JMP	RRNZ, L19_case_73_0051
;--	branch_case (8 bit)
	SEQ	LL, #0x0071
	JMP	RRNZ, L19_case_73_0071
;--	branch_case (8 bit)
	SEQ	LL, #0x0058
	JMP	RRNZ, L19_case_73_0058
;--	branch_case (8 bit)
	SEQ	LL, #0x0078
	JMP	RRNZ, L19_case_73_0078
;--	branch
	JMP	L19_deflt_73
;;;               { 7 CompoundStatement
;;;                 { 8 List<case Statement>
;;;                   { 9 case Statement
L19_case_73_000D:
;;;                     { 10 case Statement
L19_case_73_000A:
;;;                       { 11 IfElseStatement
;;;                         { 12 Expr l == r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (last_c)
;--	load_rr_var last_c = -3(FP), SP at -5 (8 bit)
	MOVE	2(SP), RS
;;;                           } 13 Expression (variable name)
;--	l == r
	SEQ	RR, #0x0064
;;;                         } 12 Expr l == r
;--	branch_false
	JMP	RRZ, L19_endif_74
;;;                         { 12 CompoundStatement
;;;                           { 13 List<ExpressionStatement>
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l += r
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = unsigned char (22000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_POINTER
;;;                                       { 19 List<Ptr>
;;;                                         { 20 Ptr
;;;                                         } 20 Ptr
;;;                                       } 19 List<Ptr>
;;;                                     } 18 DeclItem
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = address
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 Expr l + r
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (address)
;--	load_rr_var address = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                                   } 17 Expression (variable name)
;--	l + r
	ADD	RR, #0x0100
;;;                                 } 16 Expr l + r
;--	store_rr_var address = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                               } 15 Expr l += r
;;;                             } 14 ExpressionStatement
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l(r)
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = int (80000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = printf
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = true
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = const char (20100)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_POINTER
;;;                                         { 20 List<Ptr>
;;;                                           { 21 Ptr
;;;                                           } 21 Ptr
;;;                                         } 20 List<Ptr>
;;;                                       } 19 DeclItem
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = format
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;;;                                 { 16 StringExpression
;--	load_rr_string
	MOVE	#Cstr_36, RR
;;;                                 } 16 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                               } 15 Expr l(r)
;;;                             } 14 ExpressionStatement
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l(r)
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = void (10000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = display_memory
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = false
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = unsigned char (22000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_POINTER
;;;                                         { 20 List<Ptr>
;;;                                           { 21 Ptr
;;;                                           } 21 Ptr
;;;                                         } 20 List<Ptr>
;;;                                       } 19 DeclItem
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = address
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (address)
;--	load_rr_var address = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                                 } 16 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cdisplay_memory
;--	pop 2 bytes
	ADD	SP, #2
;;;                               } 15 Expr l(r)
;;;                             } 14 ExpressionStatement
;;;                             { 14 ExpressionStatement
;;;                               { 15 Expr l = r
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = char (20000)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = c
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 NumericExpression (constant 100 = 0x64)
;--	load_rr_constant
	MOVE	#0x0064, RR
;;;                                 } 16 NumericExpression (constant 100 = 0x64)
;--	store_rr_var c = -1(FP), SP at -5
	MOVE	R, 4(SP)
;;;                               } 15 Expr l = r
;;;                             } 14 ExpressionStatement
;;;                           } 13 List<ExpressionStatement>
;;;                         } 12 CompoundStatement
L19_endif_74:
;;;                       } 11 IfElseStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = char (20000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = noprompt
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                       } 11 NumericExpression (constant 1 = 0x1)
;--	store_rr_var noprompt = -2(FP), SP at -5
	MOVE	R, 3(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_0043:
;;;                     { 10 case Statement
L19_case_73_0063:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = void (10000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = show_time
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;--	push 0 bytes
;--	call
	CALL	Cshow_time
;--	pop 0 bytes
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_0044:
;;;                     { 10 case Statement
L19_case_73_0064:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l = r
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = char (20000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = last_c
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 NumericExpression (constant 100 = 0x64)
;--	load_rr_constant
	MOVE	#0x0064, RR
;;;                           } 13 NumericExpression (constant 100 = 0x64)
;--	store_rr_var last_c = -3(FP), SP at -5
	MOVE	R, 2(SP)
;;;                         } 12 Expr l = r
;;;                       } 11 ExpressionStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = printf
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = true
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = const char (20100)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_POINTER
;;;                               { 15 List<Ptr>
;;;                                 { 16 Ptr
;;;                                 } 16 Ptr
;;;                               } 15 List<Ptr>
;;;                             } 14 DeclItem
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = format
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 StringExpression
;--	load_rr_string
	MOVE	#Cstr_37, RR
;;;                       } 11 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_POINTER
;;;                             { 14 List<Ptr>
;;;                               { 15 Ptr
;;;                               } 15 Ptr
;;;                             } 14 List<Ptr>
;;;                           } 13 DeclItem
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = address
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expression (cast)r
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = gethex
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = false
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = echo
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                           } 13 NumericExpression (constant 1 = 0x1)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cgethex
;--	pop 1 bytes
	ADD	SP, #1
;;;                         } 12 Expr l(r)
;;;                       } 11 Expression (cast)r
;--	store_rr_var address = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = printf
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = true
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = const char (20100)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_POINTER
;;;                               { 15 List<Ptr>
;;;                                 { 16 Ptr
;;;                                 } 16 Ptr
;;;                               } 15 List<Ptr>
;;;                             } 14 DeclItem
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = format
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 StringExpression
;--	load_rr_string
	MOVE	#Cstr_38, RR
;;;                       } 11 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = getchr
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = void (10000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = display_memory
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = unsigned char (22000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_POINTER
;;;                               { 15 List<Ptr>
;;;                                 { 16 Ptr
;;;                                 } 16 Ptr
;;;                               } 15 List<Ptr>
;;;                             } 14 DeclItem
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = address
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (address)
;--	load_rr_var address = -5(FP), SP at -5 (16 bit)
	MOVE	0(SP), RR
;;;                       } 11 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cdisplay_memory
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_0045:
;;;                     { 10 case Statement
L19_case_73_0065:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = printf
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = true
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = const char (20100)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_POINTER
;;;                                   { 17 List<Ptr>
;;;                                     { 18 Ptr
;;;                                     } 18 Ptr
;;;                                   } 17 List<Ptr>
;;;                                 } 16 DeclItem
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = format
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 StringExpression
;--	load_rr_string
	MOVE	#Cstr_39, RR
;;;                           } 13 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = gethex
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = char (20000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = echo
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                       } 11 NumericExpression (constant 1 = 0x1)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cgethex
;--	pop 1 bytes
	ADD	SP, #1
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	OUT R, (OUT_LEDS)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = printf
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = true
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = const char (20100)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_POINTER
;;;                               { 15 List<Ptr>
;;;                                 { 16 Ptr
;;;                                 } 16 Ptr
;;;                               } 15 List<Ptr>
;;;                             } 14 DeclItem
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = format
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 StringExpression
;--	load_rr_string
	MOVE	#Cstr_41, RR
;;;                       } 11 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = getchr
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_004D:
;;;                     { 10 case Statement
L19_case_73_006D:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = printf
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = true
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = const char (20100)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_POINTER
;;;                                   { 17 List<Ptr>
;;;                                     { 18 Ptr
;;;                                     } 18 Ptr
;;;                                   } 17 List<Ptr>
;;;                                 } 16 DeclItem
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = format
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 StringExpression
;--	load_rr_string
	MOVE	#Cstr_42, RR
;;;                           } 13 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_POINTER
;;;                             { 14 List<Ptr>
;;;                               { 15 Ptr
;;;                               } 15 Ptr
;;;                             } 14 List<Ptr>
;;;                           } 13 DeclItem
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = address
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expression (cast)r
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = gethex
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 ParameterDeclaration
;;;                             isEllipsis = false
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = echo
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                           } 13 ParameterDeclaration
;;;                           { 13 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                           } 13 NumericExpression (constant 1 = 0x1)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cgethex
;--	pop 1 bytes
	ADD	SP, #1
;;;                         } 12 Expr l(r)
;;;                       } 11 Expression (cast)r
;--	store_rr_var address = -5(FP), SP at -5
	MOVE	RR, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = printf
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = true
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = const char (20100)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_POINTER
;;;                               { 15 List<Ptr>
;;;                                 { 16 Ptr
;;;                                 } 16 Ptr
;;;                               } 15 List<Ptr>
;;;                             } 14 DeclItem
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = format
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 StringExpression
;--	load_rr_string
	MOVE	#Cstr_43, RR
;;;                       } 11 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = getchr
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = address
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = gethex
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 ParameterDeclaration
;;;                           isEllipsis = false
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = char (20000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = echo
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                         } 12 ParameterDeclaration
;;;                         { 12 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                         } 12 NumericExpression (constant 1 = 0x1)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cgethex
;--	pop 1 bytes
	ADD	SP, #1
;;;                       } 11 Expr l(r)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (address)
;--	load_rr_var address = -5(FP), SP at -6 (16 bit)
	MOVE	1(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RU
;--	assign (8 bit)
	MOVE	R, (LL)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = getchr
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = printf
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = true
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = const char (20100)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_POINTER
;;;                               { 15 List<Ptr>
;;;                                 { 16 Ptr
;;;                                 } 16 Ptr
;;;                               } 15 List<Ptr>
;;;                             } 14 DeclItem
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = format
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 StringExpression
;--	load_rr_string
	MOVE	#Cstr_44, RR
;;;                       } 11 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_0053:
;;;                     { 10 case Statement
L19_case_73_0073:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = printf
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 Expr (l , r)
;;;                             { 14 ParameterDeclaration
;;;                               isEllipsis = true
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = const char (20100)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_POINTER
;;;                                     { 18 List<Ptr>
;;;                                       { 19 Ptr
;;;                                       } 19 Ptr
;;;                                     } 18 List<Ptr>
;;;                                   } 17 DeclItem
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = format
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                             } 14 ParameterDeclaration
	IN (IN_DIP_SWITCH), RU
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                             { 14 ParameterDeclaration
;;;                               isEllipsis = true
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = const char (20100)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_POINTER
;;;                                     { 18 List<Ptr>
;;;                                       { 19 Ptr
;;;                                       } 19 Ptr
;;;                                     } 18 List<Ptr>
;;;                                   } 17 DeclItem
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = format
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                             } 14 ParameterDeclaration
;;;                             { 14 StringExpression
;--	load_rr_string
	MOVE	#Cstr_45, RR
;;;                             } 14 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                           } 13 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_0054:
;;;                     { 10 case Statement
L19_case_73_0074:
;;;                       { 11 ExpressionStatement
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = printf
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                           { 13 Expr (l , r)
;;;                             { 14 ParameterDeclaration
;;;                               isEllipsis = true
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = const char (20100)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_POINTER
;;;                                     { 18 List<Ptr>
;;;                                       { 19 Ptr
;;;                                       } 19 Ptr
;;;                                     } 18 List<Ptr>
;;;                                   } 17 DeclItem
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = format
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                             } 14 ParameterDeclaration
	IN (IN_TEMPERAT), RU
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                             { 14 ParameterDeclaration
;;;                               isEllipsis = true
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = const char (20100)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_POINTER
;;;                                     { 18 List<Ptr>
;;;                                       { 19 Ptr
;;;                                       } 19 Ptr
;;;                                     } 18 List<Ptr>
;;;                                   } 17 DeclItem
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = format
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                             } 14 ParameterDeclaration
;;;                             { 14 StringExpression
;--	load_rr_string
	MOVE	#Cstr_47, RR
;;;                             } 14 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                           } 13 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;                         } 12 Expr l(r)
;;;                       } 11 ExpressionStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_case_73_0051:
;;;                     { 10 case Statement
L19_case_73_0071:
;;;                       { 11 case Statement
L19_case_73_0058:
;;;                         { 12 case Statement
L19_case_73_0078:
;;;                           { 13 ExpressionStatement
;;;                             { 14 Expr l(r)
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = printf
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                               { 15 ParameterDeclaration
;;;                                 isEllipsis = true
;;;                                 { 16 TypeName
;;;                                   { 17 TypeSpecifier (all)
;;;                                     spec = const char (20100)
;;;                                   } 17 TypeSpecifier (all)
;;;                                   { 17 List<DeclItem>
;;;                                     { 18 DeclItem
;;;                                       what = DECL_POINTER
;;;                                       { 19 List<Ptr>
;;;                                         { 20 Ptr
;;;                                         } 20 Ptr
;;;                                       } 19 List<Ptr>
;;;                                     } 18 DeclItem
;;;                                     { 18 DeclItem
;;;                                       what = DECL_NAME
;;;                                       name = format
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                               } 15 ParameterDeclaration
;;;                               { 15 StringExpression
;--	load_rr_string
	MOVE	#Cstr_49, RR
;;;                               } 15 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                             } 14 Expr l(r)
;;;                           } 13 ExpressionStatement
;;;                         } 12 case Statement
;;;                       } 11 case Statement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 while Statement
L19_loop_75:
;;;                     { 10 ExpressionStatement
;;;                     } 10 ExpressionStatement
L19_cont_75:
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (serial_out_length)
;--	load_rr_var serial_out_length, (8 bit)
	MOVE	(Cserial_out_length), RU
;;;                     } 10 Expression (variable name)
;--	branch_true
	JMP	RRNZ, L19_loop_75
L19_brk_76:
;;;                   } 9 while Statement
;;;                   { 9 ExpressionStatement
	DI
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	HALT
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L19_brk_73
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L19_deflt_73:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = printf
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 ParameterDeclaration
;;;                           isEllipsis = true
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = const char (20100)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_POINTER
;;;                                 { 16 List<Ptr>
;;;                                   { 17 Ptr
;;;                                   } 17 Ptr
;;;                                 } 16 List<Ptr>
;;;                               } 15 DeclItem
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = format
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                         } 12 ParameterDeclaration
;;;                         { 12 StringExpression
;--	load_rr_string
	MOVE	#Cstr_52, RR
;;;                         } 12 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                 } 8 List<case Statement>
;;;               } 7 CompoundStatement
L19_brk_73:
;;;             } 6 SwitchStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L19_cont_70:
;--	branch
	JMP	L19_loop_70
L19_brk_71:
;;;       } 3 for Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L19_return:
;--	pop 5 bytes
	ADD	SP, #5
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
Cstr_19:				;
	.BYTE	0x30			;
	.BYTE	0x31			;
	.BYTE	0x32			;
	.BYTE	0x33			;
	.BYTE	0x34			;
	.BYTE	0x35			;
	.BYTE	0x36			;
	.BYTE	0x37			;
	.BYTE	0x38			;
	.BYTE	0x39			;
	.BYTE	0x41			;
	.BYTE	0x42			;
	.BYTE	0x43			;
	.BYTE	0x44			;
	.BYTE	0x45			;
	.BYTE	0x46			;
	.BYTE	0			;
Cstr_20:				;
	.BYTE	0x30			;
	.BYTE	0x58			;
	.BYTE	0			;
Cstr_21:				;
	.BYTE	0			;
Cstr_22:				;
	.BYTE	0			;
Cstr_23:				;
	.BYTE	0			;
Cstr_24:				;
	.BYTE	0x30			;
	.BYTE	0x31			;
	.BYTE	0x32			;
	.BYTE	0x33			;
	.BYTE	0x34			;
	.BYTE	0x35			;
	.BYTE	0x36			;
	.BYTE	0x37			;
	.BYTE	0x38			;
	.BYTE	0x39			;
	.BYTE	0x61			;
	.BYTE	0x62			;
	.BYTE	0x63			;
	.BYTE	0x64			;
	.BYTE	0x65			;
	.BYTE	0x66			;
	.BYTE	0			;
Cstr_25:				;
	.BYTE	0x30			;
	.BYTE	0x78			;
	.BYTE	0			;
Cstr_28:				;
	.BYTE	0x55			;
	.BYTE	0x70			;
	.BYTE	0x74			;
	.BYTE	0x69			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x2E			;
	.BYTE	0x34			;
	.BYTE	0x58			;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x2E			;
	.BYTE	0x34			;
	.BYTE	0x58			;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x2E			;
	.BYTE	0x34			;
	.BYTE	0x58			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x63			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x64			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_29:				;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x2E			;
	.BYTE	0x34			;
	.BYTE	0x58			;
	.BYTE	0x3A			;
	.BYTE	0			;
Cstr_30:				;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x32			;
	.BYTE	0x2E			;
	.BYTE	0x32			;
	.BYTE	0x58			;
	.BYTE	0			;
Cstr_31:				;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_32:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_35:				;
	.BYTE	0x2D			;
	.BYTE	0x3E			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_36:				;
	.BYTE	0x08			;
	.BYTE	0x08			;
	.BYTE	0x08			;
	.BYTE	0x08			;
	.BYTE	0			;
Cstr_37:				;
	.BYTE	0x44			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x70			;
	.BYTE	0x6C			;
	.BYTE	0x61			;
	.BYTE	0x79			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_38:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_39:				;
	.BYTE	0x4C			;
	.BYTE	0x45			;
	.BYTE	0x44			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_41:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_42:				;
	.BYTE	0x4D			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x79			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_43:				;
	.BYTE	0x20			;
	.BYTE	0x56			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x75			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_44:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_45:				;
	.BYTE	0x44			;
	.BYTE	0x49			;
	.BYTE	0x50			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x77			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x63			;
	.BYTE	0x68			;
	.BYTE	0x20			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x30			;
	.BYTE	0x78			;
	.BYTE	0x25			;
	.BYTE	0x58			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_47:				;
	.BYTE	0x54			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x70			;
	.BYTE	0x65			;
	.BYTE	0x72			;
	.BYTE	0x61			;
	.BYTE	0x74			;
	.BYTE	0x75			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x64			;
	.BYTE	0x65			;
	.BYTE	0x67			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x65			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x43			;
	.BYTE	0x65			;
	.BYTE	0x6C			;
	.BYTE	0x73			;
	.BYTE	0x69			;
	.BYTE	0x75			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_49:				;
	.BYTE	0x48			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x74			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x2E			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_52:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x43			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x77			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x69			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x44			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x64			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x70			;
	.BYTE	0x6C			;
	.BYTE	0x61			;
	.BYTE	0x79			;
	.BYTE	0x20			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x79			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x45			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x74			;
	.BYTE	0x20			;
	.BYTE	0x4C			;
	.BYTE	0x45			;
	.BYTE	0x44			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x4D			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x6D			;
	.BYTE	0x6F			;
	.BYTE	0x64			;
	.BYTE	0x69			;
	.BYTE	0x66			;
	.BYTE	0x79			;
	.BYTE	0x20			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x79			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x53			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x61			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x44			;
	.BYTE	0x49			;
	.BYTE	0x50			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x77			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x63			;
	.BYTE	0x68			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x54			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x61			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x70			;
	.BYTE	0x65			;
	.BYTE	0x72			;
	.BYTE	0x61			;
	.BYTE	0x74			;
	.BYTE	0x75			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x51			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x71			;
	.BYTE	0x75			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x58			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x65			;
	.BYTE	0x78			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cend_text:				;
