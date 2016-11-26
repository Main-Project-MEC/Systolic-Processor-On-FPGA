IN_RX_DATA	= 0x00			;
IN_STATUS	= 0x01			;

MEMTOP		= 0x2000

OUT_TX_DATA	= 0x00			;
;---------------------------------------;
RELOC_SRC	= start+Cend_text-stack	;
;---------------------------------------;
					;
	MOVE	#reloc_rr, RR		;
	MOVE	RR, SP			;
	MOVE	#MEMTOP, LL		; destination
reloc:					;
	MOVE	(SP)+, RR		; restore source
	MOVE	-(RR), -(LL)		;
	MOVE	RR, -(SP)		; save source
	SHI	RR, #start		;
	JMP	RRNZ, reloc		;
	MOVE	#stack, RR		;
	MOVE	RR, SP			;
	CALL	Cmain			;
halt:					;
	HALT				;
reloc_rr:				; source
	.WORD	RELOC_SRC		;
;---------------------------------------;
start:					;
	.OFFSET	MEMTOP			;
stack:					;
;---------------------------------------;
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
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
L2_loop_1:
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L2_cont_1:
;;;         { 4 Expr ! r
;;;           { 5 Expr l & r
;;;             { 6 TypeName (internal)
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;             } 6 TypeName (internal)
	IN   (IN_STATUS), RU
;--	l & r
	AND	RR, #0x0001
;;;           } 5 Expr l & r
;--	16 bit ! r
	LNOT	RR
;;;         } 4 Expr ! r
;--	branch_true
	JMP	RRNZ, L2_loop_1
L2_brk_2:
;;;       } 3 while Statement
;;;       { 3 ExpressionStatement
IN   (IN_RX_DATA), RU
;;;       } 3 ExpressionStatement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L2_return:
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
L3_loop_3:
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L3_cont_3:
;;;         { 4 Expr l & r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
	IN (IN_STATUS), RU
;--	l & r
	AND	RR, #0x0002
;;;         } 4 Expr l & r
;--	branch_true
	JMP	RRNZ, L3_loop_3
L3_brk_4:
;;;       } 3 while Statement
;;;       { 3 ExpressionStatement
	MOVE 2(SP), RU
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	OUT  R, (OUT_TX_DATA)
;;;       } 3 ExpressionStatement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L3_return:
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
	JMP	L4_cont_5
L4_loop_5:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
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
;--	push 0 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L4_cont_5:
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
	JMP	RRNZ, L4_loop_5
L4_brk_6:
;;;       } 3 while Statement
;;;     } 2 List<while Statement>
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
;;;       spec = unsigned char (22000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = get_nibble
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = get_nibble
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cget_nibble:
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
;;;               name = getchr
;;;             } 6 DeclItem
;;;           } 5 List<DeclItem>
;;;         } 4 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;       } 3 Expr l(r)
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
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;           } 5 Expression (variable name)
;--	l < r
	SLO	RR, #0x0030
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L5_endif_7
;;;         { 4 return Statement
;;;           { 5 NumericExpression (constant 255 = 0xFF)
;--	load_rr_constant
	MOVE	#0x00FF, RR
;;;           } 5 NumericExpression (constant 255 = 0xFF)
;--	branch
	JMP	L5_return
;;;         } 4 return Statement
L5_endif_7:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l <= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;           } 5 Expression (variable name)
;--	l <= r
	SLS	RR, #0x0039
;;;         } 4 Expr l <= r
;--	branch_false
	JMP	RRZ, L5_endif_8
;;;         { 4 return Statement
;;;           { 5 Expr l - r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;             } 6 Expression (variable name)
;--	l - r
	SUB	RR, #0x0030
;;;           } 5 Expr l - r
;--	branch
	JMP	L5_return
;;;         } 4 return Statement
L5_endif_8:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;           } 5 Expression (variable name)
;--	l < r
	SLO	RR, #0x0041
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L5_endif_9
;;;         { 4 return Statement
;;;           { 5 NumericExpression (constant 255 = 0xFF)
;--	load_rr_constant
	MOVE	#0x00FF, RR
;;;           } 5 NumericExpression (constant 255 = 0xFF)
;--	branch
	JMP	L5_return
;;;         } 4 return Statement
L5_endif_9:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l <= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;           } 5 Expression (variable name)
;--	l <= r
	SLS	RR, #0x0046
;;;         } 4 Expr l <= r
;--	branch_false
	JMP	RRZ, L5_endif_10
;;;         { 4 return Statement
;;;           { 5 Expr l - r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;             } 6 Expression (variable name)
;--	l - r
	SUB	RR, #0x0037
;;;           } 5 Expr l - r
;--	branch
	JMP	L5_return
;;;         } 4 return Statement
L5_endif_10:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;           } 5 Expression (variable name)
;--	l < r
	SLO	RR, #0x0061
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L5_endif_11
;;;         { 4 return Statement
;;;           { 5 NumericExpression (constant 255 = 0xFF)
;--	load_rr_constant
	MOVE	#0x00FF, RR
;;;           } 5 NumericExpression (constant 255 = 0xFF)
;--	branch
	JMP	L5_return
;;;         } 4 return Statement
L5_endif_11:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l <= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;           } 5 Expression (variable name)
;--	l <= r
	SLS	RR, #0x0066
;;;         } 4 Expr l <= r
;--	branch_false
	JMP	RRZ, L5_endif_12
;;;         { 4 return Statement
;;;           { 5 Expr l - r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RU
;;;             } 6 Expression (variable name)
;--	l - r
	SUB	RR, #0x0057
;;;           } 5 Expr l - r
;--	branch
	JMP	L5_return
;;;         } 4 return Statement
L5_endif_12:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 NumericExpression (constant 255 = 0xFF)
;--	load_rr_constant
	MOVE	#0x00FF, RR
;;;         } 4 NumericExpression (constant 255 = 0xFF)
;--	branch
	JMP	L5_return
;;;       } 3 return Statement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L5_return:
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
;;;         name = get_byte
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = get_byte
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cget_byte:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = hi
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr l(r)
;;;         { 4 TypeName
;;;           { 5 TypeSpecifier (all)
;;;             spec = unsigned char (22000)
;;;           } 5 TypeSpecifier (all)
;;;           { 5 List<DeclItem>
;;;             { 6 DeclItem
;;;               what = DECL_NAME
;;;               name = get_nibble
;;;             } 6 DeclItem
;;;           } 5 List<DeclItem>
;;;         } 4 TypeName
;--	push 1 bytes
;--	call
	CALL	Cget_nibble
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
;;;         name = lo
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<IfElseStatement>
;;;       { 3 IfElseStatement
;;;         { 4 Expr l != r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (hi)
;--	load_rr_var hi = -1(FP), SP at -2 (8 bit)
	MOVE	1(SP), RU
;;;           } 5 Expression (variable name)
;--	l != r
	SNE	RR, #0x00FF
;;;         } 4 Expr l != r
;--	branch_false
	JMP	RRZ, L6_endif_13
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
;;;                       name = lo
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l(r)
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned char (22000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = get_nibble
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;--	push 1 bytes
;--	call
	CALL	Cget_nibble
;--	pop 0 bytes
;;;                 } 8 Expr l(r)
;--	store_rr_var lo = -2(FP), SP at -2
	MOVE	R, 0(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l != r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (lo)
;--	load_rr_var lo = -2(FP), SP at -2 (8 bit)
	MOVE	0(SP), RU
;;;                 } 8 Expression (variable name)
;--	l != r
	SNE	RR, #0x00FF
;;;               } 7 Expr l != r
;--	branch_false
	JMP	RRZ, L6_endif_14
;;;               { 7 return Statement
;;;                 { 8 Expr l | r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned int (82000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr l << r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (hi)
;--	load_rr_var hi = -1(FP), SP at -2 (8 bit)
	MOVE	1(SP), RU
;;;                     } 10 Expression (variable name)
;--	l << r
	LSL	RR, #0x0004
;;;                   } 9 Expr l << r
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (lo)
;--	load_rr_var lo = -2(FP), SP at -2 (8 bit)
	MOVE	0(SP), RU
;;;                   } 9 Expression (variable name)
;--	l | r
	OR	LL, RR
;;;                 } 8 Expr l | r
;--	branch
	JMP	L6_return
;;;               } 7 return Statement
L6_endif_14:
;;;             } 6 IfElseStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L6_endif_13:
;;;       } 3 IfElseStatement
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
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_5, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cprint_string
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	HALT
;;;       } 3 ExpressionStatement
;;;     } 2 List<IfElseStatement>
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
;;;         name = record_length
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = address
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = record_type
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = check_sum
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = i
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
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
;;;     { 2 List<for Statement>
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L7_loop_15:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = print_string
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
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
;;;                         name = buffer
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 StringExpression
;--	load_rr_string
	MOVE	#Cstr_7, RR
;;;                 } 8 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cprint_string
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;               } 7 ExpressionStatement
L7_loop_17:
;;;               { 7 CompoundStatement
;;;                 { 8 List<while Statement>
;;;                   { 9 while Statement
L7_loop_19:
;;;                     { 10 ExpressionStatement
;;;                     } 10 ExpressionStatement
L7_cont_19:
;;;                     { 10 Expr l != r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expr l = r
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = unsigned char (22000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = c
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 Expr l(r)
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                             { 14 List<DeclItem>
;;;                               { 15 DeclItem
;;;                                 what = DECL_NAME
;;;                                 name = getchr
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;--	push 2 bytes
;--	call
	CALL	Cgetchr
;--	pop 0 bytes
;;;                         } 12 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                       } 11 Expr l = r
;--	l != r
	SNE	RR, #0x003A
;;;                     } 10 Expr l != r
;--	branch_true
	JMP	RRNZ, L7_loop_19
L7_brk_20:
;;;                   } 9 while Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = check_sum
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                       } 11 NumericExpression (constant 0 = 0x0)
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                     } 10 Expr l = r
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
;;;                             name = c
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
;;;                               name = get_byte
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 2 bytes
;--	call
	CALL	Cget_byte
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = check_sum
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                         } 12 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                     } 10 Expr l += r
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
;;;                             name = record_length
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                       } 11 Expression (variable name)
;--	store_rr_var record_length = -1(FP), SP at -7
	MOVE	R, 6(SP)
;;;                     } 10 Expr l = r
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
;;;                             name = c
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
;;;                               name = get_byte
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 2 bytes
;--	call
	CALL	Cget_byte
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = check_sum
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                         } 12 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = address
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l << r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	l << r
	LSL	RR, #0x0008
;;;                       } 11 Expr l << r
;--	store_rr_var address = -3(FP), SP at -7
	MOVE	RR, 4(SP)
;;;                     } 10 Expr l = r
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
;;;                             name = c
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
;;;                               name = get_byte
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 2 bytes
;--	call
	CALL	Cget_byte
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = check_sum
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                         } 12 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l | r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = address
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l | r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = unsigned int (82000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (address)
;--	load_rr_var address = -3(FP), SP at -7 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	l | r
	OR	LL, RR
;;;                       } 11 Expr l | r
;--	store_rr_var address = -3(FP), SP at -7
	MOVE	RR, 4(SP)
;;;                     } 10 Expr l | r
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
;;;                             name = c
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
;;;                               name = get_byte
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 2 bytes
;--	call
	CALL	Cget_byte
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = check_sum
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                         } 12 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                     } 10 Expr l += r
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
;;;                             name = record_type
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                       } 11 Expression (variable name)
;--	store_rr_var record_type = -4(FP), SP at -7
	MOVE	R, 3(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 for Statement
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l = r
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = unsigned char (22000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = i
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                         } 12 NumericExpression (constant 0 = 0x0)
;--	store_rr_var i = -6(FP), SP at -7
	MOVE	R, 1(SP)
;;;                       } 11 Expr l = r
;;;                     } 10 ExpressionStatement
;--	branch
	JMP	L7_tst_21
L7_loop_21:
;;;                     { 10 CompoundStatement
;;;                       { 11 List<ExpressionStatement>
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l = r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = unsigned char (22000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = c
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l(r)
;;;                               { 15 TypeName
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                                 { 16 List<DeclItem>
;;;                                   { 17 DeclItem
;;;                                     what = DECL_NAME
;;;                                     name = get_byte
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;--	push 2 bytes
;--	call
	CALL	Cget_byte
;--	pop 0 bytes
;;;                             } 14 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                           } 13 Expr l = r
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l = r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                             } 14 TypeName
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                             } 14 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                             { 14 Expr l[r]
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (i)
;--	load_rr_var i = -6(FP), SP at -8 (8 bit)
	MOVE	2(SP), RU
;;;                               } 15 Expression (variable name)
;--	scale_rr *1
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                               { 15 Expression (cast)r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (address)
;--	load_rr_var address = -3(FP), SP at -10 (16 bit)
	MOVE	7(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expression (cast)r
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	+ (element)
	ADD	LL, RR
;;;                             } 14 Expr l[r]
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;                           } 13 Expr l = r
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l += r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = unsigned char (22000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = check_sum
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l + r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                               } 15 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                               } 15 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                             } 14 Expr l + r
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                           } 13 Expr l += r
;;;                         } 12 ExpressionStatement
;;;                       } 11 List<ExpressionStatement>
;;;                     } 10 CompoundStatement
L7_cont_21:
;;;                     { 10 Expr l - r
;;;                       { 11 Expr ++r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (i)
;--	load_rr_var i = -6(FP), SP at -7 (8 bit)
	MOVE	1(SP), RU
;;;                         } 12 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var i = -6(FP), SP at -7
	MOVE	R, 1(SP)
;;;                       } 11 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;                     } 10 Expr l - r
L7_tst_21:
;;;                     { 10 Expr l < r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (i)
;--	load_rr_var i = -6(FP), SP at -7 (8 bit)
	MOVE	1(SP), RU
;;;                       } 11 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (record_length)
;--	load_rr_var record_length = -1(FP), SP at -7 (8 bit)
	MOVE	6(SP), RU
;;;                       } 11 Expression (variable name)
;--	l < r
	SLO	LL, RR
;;;                     } 10 Expr l < r
;--	branch_true
	JMP	RRNZ, L7_loop_21
L7_brk_22:
;;;                   } 9 for Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = c
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
;;;                               name = get_byte
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 2 bytes
;--	call
	CALL	Cget_byte
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;--	store_rr_var c = -7(FP), SP at -7
	MOVE	R, 0(SP)
;;;                     } 10 Expr l = r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned char (22000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = check_sum
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                         } 12 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (c)
;--	load_rr_var c = -7(FP), SP at -7 (8 bit)
	MOVE	0(SP), RU
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var check_sum = -5(FP), SP at -7
	MOVE	R, 2(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 IfElseStatement
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (check_sum)
;--	load_rr_var check_sum = -5(FP), SP at -7 (8 bit)
	MOVE	2(SP), RU
;;;                     } 10 Expression (variable name)
;--	branch_false
	JMP	RRZ, L7_endif_23
;;;                     { 10 break/continue Statement
;--	branch
	JMP	L7_brk_18
;;;                     } 10 break/continue Statement
L7_endif_23:
;;;                   } 9 IfElseStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = void (10000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = putchr
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
;;;                               name = c
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 46 = 0x2E)
;--	load_rr_constant
	MOVE	#0x002E, RR
;;;                       } 11 NumericExpression (constant 46 = 0x2E)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 IfElseStatement
;;;                     { 10 Expr l == r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (record_type)
;--	load_rr_var record_type = -4(FP), SP at -7 (8 bit)
	MOVE	3(SP), RU
;;;                       } 11 Expression (variable name)
;--	l == r
	SEQ	RR, #0x0001
;;;                     } 10 Expr l == r
;--	branch_false
	JMP	RRZ, L7_endif_24
;;;                     { 10 CompoundStatement
;;;                       { 11 List<ExpressionStatement>
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l(r)
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = void (10000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = print_string
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 ParameterDeclaration
;;;                               isEllipsis = false
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
;;;                                     name = buffer
;;;                                   } 17 DeclItem
;;;                                 } 16 List<DeclItem>
;;;                               } 15 TypeName
;;;                             } 14 ParameterDeclaration
;;;                             { 14 StringExpression
;--	load_rr_string
	MOVE	#Cstr_8, RR
;;;                             } 14 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cprint_string
;--	pop 2 bytes
	ADD	SP, #2
;;;                           } 13 Expr l(r)
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l(r)
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = void (10000)
;;;                               } 15 TypeSpecifier (all)
;;;                             } 14 TypeName
;--	push 2 bytes
;;;                             { 14 Expression (cast)r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (address)
;--	load_rr_var address = -3(FP), SP at -7 (16 bit)
	MOVE	4(SP), RR
;;;                               } 15 Expression (variable name)
;;;                             } 14 Expression (cast)r
;--	call_ptr
	CALL	(RR)
;--	pop 0 bytes
;;;                           } 13 Expr l(r)
;;;                         } 12 ExpressionStatement
;;;                       } 11 List<ExpressionStatement>
;;;                     } 10 CompoundStatement
L7_endif_24:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<while Statement>
;;;               } 7 CompoundStatement
L7_cont_17:
;--	branch
	JMP	L7_loop_17
L7_brk_18:
;;;             } 6 for Statement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = print_string
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
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
;;;                         name = buffer
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 StringExpression
;--	load_rr_string
	MOVE	#Cstr_9, RR
;;;                 } 8 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cprint_string
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L7_cont_15:
;--	branch
	JMP	L7_loop_15
L7_brk_16:
;;;       } 3 for Statement
;;;     } 2 List<for Statement>
;;;   } 1 CompoundStatement
;--	ret
L7_return:
;--	pop 7 bytes
	ADD	SP, #7
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
Cstr_5:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x45			;
	.BYTE	0x52			;
	.BYTE	0x52			;
	.BYTE	0x4F			;
	.BYTE	0x52			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x6E			;
	.BYTE	0x6F			;
	.BYTE	0x74			;
	.BYTE	0x20			;
	.BYTE	0x68			;
	.BYTE	0x65			;
	.BYTE	0x78			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_7:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x4C			;
	.BYTE	0x4F			;
	.BYTE	0x41			;
	.BYTE	0x44			;
	.BYTE	0x20			;
	.BYTE	0x3E			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_8:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x44			;
	.BYTE	0x4F			;
	.BYTE	0x4E			;
	.BYTE	0x45			;
	.BYTE	0x2E			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_9:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x43			;
	.BYTE	0x48			;
	.BYTE	0x45			;
	.BYTE	0x43			;
	.BYTE	0x4B			;
	.BYTE	0x53			;
	.BYTE	0x55			;
	.BYTE	0x4D			;
	.BYTE	0x20			;
	.BYTE	0x45			;
	.BYTE	0x52			;
	.BYTE	0x52			;
	.BYTE	0x4F			;
	.BYTE	0x52			;
	.BYTE	0x2E			;
	.BYTE	0			;
Cend_text:				;
