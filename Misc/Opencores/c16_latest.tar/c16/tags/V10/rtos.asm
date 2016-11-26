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
;;;   { 1 TypeSpecifier (enum)
;;;     spec = anonymous enum (2000000)
;;;   } 1 TypeSpecifier (enum)
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = typedef struct '_task' (800001)
;;;     name = _task
;;;   } 1 TypeSpecifier (struct/union)
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = typedef struct '_semaphore' (800001)
;;;     name = _semaphore
;;;   } 1 TypeSpecifier (struct/union)
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = struct '_task' (800000)
;;;     name = _task
;;;   } 1 TypeSpecifier (struct/union)
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = extern 'Task' (4000002)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
	.EXTERN	Ccurrent_task
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = extern 'Task' (4000002)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
	.EXTERN	Ctask_idle
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = struct '_semaphore' (800000)
;;;     name = _semaphore
;;;   } 1 TypeSpecifier (struct/union)
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Semaphore' (4000000)
;;;     name = Semaphore
;;;   } 1 TypeSpecifier (struct/union)
Crx_sema:			; 
	.WORD	0
	.WORD	0
	.WORD	0
	.WORD	Cstr_0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Semaphore' (4000000)
;;;     name = Semaphore
;;;   } 1 TypeSpecifier (struct/union)
Ct2_control:			; 
	.WORD	0
	.WORD	0
	.WORD	0
	.WORD	Cstr_1
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Semaphore' (4000000)
;;;     name = Semaphore
;;;   } 1 TypeSpecifier (struct/union)
Ct3_control:			; 
	.WORD	0
	.WORD	0
	.WORD	0
	.WORD	Cstr_2
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Semaphore' (4000000)
;;;     name = Semaphore
;;;   } 1 TypeSpecifier (struct/union)
Cserial_out:			; 
	.WORD	1
	.WORD	0
	.WORD	0
	.WORD	Cstr_3
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Semaphore' (4000000)
;;;     name = Semaphore
;;;   } 1 TypeSpecifier (struct/union)
Ctx_sema:			; 
	.WORD	16
	.WORD	0
	.WORD	0
	.WORD	Cstr_4
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
;;;         name = switch_tasks
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = switch_tasks
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cswitch_tasks:
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
;;;         name = next
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
;;;         what = DECL_POINTER
;;;         { 4 List<Ptr>
;;;           { 5 Ptr
;;;           } 5 Ptr
;;;         } 4 List<Ptr>
;;;       } 3 DeclItem
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = t
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expression (variable name)
;;;         expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;       } 3 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement

st_loop:
	MOVE	0(SP), RR		; RR = t
	MOVE	(RR), RR		; RR = t->next_task
	MOVE	RR, 0(SP)		; t  = t->next_task
	ADD	RR, #4			; RR = & t->status
	MOVE	(RR), RS		; RR = t->status
	JMP	RRNZ, st_next_task	; jump if (status != 0)
					;
	MOVE	2(SP), RR		; RR = next
	JMP	RRZ, st_accept		; jump if (next == 0)
					;
	ADD	RR, #5			; RR = & next->priority
	MOVE	(RR), RS		; RR = next->priority
	MOVE	RR, LL			; LL = next->priority
	MOVE	0(SP), RR		; RR = t
	ADD	RR, #5			; RR = & t->priority
	MOVE	(RR), RS		; RR = t->priority
	SGT	LL, RR			; RR = (next->priority > t->priority)
	JMP	RRNZ, st_next_task	; jump if (next->priority > t->priority)
st_accept:				;
	MOVE	0(SP), RR		; RR = t
	MOVE	RR, 2(SP)		; next = t
st_next_task:				;
	MOVE	0(SP), RR		; RR = t
	MOVE	(Ccurrent_task), LL	; LL = current_task
	SNE	LL, RR			; RR = (t != current_task)
	JMP	RRNZ, st_loop		;
	
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l != r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_task' (800000)
;;;               name = _task
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = current_task
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;           } 5 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -4 (16 bit)
	MOVE	2(SP), RR
;;;           } 5 Expression (variable name)
;--	l != r
	SNE	LL, RR
;;;         } 4 Expr l != r
;--	branch_false
	JMP	RRZ, L2_endif_1
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
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
;;;                       name = stack_pointer
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (cast)r
	LEA  0(SP), RR
;;;                 } 8 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = current_task
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -4 (16 bit)
	MOVE	2(SP), RR
;;;                 } 8 Expression (variable name)
;--	store_rr_var current_task
	MOVE	RR, (Ccurrent_task)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr * r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                 } 8 Expression (variable name)
;;;               } 7 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
	MOVE RR, SP
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L2_endif_1:
;;;       } 3 IfElseStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L2_return:
;--	pop 4 bytes
	ADD	SP, #4
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
;;;         name = P
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = P
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_semaphore' (800000)
;;;               name = _semaphore
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
CP:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr --r
;;;             { 6 Expr * r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;               } 7 Expression (variable name)
;;;             } 6 Expr * r
;--	+ (member)
;--	move_rr_to_ll
	MOVE	RR, LL
;--	content
	MOVE	(RR), RR
;--	--
	SUB	RR, #0x0001
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;           } 5 Expr --r
;--	l < r
	SLT	RR, #0x0000
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L3_endif_2
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_semaphore' (800000)
;;;                     name = _semaphore
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = waiting_for
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;                 } 8 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x000E
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = next_waiting_task
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l | r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = status
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l | r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l | r
	OR	RR, #0x0001
;;;                 } 8 Expr l | r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l | r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr * r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;                 } 8 Expression (variable name)
;;;               } 7 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	branch_false
	JMP	RRZ, L3_else_3
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_task' (800000)
;;;                       name = _task
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = next_waiting_task
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 Expr * r
;;;                     { 10 Expr * r
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;                       } 11 Expression (variable name)
;;;                     } 10 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RR
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L3_endif_3
L3_else_3:
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_task' (800000)
;;;                       name = _task
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = next_waiting
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
L3_endif_3:
;;;             } 6 IfElseStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = last_waiting
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                 } 8 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = switch_tasks
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;--	push 0 bytes
;--	call
	CALL	Cswitch_tasks
;--	pop 0 bytes
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L3_endif_2:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
	RETI
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
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
;;;       spec = char (20000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = P_timed
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = P_timed
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_semaphore' (800000)
;;;               name = _semaphore
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = sema
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
;;;                 name = ticks
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
CP_timed:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = ret
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr --r
;;;             { 6 Expr * r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;               } 7 Expression (variable name)
;;;             } 6 Expr * r
;--	+ (member)
;--	move_rr_to_ll
	MOVE	RR, LL
;--	content
	MOVE	(RR), RR
;--	--
	SUB	RR, #0x0001
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;           } 5 Expr --r
;--	l < r
	SLT	RR, #0x0000
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L4_endif_4
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_semaphore' (800000)
;;;                     name = _semaphore
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = waiting_for
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                 } 8 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x000E
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
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
;;;                       name = sleep_count
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (ticks)
;--	load_rr_var ticks = 4(FP), SP at -1 (16 bit)
	MOVE	5(SP), RR
;;;                 } 8 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0012
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = next_waiting_task
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l | r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = status
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l | r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l | r
	OR	RR, #0x0003
;;;                 } 8 Expr l | r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l | r
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
;;;                       name = sema_ret
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x000C
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr * r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;                 } 8 Expression (variable name)
;;;               } 7 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	branch_false
	JMP	RRZ, L4_else_5
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_task' (800000)
;;;                       name = _task
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = next_waiting_task
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 Expr * r
;;;                     { 10 Expr * r
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -3 (16 bit)
	MOVE	5(SP), RR
;;;                       } 11 Expression (variable name)
;;;                     } 10 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RR
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L4_endif_5
L4_else_5:
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_task' (800000)
;;;                       name = _task
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = next_waiting
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -3 (16 bit)
	MOVE	5(SP), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
L4_endif_5:
;;;             } 6 IfElseStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = switch_tasks
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;--	push 0 bytes
;--	call
	CALL	Cswitch_tasks
;--	pop 0 bytes
;;;               } 7 Expr l(r)
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
;;;                       name = ret
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x000C
;--	content
	MOVE	(RR), RS
;--	store_rr_var ret = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L4_endif_4:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
	EI
;;;       } 3 ExpressionStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (ret)
;--	load_rr_var ret = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L4_return
;;;       } 3 return Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L4_return:
;--	pop 1 bytes
	ADD	SP, #1
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
;;;         name = Vint
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = Vint
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_semaphore' (800000)
;;;               name = _semaphore
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
CVint:
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
;;;         name = next
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr * r
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;         } 4 Expression (variable name)
;;;       } 3 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr ++r
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	+ (member)
;--	move_rr_to_ll
	MOVE	RR, LL
;--	content
	MOVE	(RR), RR
;--	++
	ADD	RR, #0x0001
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;         } 4 Expr ++r
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L5_endif_6
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l & r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = status
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l & r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0xFFFC
;;;                 } 8 Expr l & r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -3 (16 bit)
	MOVE	1(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;               } 7 Expr l & r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = next_waiting
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -4 (16 bit)
	MOVE	6(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr ! r
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	16 bit ! r
	LNOT	RR
;;;               } 7 Expr ! r
;--	branch_false
	JMP	RRZ, L5_endif_7
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_task' (800000)
;;;                       name = _task
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = last_waiting
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                   } 9 NumericExpression (constant 0 = 0x0)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at -4 (16 bit)
	MOVE	6(SP), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
L5_endif_7:
;;;             } 6 IfElseStatement
;;;             { 6 return Statement
;;;               { 7 Expr l > r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (next)
;--	load_rr_var next = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0005
;--	content
	MOVE	(RR), RU
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0005
;--	content
	MOVE	(RR), RU
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	l > r
	SHI	LL, RR
;;;               } 7 Expr l > r
;--	branch
	JMP	L5_return
;;;             } 6 return Statement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L5_endif_6:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;         } 4 NumericExpression (constant 0 = 0x0)
;--	branch
	JMP	L5_return
;;;       } 3 return Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L5_return:
;--	pop 2 bytes
	ADD	SP, #2
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
;;;         name = V
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = V
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_semaphore' (800000)
;;;               name = _semaphore
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
CV:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = char (20000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = Vint
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = sema
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (sema)
;--	load_rr_var sema = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;           } 5 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 1 bytes
;--	call
	CALL	CVint
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;--	branch_false
	JMP	RRZ, L6_endif_8
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = switch_tasks
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;--	push 0 bytes
;--	call
	CALL	Cswitch_tasks
;--	pop 0 bytes
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L6_endif_8:
;;;       } 3 IfElseStatement
;;;       { 3 ExpressionStatement
	RETI
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L6_return:
;--	pop 0 bytes
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
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
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cserial_in_overflows:			; 
	.WORD	0
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = char (20000)
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
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	l < r
	SLT	RR, #0x0010
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L7_else_9
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
;;;             { 6 IfElseStatement
;;;               { 7 Expr l >= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (serial_in_put)
;--	load_rr_var serial_in_put, (8 bit)
	MOVE	(Cserial_in_put), RU
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_put
	MOVE	R, (Cserial_in_put)
;;;                 } 8 Expr ++r
;--	l >= r
	SHS	RR, #0x0010
;;;               } 7 Expr l >= r
;--	branch_false
	JMP	RRZ, L7_endif_10
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned char (22000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = serial_in_put
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                   } 9 NumericExpression (constant 0 = 0x0)
;--	store_rr_var serial_in_put
	MOVE	R, (Cserial_in_put)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
L7_endif_10:
;;;             } 6 IfElseStatement
;;;             { 6 return Statement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = Vint
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 1 bytes
;--	call
	CALL	CVint
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;--	branch
	JMP	L7_return
;;;             } 6 return Statement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
;--	branch
	JMP	L7_endif_9
L7_else_9:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (serial_in_overflows)
;--	load_rr_var serial_in_overflows, (16 bit)
	MOVE	(Cserial_in_overflows), RR
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_overflows
	MOVE	RR, (Cserial_in_overflows)
;;;               } 7 Expr ++r
;;;             } 6 ExpressionStatement
;;;             { 6 return Statement
;;;               { 7 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;               } 7 NumericExpression (constant 0 = 0x0)
;--	branch
	JMP	L7_return
;;;             } 6 return Statement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L7_endif_9:
;;;       } 3 IfElseStatement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L7_return:
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
;;; { 0 FunctionDefinition
;;;   { 1 TypeName
;;;     { 2 TypeSpecifier (all)
;;;       spec = char (20000)
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
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;--	load_address tx_sema
	MOVE	#Ctx_sema, RR
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	l < r
	SLT	RR, #0x0010
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L8_else_11
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
;;;             { 6 IfElseStatement
;;;               { 7 Expr l >= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (serial_out_get)
;--	load_rr_var serial_out_get, (8 bit)
	MOVE	(Cserial_out_get), RU
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_out_get
	MOVE	R, (Cserial_out_get)
;;;                 } 8 Expr ++r
;--	l >= r
	SHS	RR, #0x0010
;;;               } 7 Expr l >= r
;--	branch_false
	JMP	RRZ, L8_endif_12
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = unsigned char (22000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = serial_out_get
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                   } 9 NumericExpression (constant 0 = 0x0)
;--	store_rr_var serial_out_get
	MOVE	R, (Cserial_out_get)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
L8_endif_12:
;;;             } 6 IfElseStatement
;;;             { 6 return Statement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = char (20000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = Vint
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address tx_sema
	MOVE	#Ctx_sema, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 1 bytes
;--	call
	CALL	CVint
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;--	branch
	JMP	L8_return
;;;             } 6 return Statement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
;--	branch
	JMP	L8_endif_11
L8_else_11:
;;;         { 4 CompoundStatement
;;;           { 5 List<ExpressionStatement>
;;;             { 6 ExpressionStatement
	MOVE #0x05, RR
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
	OUT  R, (OUT_INT_MASK)
;;;             } 6 ExpressionStatement
;;;             { 6 return Statement
;;;               { 7 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;               } 7 NumericExpression (constant 0 = 0x0)
;--	branch
	JMP	L8_return
;;;             } 6 return Statement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L8_endif_11:
;;;       } 3 IfElseStatement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L8_return:
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
;;;         name = t
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expression (variable name)
;;;         expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;       } 3 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
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
;;;         name = s
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
;;;         name = ts
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
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
	JMP	RRZ, L9_endif_13
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
	JMP	RRZ, L9_endif_14
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
	JMP	RRZ, L9_endif_15
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
L9_endif_15:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<IfElseStatement>
;;;               } 7 CompoundStatement
L9_endif_14:
;;;             } 6 IfElseStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L9_endif_13:
;;;       } 3 IfElseStatement
;;;       { 3 do while Statement
L9_loop_16:
;;;         { 4 CompoundStatement
;;;           { 5 List<IfElseStatement>
;;;             { 6 IfElseStatement
;;;               { 7 Expr l && r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 IfElseStatement
;;;                   { 9 Expr ! r
;;;                     { 10 Expr --r
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0012
;--	move_rr_to_ll
	MOVE	RR, LL
;--	content
	MOVE	(RR), RR
;--	--
	SUB	RR, #0x0001
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                     } 10 Expr --r
;--	16 bit ! r
	LNOT	RR
;;;                   } 9 Expr ! r
;--	branch_false
	JMP	RRZ, L9_endif_19
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l & r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0x0002
;;;                     } 10 Expr l & r
;;;                   } 9 ExpressionStatement
L9_endif_19:
;;;                 } 8 IfElseStatement
;;;               } 7 Expr l && r
;--	branch_false
	JMP	RRZ, L9_endif_18
;;;               { 7 CompoundStatement
;;;                 { 8 List<ExpressionStatement>
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l & r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = char (20000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = status
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l & r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expr * r
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                           } 13 Expression (variable name)
;;;                         } 12 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0xFFFD
;;;                       } 11 Expr l & r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -7 (16 bit)
	MOVE	5(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;                     } 10 Expr l & r
;;;                   } 9 ExpressionStatement
;;;                   { 9 IfElseStatement
;;;                     { 10 Expr l & r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0x0001
;;;                     } 10 Expr l & r
;--	branch_false
	JMP	RRZ, L9_endif_20
;;;                     { 10 CompoundStatement
;;;                       { 11 List<ExpressionStatement>
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l & r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = status
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr l & r
;;;                               { 15 TypeName (internal)
;;;                                 { 16 TypeSpecifier (all)
;;;                                   spec = int (80000)
;;;                                 } 16 TypeSpecifier (all)
;;;                               } 15 TypeName (internal)
;;;                               { 15 Expr * r
;;;                                 { 16 Expression (variable name)
;;;                                   expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                                 } 16 Expression (variable name)
;;;                               } 15 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0xFFFE
;;;                             } 14 Expr l & r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                             { 14 Expr * r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -7 (16 bit)
	MOVE	5(SP), RR
;;;                               } 15 Expression (variable name)
;;;                             } 14 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;                           } 13 Expr l & r
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l = r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = char (20000)
;;;                               } 15 TypeSpecifier (all)
;;;                               { 15 List<DeclItem>
;;;                                 { 16 DeclItem
;;;                                   what = DECL_NAME
;;;                                   name = sema_ret
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0xFFFF, RR
;;;                             } 14 NumericExpression (constant 1 = 0x1)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;                             { 14 Expr * r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -7 (16 bit)
	MOVE	5(SP), RR
;;;                               } 15 Expression (variable name)
;;;                             } 14 Expr * r
;--	+ (member)
	ADD	RR, #0x000C
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;                           } 13 Expr l = r
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l = r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (struct/union)
;;;                                 spec = struct '_semaphore' (800000)
;;;                                 name = _semaphore
;;;                               } 15 TypeSpecifier (struct/union)
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
;;;                                   name = s
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr * r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                               } 15 Expression (variable name)
;;;                             } 14 Expr * r
;--	+ (member)
	ADD	RR, #0x000E
;--	content
	MOVE	(RR), RR
;--	store_rr_var s = -4(FP), SP at -6
	MOVE	RR, 2(SP)
;;;                           } 13 Expr l = r
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr ++r
;;;                             { 14 Expr * r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -6 (16 bit)
	MOVE	2(SP), RR
;;;                               } 15 Expression (variable name)
;;;                             } 14 Expr * r
;--	+ (member)
;--	move_rr_to_ll
	MOVE	RR, LL
;--	content
	MOVE	(RR), RR
;--	++
	ADD	RR, #0x0001
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                           } 13 Expr ++r
;;;                         } 12 ExpressionStatement
;;;                         { 12 ExpressionStatement
;;;                           { 13 Expr l = r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (struct/union)
;;;                                 spec = struct '_task' (800000)
;;;                                 name = _task
;;;                               } 15 TypeSpecifier (struct/union)
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
;;;                                   name = ts
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expr * r
;;;                               { 15 Expression (variable name)
;;;                                 expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -6 (16 bit)
	MOVE	2(SP), RR
;;;                               } 15 Expression (variable name)
;;;                             } 14 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	store_rr_var ts = -6(FP), SP at -6
	MOVE	RR, 0(SP)
;;;                           } 13 Expr l = r
;;;                         } 12 ExpressionStatement
;;;                         { 12 IfElseStatement
;;;                           { 13 Expr l == r
;;;                             { 14 TypeName
;;;                               { 15 TypeSpecifier (struct/union)
;;;                                 spec = struct '_task' (800000)
;;;                                 name = _task
;;;                               } 15 TypeSpecifier (struct/union)
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
;;;                                   name = t
;;;                                 } 16 DeclItem
;;;                               } 15 List<DeclItem>
;;;                             } 14 TypeName
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                             } 14 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (ts)
;--	load_rr_var ts = -6(FP), SP at -6 (16 bit)
	MOVE	0(SP), RR
;;;                             } 14 Expression (variable name)
;--	l == r
	SEQ	LL, RR
;;;                           } 13 Expr l == r
;--	branch_false
	JMP	RRZ, L9_else_21
;;;                           { 13 CompoundStatement
;;;                             { 14 List<IfElseStatement>
;;;                               { 15 IfElseStatement
;;;                                 { 16 Expr l == r
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (struct/union)
;;;                                       spec = struct '_task' (800000)
;;;                                       name = _task
;;;                                     } 18 TypeSpecifier (struct/union)
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
;;;                                         name = t
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -6 (16 bit)
	MOVE	2(SP), RR
;;;                                     } 18 Expression (variable name)
;;;                                   } 17 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RR
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (t)
;--	load_ll_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), LL
;;;                                   } 17 Expression (variable name)
;--	l == r
	SEQ	LL, RR
;;;                                 } 16 Expr l == r
;--	branch_false
	JMP	RRZ, L9_else_22
;;;                                 { 16 CompoundStatement
;;;                                   { 17 List<ExpressionStatement>
;;;                                     { 18 ExpressionStatement
;;;                                       { 19 Expr l = r
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (struct/union)
;;;                                             spec = struct '_task' (800000)
;;;                                             name = _task
;;;                                           } 21 TypeSpecifier (struct/union)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_POINTER
;;;                                               { 23 List<Ptr>
;;;                                                 { 24 Ptr
;;;                                                 } 24 Ptr
;;;                                               } 23 List<Ptr>
;;;                                             } 22 DeclItem
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = next_waiting
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                         { 20 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                                         } 20 NumericExpression (constant 0 = 0x0)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr * r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -8 (16 bit)
	MOVE	4(SP), RR
;;;                                           } 21 Expression (variable name)
;;;                                         } 20 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                                       } 19 Expr l = r
;;;                                     } 18 ExpressionStatement
;;;                                     { 18 ExpressionStatement
;;;                                       { 19 Expr l = r
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (struct/union)
;;;                                             spec = struct '_task' (800000)
;;;                                             name = _task
;;;                                           } 21 TypeSpecifier (struct/union)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_POINTER
;;;                                               { 23 List<Ptr>
;;;                                                 { 24 Ptr
;;;                                                 } 24 Ptr
;;;                                               } 23 List<Ptr>
;;;                                             } 22 DeclItem
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = last_waiting
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                         { 20 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                                         } 20 NumericExpression (constant 0 = 0x0)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr * r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -8 (16 bit)
	MOVE	4(SP), RR
;;;                                           } 21 Expression (variable name)
;;;                                         } 20 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                                       } 19 Expr l = r
;;;                                     } 18 ExpressionStatement
;;;                                   } 17 List<ExpressionStatement>
;;;                                 } 16 CompoundStatement
;--	branch
	JMP	L9_endif_22
L9_else_22:
;;;                                 { 16 CompoundStatement
;;;                                   { 17 List<ExpressionStatement>
;;;                                     { 18 ExpressionStatement
;;;                                       { 19 Expr l = r
;;;                                         { 20 TypeName
;;;                                           { 21 TypeSpecifier (struct/union)
;;;                                             spec = struct '_task' (800000)
;;;                                             name = _task
;;;                                           } 21 TypeSpecifier (struct/union)
;;;                                           { 21 List<DeclItem>
;;;                                             { 22 DeclItem
;;;                                               what = DECL_POINTER
;;;                                               { 23 List<Ptr>
;;;                                                 { 24 Ptr
;;;                                                 } 24 Ptr
;;;                                               } 23 List<Ptr>
;;;                                             } 22 DeclItem
;;;                                             { 22 DeclItem
;;;                                               what = DECL_NAME
;;;                                               name = next_waiting
;;;                                             } 22 DeclItem
;;;                                           } 21 List<DeclItem>
;;;                                         } 20 TypeName
;;;                                         { 20 Expr * r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                                           } 21 Expression (variable name)
;;;                                         } 20 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                         { 20 Expr * r
;;;                                           { 21 Expression (variable name)
;;;                                             expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -8 (16 bit)
	MOVE	4(SP), RR
;;;                                           } 21 Expression (variable name)
;;;                                         } 20 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                                       } 19 Expr l = r
;;;                                     } 18 ExpressionStatement
;;;                                   } 17 List<ExpressionStatement>
;;;                                 } 16 CompoundStatement
L9_endif_22:
;;;                               } 15 IfElseStatement
;;;                             } 14 List<IfElseStatement>
;;;                           } 13 CompoundStatement
;--	branch
	JMP	L9_endif_21
L9_else_21:
;;;                           { 13 CompoundStatement
;;;                             { 14 List<while Statement>
;;;                               { 15 while Statement
;--	branch
	JMP	L9_cont_23
L9_loop_23:
;;;                                 { 16 ExpressionStatement
;;;                                   { 17 Expr l = r
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (struct/union)
;;;                                         spec = struct '_task' (800000)
;;;                                         name = _task
;;;                                       } 19 TypeSpecifier (struct/union)
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
;;;                                           name = ts
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                     { 18 Expr * r
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (ts)
;--	load_rr_var ts = -6(FP), SP at -6 (16 bit)
	MOVE	0(SP), RR
;;;                                       } 19 Expression (variable name)
;;;                                     } 18 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;--	store_rr_var ts = -6(FP), SP at -6
	MOVE	RR, 0(SP)
;;;                                   } 17 Expr l = r
;;;                                 } 16 ExpressionStatement
L9_cont_23:
;;;                                 { 16 Expr l != r
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (struct/union)
;;;                                       spec = struct '_task' (800000)
;;;                                       name = _task
;;;                                     } 18 TypeSpecifier (struct/union)
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
;;;                                         name = t
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (ts)
;--	load_rr_var ts = -6(FP), SP at -6 (16 bit)
	MOVE	0(SP), RR
;;;                                     } 18 Expression (variable name)
;;;                                   } 17 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (t)
;--	load_ll_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), LL
;;;                                   } 17 Expression (variable name)
;--	l != r
	SNE	LL, RR
;;;                                 } 16 Expr l != r
;--	branch_true
	JMP	RRNZ, L9_loop_23
L9_brk_24:
;;;                               } 15 while Statement
;;;                               { 15 ExpressionStatement
;;;                                 { 16 Expr l = r
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (struct/union)
;;;                                       spec = struct '_task' (800000)
;;;                                       name = _task
;;;                                     } 18 TypeSpecifier (struct/union)
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
;;;                                         name = next_waiting_task
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                                     } 18 Expression (variable name)
;;;                                   } 17 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (ts)
;--	load_rr_var ts = -6(FP), SP at -8 (16 bit)
	MOVE	2(SP), RR
;;;                                     } 18 Expression (variable name)
;;;                                   } 17 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                                 } 16 Expr l = r
;;;                               } 15 ExpressionStatement
;;;                               { 15 IfElseStatement
;;;                                 { 16 Expr l == r
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (struct/union)
;;;                                       spec = struct '_task' (800000)
;;;                                       name = _task
;;;                                     } 18 TypeSpecifier (struct/union)
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
;;;                                         name = t
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                   { 17 Expr * r
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -6 (16 bit)
	MOVE	2(SP), RR
;;;                                     } 18 Expression (variable name)
;;;                                   } 17 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RR
;;;                                   { 17 Expression (variable name)
;;;                                     expr_type = "identifier" (t)
;--	load_ll_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), LL
;;;                                   } 17 Expression (variable name)
;--	l == r
	SEQ	LL, RR
;;;                                 } 16 Expr l == r
;--	branch_false
	JMP	RRZ, L9_endif_25
;;;                                 { 16 ExpressionStatement
;;;                                   { 17 Expr l = r
;;;                                     { 18 TypeName
;;;                                       { 19 TypeSpecifier (struct/union)
;;;                                         spec = struct '_task' (800000)
;;;                                         name = _task
;;;                                       } 19 TypeSpecifier (struct/union)
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
;;;                                           name = last_waiting
;;;                                         } 20 DeclItem
;;;                                       } 19 List<DeclItem>
;;;                                     } 18 TypeName
;;;                                     { 18 Expression (variable name)
;;;                                       expr_type = "identifier" (ts)
;--	load_rr_var ts = -6(FP), SP at -6 (16 bit)
	MOVE	0(SP), RR
;;;                                     } 18 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                                     { 18 Expr * r
;;;                                       { 19 Expression (variable name)
;;;                                         expr_type = "identifier" (s)
;--	load_rr_var s = -4(FP), SP at -8 (16 bit)
	MOVE	4(SP), RR
;;;                                       } 19 Expression (variable name)
;;;                                     } 18 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
;;;                                   } 17 Expr l = r
;;;                                 } 16 ExpressionStatement
L9_endif_25:
;;;                               } 15 IfElseStatement
;;;                             } 14 List<while Statement>
;;;                           } 13 CompoundStatement
L9_endif_21:
;;;                         } 12 IfElseStatement
;;;                       } 11 List<ExpressionStatement>
;;;                     } 10 CompoundStatement
L9_endif_20:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L9_endif_18:
;;;             } 6 IfElseStatement
;;;           } 5 List<IfElseStatement>
;;;         } 4 CompoundStatement
L9_cont_16:
;;;         { 4 Expr l != r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_task' (800000)
;;;               name = _task
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = current_task
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_task' (800000)
;;;                 name = _task
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = t
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr * r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;               } 7 Expression (variable name)
;;;             } 6 Expr * r
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	store_rr_var t = -2(FP), SP at -6
	MOVE	RR, 4(SP)
;;;           } 5 Expr l = r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (current_task)
;--	load_ll_var current_task, (16 bit)
	MOVE	(Ccurrent_task), LL
;;;           } 5 Expression (variable name)
;--	l != r
	SNE	LL, RR
;;;         } 4 Expr l != r
;--	branch_true
	JMP	RRNZ, L9_loop_16
L9_brk_17:
;;;       } 3 do while Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L9_return:
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
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = ts_1
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = ts_2
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
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
	JMP	RRZ, L10_endif_26
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = ts_1
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
;;;                     name = rx_interrupt
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;--	push 1 bytes
;--	call
	CALL	Crx_interrupt
;--	pop 0 bytes
;;;             } 6 Expr l(r)
;--	store_rr_var ts_1 = -1(FP), SP at -6
	MOVE	R, 5(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L10_endif_26:
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
	JMP	RRZ, L10_endif_27
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = ts_2
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
;;;                     name = tx_interrupt
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;--	push 1 bytes
;--	call
	CALL	Ctx_interrupt
;--	pop 0 bytes
;;;             } 6 Expr l(r)
;--	store_rr_var ts_2 = -2(FP), SP at -6
	MOVE	R, 4(SP)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L10_endif_27:
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
	JMP	RRZ, L10_endif_28
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
;;;                       name = timer_interrupt
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;--	push 0 bytes
;--	call
	CALL	Ctimer_interrupt
;--	pop 0 bytes
;;;               } 7 Expr l(r)
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
;;;                       name = ts_1
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0xFFFF, RR
;;;                 } 8 NumericExpression (constant 1 = 0x1)
;--	store_rr_var ts_1 = -1(FP), SP at -6
	MOVE	R, 5(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L10_endif_28:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l | r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (ts_1)
;--	load_rr_var ts_1 = -1(FP), SP at -6 (8 bit)
	MOVE	5(SP), RS
;;;           } 5 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (ts_2)
;--	load_rr_var ts_2 = -2(FP), SP at -6 (8 bit)
	MOVE	4(SP), RS
;;;           } 5 Expression (variable name)
;--	l | r
	OR	LL, RR
;;;         } 4 Expr l | r
;--	branch_false
	JMP	RRZ, L10_endif_29
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = switch_tasks
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;--	push 0 bytes
;--	call
	CALL	Cswitch_tasks
;--	pop 0 bytes
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L10_endif_29:
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
	ADD  SP, #2
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	RETI
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L10_return:
;--	pop 2 bytes
	ADD	SP, #2
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
;;;         name = sleep
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = sleep
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
;;;                 name = millisecs
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Csleep:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l = r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = sleep_count
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (millisecs)
;--	load_rr_var millisecs = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;           } 5 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	+ (member)
	ADD	RR, #0x0012
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	assign (16 bit)
	MOVE	RR, (LL)
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
;;;                 name = status
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 NumericExpression (constant 2 = 0x2)
;--	load_rr_constant
	MOVE	#0x0002, RR
;;;           } 5 NumericExpression (constant 2 = 0x2)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = switch_tasks
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cswitch_tasks
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	RETI
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L11_return:
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
;;;         name = deschedule
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = deschedule
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cdeschedule:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = switch_tasks
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cswitch_tasks
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	RETI
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L12_return:
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
	JMP	L13_cont_30
L13_loop_30:
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
L13_cont_30:
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
	JMP	RRNZ, L13_loop_30
L13_brk_31:
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
	JMP	L13_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L13_return:
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
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = P
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = sema
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address tx_sema
	MOVE	#Ctx_sema, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
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
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr ++r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (serial_out_put)
;--	load_rr_var serial_out_put, (8 bit)
	MOVE	(Cserial_out_put), RU
;;;             } 6 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_out_put
	MOVE	R, (Cserial_out_put)
;;;           } 5 Expr ++r
;--	l >= r
	SHS	RR, #0x0010
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L14_endif_32
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned char (22000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = serial_out_put
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;             } 6 NumericExpression (constant 0 = 0x0)
;--	store_rr_var serial_out_put
	MOVE	R, (Cserial_out_put)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L14_endif_32:
;;;       } 3 IfElseStatement
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
;;;     } 2 List<ExpressionStatement>
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
;;;       spec = void (10000)
;;;     } 2 TypeSpecifier (all)
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = print_n
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = print_n
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
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = count
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cprint_n:
;;;   { 1 CompoundStatement
;;;     { 2 List<for Statement>
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
;--	branch
	JMP	L15_tst_33
L15_loop_33:
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
;;;               expr_type = "identifier" (c)
;--	load_rr_var c = 2(FP), SP at 0 (8 bit)
	MOVE	2(SP), RS
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
L15_cont_33:
;;;         { 4 Expr --r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (count)
;--	load_rr_var count = 3(FP), SP at 0 (16 bit)
	MOVE	3(SP), RR
;;;           } 5 Expression (variable name)
;--	--
	SUB	RR, #0x0001
;--	store_rr_var count = 3(FP), SP at 0
	MOVE	RR, 3(SP)
;;;         } 4 Expr --r
L15_tst_33:
;;;         { 4 Expr l > r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (count)
;--	load_rr_var count = 3(FP), SP at 0 (16 bit)
	MOVE	3(SP), RR
;;;           } 5 Expression (variable name)
;--	l > r
	SGT	RR, #0x0000
;;;         } 4 Expr l > r
;--	branch_true
	JMP	RRNZ, L15_loop_33
L15_brk_34:
;;;       } 3 for Statement
;;;     } 2 List<for Statement>
;;;   } 1 CompoundStatement
;--	ret
L15_return:
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
	JMP	L16_cont_35
L16_loop_35:
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
L16_cont_35:
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
	JMP	RRNZ, L16_loop_35
L16_brk_36:
;;;       } 3 while Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L16_return:
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
	JMP	RRZ, L17_endif_37
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
L17_endif_37:
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
	JMP	RRZ, L17_endif_38
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
L17_endif_38:
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
	JMP	RRZ, L17_endif_39
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
L17_endif_39:
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
L17_return:
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
	JMP	RRZ, L18_endif_40
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
;;;             { 6 Expr l + r
;;;               { 7 Expr l / r
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
;--	l / r
	MOVE	RR, LL
	MOVE	#0x2710, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;               } 7 Expr l / r
;--	l + r
	ADD	RR, #0x0030
;;;             } 6 Expr l + r
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
L18_endif_40:
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
	JMP	RRZ, L18_endif_41
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
;;;             { 6 Expr l + r
;;;               { 7 Expr l % r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr l / r
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
;--	l / r
	MOVE	RR, LL
	MOVE	#0x03E8, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                 } 8 Expr l / r
;--	l % r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;               } 7 Expr l % r
;--	l + r
	ADD	RR, #0x0030
;;;             } 6 Expr l + r
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
L18_endif_41:
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
	JMP	RRZ, L18_endif_42
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
;;;             { 6 Expr l + r
;;;               { 7 Expr l % r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr l / r
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
;--	l / r
	MOVE	RR, LL
	MOVE	#0x0064, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                 } 8 Expr l / r
;--	l % r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;               } 7 Expr l % r
;--	l + r
	ADD	RR, #0x0030
;;;             } 6 Expr l + r
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
L18_endif_42:
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
	JMP	RRZ, L18_endif_43
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
;;;             { 6 Expr l + r
;;;               { 7 Expr l % r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr l / r
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
;--	l / r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l / r
	DI
	DIV_IU
	CALL	mult_div
	MD_FIN
	EI
;;;                 } 8 Expr l / r
;--	l % r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;               } 7 Expr l % r
;--	l + r
	ADD	RR, #0x0030
;;;             } 6 Expr l + r
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
L18_endif_43:
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
;;;             { 6 Expr l % r
;;;               { 7 TypeName (internal)
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = unsigned int (82000)
;;;                 } 8 TypeSpecifier (all)
;;;               } 7 TypeName (internal)
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (value)
;--	load_rr_var value = 4(FP), SP at 0 (16 bit)
	MOVE	4(SP), RR
;;;               } 7 Expression (variable name)
;--	l % r
	MOVE	RR, LL
	MOVE	#0x000A, RR
;--	l % r
	DI
	DIV_IU
	CALL	mult_div
	MOD_FIN
	EI
;;;             } 6 Expr l % r
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
L18_return:
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
	JMP	RRZ, L19_endif_44
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
L19_endif_44:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (sign)
;--	load_rr_var sign = 5(FP), SP at -14 (8 bit)
	MOVE	19(SP), RS
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L19_endif_45
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
L19_endif_45:
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
	JMP	RRZ, L19_endif_47
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
L19_endif_47:
;;;           } 5 IfElseStatement
;;;         } 4 Expr l && r
;--	branch_false
	JMP	RRZ, L19_endif_46
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
L19_endif_46:
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
	JMP	RRZ, L19_endif_48
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = print_n
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr (l , r)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = count
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expr l - r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (field_w)
;--	load_rr_var field_w = 9(FP), SP at -14 (16 bit)
	MOVE	23(SP), RR
;;;                 } 8 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (len)
;--	load_rr_var len = -12(FP), SP at -14 (16 bit)
	MOVE	2(SP), RR
;;;                 } 8 Expression (variable name)
;--	scale_rr *1
;--	l - r
	SUB	LL, RR
;--	scale *1
;;;               } 7 Expr l - r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
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
;;;               } 7 ParameterDeclaration
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (pad)
;--	load_rr_var pad = 6(FP), SP at -16 (8 bit)
	MOVE	22(SP), RS
;;;               } 7 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             } 6 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_n
;--	pop 3 bytes
	ADD	SP, #3
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L19_endif_48:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (sign)
;--	load_rr_var sign = 5(FP), SP at -14 (8 bit)
	MOVE	19(SP), RS
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L19_endif_49
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
L19_endif_49:
;;;       } 3 IfElseStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (alt)
;--	load_rr_var alt = 7(FP), SP at -14 (16 bit)
	MOVE	21(SP), RR
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L19_endif_50
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
	JMP	RRZ, L19_endif_51
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
L19_endif_51:
;;;             } 6 IfElseStatement
;;;           } 5 List<IfElseStatement>
;;;         } 4 CompoundStatement
L19_endif_50:
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
	JMP	L19_tst_52
L19_loop_52:
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
L19_cont_52:
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
L19_tst_52:
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
	JMP	RRNZ, L19_loop_52
L19_brk_53:
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
	JMP	RRZ, L19_endif_54
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = void (10000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = print_n
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr (l , r)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = count
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expr l - r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (field_w)
;--	load_rr_var field_w = 9(FP), SP at -14 (16 bit)
	MOVE	23(SP), RR
;;;                 } 8 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (len)
;--	load_rr_var len = -12(FP), SP at -14 (16 bit)
	MOVE	2(SP), RR
;;;                 } 8 Expression (variable name)
;--	scale_rr *1
;--	l - r
	SUB	LL, RR
;--	scale *1
;;;               } 7 Expr l - r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
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
;;;               } 7 ParameterDeclaration
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (pad)
;--	load_rr_var pad = 6(FP), SP at -16 (8 bit)
	MOVE	22(SP), RS
;;;               } 7 Expression (variable name)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             } 6 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_n
;--	pop 3 bytes
	ADD	SP, #3
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L19_endif_54:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (len)
;--	load_rr_var len = -12(FP), SP at -14 (16 bit)
	MOVE	2(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L19_return
;;;       } 3 return Statement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L19_return:
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
	JMP	L20_cont_55
L20_loop_55:
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
	JMP	RRZ, L20_endif_57
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
	JMP	L20_cont_55
;;;                   } 9 break/continue Statement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L20_endif_57:
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
L20_loop_58:
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
	JMP	RRNZ, L20_case_60_0058
;--	branch_case (8 bit)
	SEQ	LL, #0x0064
	JMP	RRNZ, L20_case_60_0064
;--	branch_case (8 bit)
	SEQ	LL, #0x0073
	JMP	RRNZ, L20_case_60_0073
;--	branch_case (8 bit)
	SEQ	LL, #0x0075
	JMP	RRNZ, L20_case_60_0075
;--	branch_case (8 bit)
	SEQ	LL, #0x0078
	JMP	RRNZ, L20_case_60_0078
;--	branch_case (8 bit)
	SEQ	LL, #0x0063
	JMP	RRNZ, L20_case_60_0063
;--	branch_case (8 bit)
	SEQ	LL, #0x0023
	JMP	RRNZ, L20_case_60_0023
;--	branch_case (8 bit)
	SEQ	LL, #0x002D
	JMP	RRNZ, L20_case_60_002D
;--	branch_case (8 bit)
	SEQ	LL, #0x0020
	JMP	RRNZ, L20_case_60_0020
;--	branch_case (8 bit)
	SEQ	LL, #0x002B
	JMP	RRNZ, L20_case_60_002B
;--	branch_case (8 bit)
	SEQ	LL, #0x002E
	JMP	RRNZ, L20_case_60_002E
;--	branch_case (8 bit)
	SEQ	LL, #0x0030
	JMP	RRNZ, L20_case_60_0030
;--	branch_case (8 bit)
	SEQ	LL, #0x0031
	JMP	RRNZ, L20_case_60_0031
;--	branch_case (8 bit)
	SEQ	LL, #0x0032
	JMP	RRNZ, L20_case_60_0032
;--	branch_case (8 bit)
	SEQ	LL, #0x0033
	JMP	RRNZ, L20_case_60_0033
;--	branch_case (8 bit)
	SEQ	LL, #0x0034
	JMP	RRNZ, L20_case_60_0034
;--	branch_case (8 bit)
	SEQ	LL, #0x0035
	JMP	RRNZ, L20_case_60_0035
;--	branch_case (8 bit)
	SEQ	LL, #0x0036
	JMP	RRNZ, L20_case_60_0036
;--	branch_case (8 bit)
	SEQ	LL, #0x0037
	JMP	RRNZ, L20_case_60_0037
;--	branch_case (8 bit)
	SEQ	LL, #0x0038
	JMP	RRNZ, L20_case_60_0038
;--	branch_case (8 bit)
	SEQ	LL, #0x0039
	JMP	RRNZ, L20_case_60_0039
;--	branch_case (8 bit)
	SEQ	LL, #0x002A
	JMP	RRNZ, L20_case_60_002A
;--	branch_case (8 bit)
	SEQ	LL, #0x0000
	JMP	RRNZ, L20_case_60_0000
;--	branch
	JMP	L20_deflt_60
;;;                     { 10 CompoundStatement
;;;                       { 11 List<case Statement>
;;;                         { 12 case Statement
L20_case_60_0058:
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
	MOVE	#Cstr_36, RR
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
	MOVE	#Cstr_37, RR
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0064:
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
	JMP	RRZ, L20_endif_61
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
L20_endif_61:
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
	MOVE	#Cstr_38, RR
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0073:
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
	MOVE	#Cstr_39, RR
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0075:
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
	MOVE	#Cstr_40, RR
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0078:
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
	MOVE	#Cstr_41, RR
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
	MOVE	#Cstr_42, RR
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0063:
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0023:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_002D:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0020:
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
	JMP	RRZ, L20_endif_62
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
L20_endif_62:
;;;                           } 13 IfElseStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_002B:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_002E:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0030:
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
	JMP	RRZ, L20_else_63
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
	JMP	L20_endif_63
L20_else_63:
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
L20_endif_63:
;;;                           } 13 IfElseStatement
;;;                         } 12 case Statement
;;;                         { 12 break/continue Statement
;--	branch
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0031:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0032:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0033:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0034:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0035:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0036:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0037:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0038:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0039:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_002A:
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
	JMP	L20_cont_58
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_case_60_0000:
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                         { 12 case Statement
L20_deflt_60:
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
	JMP	L20_brk_60
;;;                         } 12 break/continue Statement
;;;                       } 11 List<case Statement>
;;;                     } 10 CompoundStatement
L20_brk_60:
;;;                   } 9 SwitchStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L20_brk_59
;;;                   } 9 break/continue Statement
;;;                 } 8 List<SwitchStatement>
;;;               } 7 CompoundStatement
L20_cont_58:
;--	branch
	JMP	L20_loop_58
L20_brk_59:
;;;             } 6 for Statement
;;;           } 5 List<IfElseStatement>
;;;         } 4 CompoundStatement
L20_cont_55:
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
	JMP	RRNZ, L20_loop_55
L20_brk_56:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (len)
;--	load_rr_var len = -4(FP), SP at -28 (16 bit)
	MOVE	24(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L20_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L20_return:
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
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = P
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = sema
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
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
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr ++r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (serial_in_get)
;--	load_rr_var serial_in_get, (8 bit)
	MOVE	(Cserial_in_get), RU
;;;             } 6 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_get
	MOVE	R, (Cserial_in_get)
;;;           } 5 Expr ++r
;--	l >= r
	SHS	RR, #0x0010
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L21_endif_64
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned char (22000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = serial_in_get
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;             } 6 NumericExpression (constant 0 = 0x0)
;--	store_rr_var serial_in_get
	MOVE	R, (Cserial_in_get)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L21_endif_64:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L21_return
;;;       } 3 return Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L21_return:
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
;;;         name = getchr_timed
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = getchr_timed
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = ticks
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cgetchr_timed:
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
;;;     { 2 List<ExpressionStatement>
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
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = P_timed
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr (l , r)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = unsigned int (82000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = ticks
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (ticks)
;--	load_rr_var ticks = 2(FP), SP at -1 (16 bit)
	MOVE	3(SP), RR
;;;               } 7 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;               { 7 ParameterDeclaration
;;;                 isEllipsis = false
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_semaphore' (800000)
;;;                     name = _semaphore
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = sema
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;               } 7 ParameterDeclaration
;;;               { 7 Expr & r
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;;;               } 7 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;             } 6 Expr (l , r)
;--	push 1 bytes
;--	call
	CALL	CP_timed
;--	pop 4 bytes
	ADD	SP, #4
;;;           } 5 Expr l(r)
;--	store_rr_var c = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;         } 4 Expr l = r
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L22_endif_65
;;;         { 4 return Statement
;;;           { 5 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0xFFFF, RR
;;;           } 5 NumericExpression (constant 1 = 0x1)
;--	branch
	JMP	L22_return
;;;         } 4 return Statement
L22_endif_65:
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
;;;       { 3 IfElseStatement
;;;         { 4 Expr l >= r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = unsigned int (82000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr ++r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (serial_in_get)
;--	load_rr_var serial_in_get, (8 bit)
	MOVE	(Cserial_in_get), RU
;;;             } 6 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var serial_in_get
	MOVE	R, (Cserial_in_get)
;;;           } 5 Expr ++r
;--	l >= r
	SHS	RR, #0x0010
;;;         } 4 Expr l >= r
;--	branch_false
	JMP	RRZ, L22_endif_66
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned char (22000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = serial_in_get
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;             } 6 NumericExpression (constant 0 = 0x0)
;--	store_rr_var serial_in_get
	MOVE	R, (Cserial_in_get)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L22_endif_66:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (c)
;--	load_rr_var c = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L22_return
;;;       } 3 return Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L22_return:
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
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = P
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = sema
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = V
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = sema
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
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
	JMP	L23_return
;;;       } 3 return Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L23_return:
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
	JMP	RRZ, L24_endif_68
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
L24_endif_68:
;;;           } 5 IfElseStatement
;;;         } 4 Expr l && r
;--	branch_false
	JMP	RRZ, L24_else_67
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
	JMP	L24_endif_67
L24_else_67:
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
	JMP	RRZ, L24_endif_70
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
L24_endif_70:
;;;             } 6 IfElseStatement
;;;           } 5 Expr l && r
;--	branch_false
	JMP	RRZ, L24_else_69
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
	JMP	L24_endif_69
L24_else_69:
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
	JMP	RRZ, L24_endif_72
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
L24_endif_72:
;;;               } 7 IfElseStatement
;;;             } 6 Expr l && r
;--	branch_false
	JMP	RRZ, L24_endif_71
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
L24_endif_71:
;;;           } 5 IfElseStatement
L24_endif_69:
;;;         } 4 IfElseStatement
L24_endif_67:
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
	JMP	RRZ, L24_endif_73
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
	JMP	RRZ, L24_endif_74
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
L24_endif_74:
;;;             } 6 IfElseStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L24_endif_73:
;;;       } 3 IfElseStatement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (ret)
;--	load_rr_var ret = -3(FP), SP at -3 (16 bit)
	MOVE	0(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L24_return
;;;       } 3 return Statement
;;;     } 2 List<IfElseStatement>
;;;   } 1 CompoundStatement
;--	ret
L24_return:
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
	JMP	L25_cont_75
L25_loop_75:
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
L25_cont_75:
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
	JMP	RRNZ, L25_loop_75
L25_brk_76:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (ret)
;--	load_rr_var ret = -2(FP), SP at -3 (16 bit)
	MOVE	1(SP), RR
;;;         } 4 Expression (variable name)
;--	branch
	JMP	L25_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L25_return:
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
;;;         name = init_stack
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = init_stack
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cinit_stack:
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
;;;         name = bottom
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr * r
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;         } 4 Expression (variable name)
;;;       } 3 Expr * r
;--	+ (member)
	ADD	RR, #0x0008
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L26_cont_77
L26_loop_77:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = bottom
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 83 = 0x53)
;--	load_rr_constant
	MOVE	#0x0053, RR
;;;             } 6 NumericExpression (constant 83 = 0x53)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (bottom)
;--	load_rr_var bottom = -2(FP), SP at -3 (16 bit)
	MOVE	1(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var bottom = -2(FP), SP at -3
	MOVE	RR, 1(SP)
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
L26_cont_77:
;;;         { 4 Expr l < r
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
;;;                 name = bottom
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expression (cast)r
	LEA 0(SP), RR
;;;           } 5 Expression (cast)r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (bottom)
;--	load_ll_var bottom = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), LL
;;;           } 5 Expression (variable name)
;--	l < r
	SLO	LL, RR
;;;         } 4 Expr l < r
;--	branch_true
	JMP	RRNZ, L26_loop_77
L26_brk_78:
;;;       } 3 while Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L26_return:
;--	pop 2 bytes
	ADD	SP, #2
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = extern char (20002)
;;;   } 1 TypeSpecifier (all)
	.EXTERN	Cend_text
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
;;;         name = init_unused
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = init_unused
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cinit_unused:
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
;;;         name = cp
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr * r
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;         } 4 Expression (variable name)
;;;       } 3 Expr * r
;--	+ (member)
	ADD	RR, #0x0008
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L27_cont_79
L27_loop_79:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = char (20000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = cp
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 NumericExpression (constant 32 = 0x20)
;--	load_rr_constant
	MOVE	#0x0020, RR
;;;             } 6 NumericExpression (constant 32 = 0x20)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             { 6 Expr * r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (cp)
;--	load_rr_var cp = -2(FP), SP at -3 (16 bit)
	MOVE	1(SP), RR
;;;               } 7 Expression (variable name)
;;;             } 6 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RS
;--	assign (8 bit)
	MOVE	R, (LL)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L27_cont_79:
;;;         { 4 Expr l >= r
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
;;;                 name = cp
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr --r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (cp)
;--	load_rr_var cp = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;             } 6 Expression (variable name)
;--	--
	SUB	RR, #0x0001
;--	store_rr_var cp = -2(FP), SP at -2
	MOVE	RR, 0(SP)
;;;           } 5 Expr --r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;           { 5 Expression (cast)r
;;;             { 6 Expr & r
;--	load_address end_text
	MOVE	#Cend_text, RR
;;;             } 6 Expr & r
;;;           } 5 Expression (cast)r
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	l >= r
	SHS	LL, RR
;;;         } 4 Expr l >= r
;--	branch_true
	JMP	RRNZ, L27_loop_79
L27_brk_80:
;;;       } 3 while Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L27_return:
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
;;;         name = stack_used
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = stack_used
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_task' (800000)
;;;               name = _task
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = t
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cstack_used:
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
;;;         name = bottom
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr * r
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (t)
;--	load_rr_var t = 2(FP), SP at 0 (16 bit)
	MOVE	2(SP), RR
;;;         } 4 Expression (variable name)
;;;       } 3 Expr * r
;--	+ (member)
	ADD	RR, #0x0008
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<while Statement>
;;;       { 3 while Statement
;--	branch
	JMP	L28_cont_81
L28_loop_81:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l - r
;;;             { 6 Expr ++r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (bottom)
;--	load_rr_var bottom = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;               } 7 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var bottom = -2(FP), SP at -2
	MOVE	RR, 0(SP)
;;;             } 6 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;           } 5 Expr l - r
;;;         } 4 ExpressionStatement
L28_cont_81:
;;;         { 4 Expr l == r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (bottom)
;--	load_rr_var bottom = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;             } 6 Expression (variable name)
;--	content
	MOVE	(RR), RS
;;;           } 5 Expr * r
;--	l == r
	SEQ	RR, #0x0053
;;;         } 4 Expr l == r
;--	branch_true
	JMP	RRNZ, L28_loop_81
L28_brk_82:
;;;       } 3 while Statement
;;;       { 3 return Statement
;;;         { 4 Expr l - r
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (t)
;--	load_rr_var t = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	+ (member)
	ADD	RR, #0x000A
;--	content
	MOVE	(RR), RR
;--	move_rr_to_ll
	MOVE	RR, LL
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (bottom)
;--	load_rr_var bottom = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;           } 5 Expression (variable name)
;--	scale_rr *1
;--	l - r
	SUB	LL, RR
;--	scale *1
;;;         } 4 Expr l - r
;--	branch
	JMP	L28_return
;;;       } 3 return Statement
;;;     } 2 List<while Statement>
;;;   } 1 CompoundStatement
;--	ret
L28_return:
;--	pop 2 bytes
	ADD	SP, #2
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
;;;         name = show_sema
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = show_sema
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;       { 3 List<ParameterDeclaration>
;;;         { 4 ParameterDeclaration
;;;           isEllipsis = false
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_semaphore' (800000)
;;;               name = _semaphore
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = s
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;         } 4 ParameterDeclaration
;;;       } 3 List<ParameterDeclaration>
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cshow_sema:
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
;;;         name = t
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
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
;;;             { 6 Expr * r
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (s)
;--	load_rr_var s = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;               } 7 Expression (variable name)
;;;             } 6 Expr * r
;--	+ (member)
;--	content
	MOVE	(RR), RR
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
;;;               { 7 Expr * r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (s)
;--	load_rr_var s = 2(FP), SP at -4 (16 bit)
	MOVE	6(SP), RR
;;;                 } 8 Expression (variable name)
;;;               } 7 Expr * r
;--	+ (member)
	ADD	RR, #0x0006
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;               { 7 StringExpression
;--	load_rr_string
	MOVE	#Cstr_44, RR
;;;               } 7 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;             } 6 Expr (l , r)
;;;           } 5 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 6 bytes
	ADD	SP, #6
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;;;           { 5 Expr * r
;;;             { 6 Expression (variable name)
;;;               expr_type = "identifier" (s)
;--	load_rr_var s = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;             } 6 Expression (variable name)
;;;           } 5 Expr * r
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	l < r
	SLT	RR, #0x0000
;;;         } 4 Expr l < r
;--	branch_false
	JMP	RRZ, L29_else_83
;;;         { 4 CompoundStatement
;;;           { 5 List<for Statement>
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_task' (800000)
;;;                       name = _task
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = t
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 Expr * r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (s)
;--	load_rr_var s = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;                     } 10 Expression (variable name)
;;;                   } 9 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	store_rr_var t = -2(FP), SP at -2
	MOVE	RR, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L29_tst_84
L29_loop_84:
;;;               { 7 CompoundStatement
;;;                 { 8 List<ExpressionStatement>
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
;;;                       { 11 Expr (l , r)
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
;;;                         { 12 Expr * r
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                           } 13 Expression (variable name)
;;;                         } 12 Expr * r
;--	+ (member)
	ADD	RR, #0x0006
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
	MOVE	#Cstr_45, RR
;;;                         } 12 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                       } 11 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 IfElseStatement
;;;                     { 10 Expr l == r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (struct/union)
;;;                           spec = struct '_task' (800000)
;;;                           name = _task
;;;                         } 12 TypeSpecifier (struct/union)
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
;;;                             name = t
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (s)
;--	load_rr_var s = 2(FP), SP at -2 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RR
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (t)
;--	load_ll_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), LL
;;;                       } 11 Expression (variable name)
;--	l == r
	SEQ	LL, RR
;;;                     } 10 Expr l == r
;--	branch_false
	JMP	RRZ, L29_endif_86
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
	MOVE	#Cstr_46, RR
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
L29_endif_86:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L29_cont_84:
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = t
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;--	store_rr_var t = -2(FP), SP at -2
	MOVE	RR, 0(SP)
;;;               } 7 Expr l = r
L29_tst_84:
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;               } 7 Expression (variable name)
;--	branch_true
	JMP	RRNZ, L29_loop_84
L29_brk_85:
;;;             } 6 for Statement
;;;           } 5 List<for Statement>
;;;         } 4 CompoundStatement
;--	branch
	JMP	L29_endif_83
L29_else_83:
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
	MOVE	#Cstr_47, RR
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
L29_endif_83:
;;;       } 3 IfElseStatement
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_48, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L29_return:
;--	pop 2 bytes
	ADD	SP, #2
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned char (22000)
;;;   } 1 TypeSpecifier (all)
Cloader:			; 
	.BYTE	46
	.BYTE	1
	.BYTE	17
	.BYTE	1
	.BYTE	61
	.BYTE	3
	.BYTE	50
	.BYTE	30
	.BYTE	46
	.BYTE	0
	.BYTE	7
	.BYTE	46
	.BYTE	1
	.BYTE	17
	.BYTE	2
	.BYTE	3
	.BYTE	61
	.BYTE	30
	.BYTE	101
	.BYTE	2
	.BYTE	47
	.BYTE	0
	.BYTE	7
	.BYTE	2
	.BYTE	89
	.BYTE	30
	.BYTE	97
	.BYTE	2
	.BYTE	161
	.BYTE	93
	.BYTE	2
	.BYTE	177
	.BYTE	71
	.BYTE	15
	.BYTE	5
	.BYTE	61
	.BYTE	30
	.BYTE	43
	.BYTE	1
	.BYTE	97
	.BYTE	2
	.BYTE	71
	.BYTE	3
	.BYTE	76
	.BYTE	30
	.BYTE	7
	.BYTE	5
	.BYTE	50
	.BYTE	30
	.BYTE	15
	.BYTE	101
	.BYTE	0
	.BYTE	41
	.BYTE	48
	.BYTE	4
	.BYTE	113
	.BYTE	30
	.BYTE	248
	.BYTE	255
	.BYTE	0
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	39
	.BYTE	57
	.BYTE	4
	.BYTE	127
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	247
	.BYTE	48
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	41
	.BYTE	65
	.BYTE	4
	.BYTE	140
	.BYTE	30
	.BYTE	248
	.BYTE	255
	.BYTE	0
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	39
	.BYTE	70
	.BYTE	4
	.BYTE	154
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	247
	.BYTE	55
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	41
	.BYTE	97
	.BYTE	4
	.BYTE	167
	.BYTE	30
	.BYTE	248
	.BYTE	255
	.BYTE	0
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	39
	.BYTE	102
	.BYTE	4
	.BYTE	181
	.BYTE	30
	.BYTE	101
	.BYTE	0
	.BYTE	247
	.BYTE	87
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	248
	.BYTE	255
	.BYTE	0
	.BYTE	2
	.BYTE	187
	.BYTE	30
	.BYTE	43
	.BYTE	1
	.BYTE	7
	.BYTE	5
	.BYTE	96
	.BYTE	30
	.BYTE	15
	.BYTE	45
	.BYTE	101
	.BYTE	1
	.BYTE	24
	.BYTE	255
	.BYTE	0
	.BYTE	4
	.BYTE	227
	.BYTE	30
	.BYTE	5
	.BYTE	96
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	0
	.BYTE	24
	.BYTE	255
	.BYTE	0
	.BYTE	4
	.BYTE	227
	.BYTE	30
	.BYTE	101
	.BYTE	1
	.BYTE	82
	.BYTE	4
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	49
	.BYTE	2
	.BYTE	237
	.BYTE	30
	.BYTE	248
	.BYTE	199
	.BYTE	31
	.BYTE	14
	.BYTE	5
	.BYTE	73
	.BYTE	30
	.BYTE	43
	.BYTE	2
	.BYTE	0
	.BYTE	43
	.BYTE	2
	.BYTE	7
	.BYTE	45
	.BYTE	44
	.BYTE	45
	.BYTE	45
	.BYTE	45
	.BYTE	45
	.BYTE	248
	.BYTE	218
	.BYTE	31
	.BYTE	14
	.BYTE	5
	.BYTE	73
	.BYTE	30
	.BYTE	43
	.BYTE	2
	.BYTE	5
	.BYTE	50
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	25
	.BYTE	58
	.BYTE	3
	.BYTE	255
	.BYTE	30
	.BYTE	192
	.BYTE	95
	.BYTE	2
	.BYTE	5
	.BYTE	190
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	2
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	88
	.BYTE	95
	.BYTE	2
	.BYTE	101
	.BYTE	0
	.BYTE	95
	.BYTE	6
	.BYTE	5
	.BYTE	190
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	2
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	88
	.BYTE	95
	.BYTE	2
	.BYTE	101
	.BYTE	0
	.BYTE	82
	.BYTE	8
	.BYTE	93
	.BYTE	4
	.BYTE	5
	.BYTE	190
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	2
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	88
	.BYTE	95
	.BYTE	2
	.BYTE	97
	.BYTE	4
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	49
	.BYTE	93
	.BYTE	4
	.BYTE	5
	.BYTE	190
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	2
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	88
	.BYTE	95
	.BYTE	2
	.BYTE	101
	.BYTE	0
	.BYTE	95
	.BYTE	3
	.BYTE	192
	.BYTE	95
	.BYTE	1
	.BYTE	2
	.BYTE	124
	.BYTE	31
	.BYTE	5
	.BYTE	190
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	0
	.BYTE	15
	.BYTE	101
	.BYTE	2
	.BYTE	14
	.BYTE	97
	.BYTE	7
	.BYTE	11
	.BYTE	88
	.BYTE	67
	.BYTE	9
	.BYTE	69
	.BYTE	101
	.BYTE	2
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	88
	.BYTE	95
	.BYTE	2
	.BYTE	101
	.BYTE	1
	.BYTE	161
	.BYTE	95
	.BYTE	1
	.BYTE	177
	.BYTE	101
	.BYTE	1
	.BYTE	67
	.BYTE	101
	.BYTE	6
	.BYTE	60
	.BYTE	3
	.BYTE	92
	.BYTE	31
	.BYTE	5
	.BYTE	190
	.BYTE	30
	.BYTE	95
	.BYTE	0
	.BYTE	101
	.BYTE	2
	.BYTE	67
	.BYTE	101
	.BYTE	0
	.BYTE	88
	.BYTE	95
	.BYTE	2
	.BYTE	101
	.BYTE	2
	.BYTE	4
	.BYTE	154
	.BYTE	31
	.BYTE	2
	.BYTE	184
	.BYTE	31
	.BYTE	249
	.BYTE	46
	.BYTE	15
	.BYTE	5
	.BYTE	61
	.BYTE	30
	.BYTE	43
	.BYTE	1
	.BYTE	101
	.BYTE	3
	.BYTE	23
	.BYTE	1
	.BYTE	4
	.BYTE	181
	.BYTE	31
	.BYTE	248
	.BYTE	228
	.BYTE	31
	.BYTE	14
	.BYTE	5
	.BYTE	73
	.BYTE	30
	.BYTE	43
	.BYTE	2
	.BYTE	97
	.BYTE	4
	.BYTE	6
	.BYTE	2
	.BYTE	255
	.BYTE	30
	.BYTE	248
	.BYTE	238
	.BYTE	31
	.BYTE	14
	.BYTE	5
	.BYTE	73
	.BYTE	30
	.BYTE	43
	.BYTE	2
	.BYTE	2
	.BYTE	246
	.BYTE	30
	.BYTE	43
	.BYTE	7
	.BYTE	7
	.BYTE	13
	.BYTE	10
	.BYTE	69
	.BYTE	82
	.BYTE	82
	.BYTE	79
	.BYTE	82
	.BYTE	58
	.BYTE	32
	.BYTE	110
	.BYTE	111
	.BYTE	116
	.BYTE	32
	.BYTE	104
	.BYTE	101
	.BYTE	120
	.BYTE	13
	.BYTE	10
	.BYTE	0
	.BYTE	13
	.BYTE	10
	.BYTE	76
	.BYTE	79
	.BYTE	65
	.BYTE	68
	.BYTE	32
	.BYTE	62
	.BYTE	32
	.BYTE	0
	.BYTE	13
	.BYTE	10
	.BYTE	68
	.BYTE	79
	.BYTE	78
	.BYTE	69
	.BYTE	46
	.BYTE	13
	.BYTE	10
	.BYTE	0
	.BYTE	13
	.BYTE	10
	.BYTE	67
	.BYTE	72
	.BYTE	69
	.BYTE	67
	.BYTE	75
	.BYTE	83
	.BYTE	85
	.BYTE	77
	.BYTE	32
	.BYTE	69
	.BYTE	82
	.BYTE	82
	.BYTE	79
	.BYTE	82
	.BYTE	46
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
;;;         name = load_image
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = load_image
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cload_image:
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
;;;       { 3 Expression (cast)r
;;;         { 4 Expr & r
;--	load_address loader
	MOVE	#Cloader, RR
;;;         } 4 Expr & r
;;;       } 3 Expression (cast)r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
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
;;;         name = to
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr l - r
;;;         { 4 Expression (cast)r
;;;           { 5 NumericExpression (constant 8192 = 0x2000)
;--	load_rr_constant
	MOVE	#0x2000, RR
;;;           } 5 NumericExpression (constant 8192 = 0x2000)
;;;         } 4 Expression (cast)r
;--	l - r
	SUB	RR, #0x01CE
;;;       } 3 Expr l - r
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
;;;       { 3 NumericExpression (sizeof expr)
;--	load_rr_constant
	MOVE	#0x01CE, RR
;;;       } 3 NumericExpression (sizeof expr)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_49, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 while Statement
L30_loop_87:
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L30_cont_87:
;;;         { 4 Expr l < r
;;;           { 5 TypeName (internal)
;;;             { 6 TypeSpecifier (all)
;;;               spec = int (80000)
;;;             } 6 TypeSpecifier (all)
;;;           } 5 TypeName (internal)
;--	load_address tx_sema
	MOVE	#Ctx_sema, RR
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	l < r
	SLT	RR, #0x0010
;;;         } 4 Expr l < r
;--	branch_true
	JMP	RRNZ, L30_loop_87
L30_brk_88:
;;;       } 3 while Statement
;;;       { 3 ExpressionStatement
	DI
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE #0x00, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	OUT  R, (OUT_INT_MASK)
;;;       } 3 ExpressionStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
;--	branch
	JMP	L30_tst_89
L30_loop_89:
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l = r
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = unsigned char (22000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = to
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (from)
;--	load_rr_var from = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var from = -2(FP), SP at -6
	MOVE	RR, 4(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
;--	content
	MOVE	(RR), RU
;;;             } 6 Expr * r
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;             { 6 Expr * r
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (to)
;--	load_rr_var to = -4(FP), SP at -7 (16 bit)
	MOVE	3(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var to = -4(FP), SP at -7
	MOVE	RR, 3(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
;;;             } 6 Expr * r
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (8 bit)
	MOVE	(SP)+, RU
;--	assign (8 bit)
	MOVE	R, (LL)
;;;           } 5 Expr l = r
;;;         } 4 ExpressionStatement
L30_cont_89:
;;;         { 4 Expr --r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (len)
;--	load_rr_var len = -6(FP), SP at -6 (16 bit)
	MOVE	0(SP), RR
;;;           } 5 Expression (variable name)
;--	--
	SUB	RR, #0x0001
;--	store_rr_var len = -6(FP), SP at -6
	MOVE	RR, 0(SP)
;;;         } 4 Expr --r
L30_tst_89:
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (len)
;--	load_rr_var len = -6(FP), SP at -6 (16 bit)
	MOVE	0(SP), RR
;;;         } 4 Expression (variable name)
;--	branch_true
	JMP	RRNZ, L30_loop_89
L30_brk_90:
;;;       } 3 for Statement
;;;       { 3 ExpressionStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (to)
;--	load_rr_var to = -4(FP), SP at -6 (16 bit)
	MOVE	2(SP), RR
;;;         } 4 Expression (variable name)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	MOVE  RR, SP
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	JMP  0x1EF0		; &main
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L30_return:
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
;;;         name = show_semas
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = show_semas
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cshow_semas:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_55, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = print_n
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr (l , r)
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = count
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 NumericExpression (constant 79 = 0x4F)
;--	load_rr_constant
	MOVE	#0x004F, RR
;;;             } 6 NumericExpression (constant 79 = 0x4F)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;             { 6 NumericExpression (constant 45 = 0x2D)
;--	load_rr_constant
	MOVE	#0x002D, RR
;;;             } 6 NumericExpression (constant 45 = 0x2D)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           } 5 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_n
;--	pop 3 bytes
	ADD	SP, #3
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_56, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = show_sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = s
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cshow_sema
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = show_sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = s
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address rx_sema
	MOVE	#Crx_sema, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cshow_sema
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = show_sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = s
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address tx_sema
	MOVE	#Ctx_sema, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cshow_sema
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = show_sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = s
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address t2_control
	MOVE	#Ct2_control, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cshow_sema
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = show_sema
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = false
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (struct/union)
;;;                 spec = struct '_semaphore' (800000)
;;;                 name = _semaphore
;;;               } 7 TypeSpecifier (struct/union)
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
;;;                   name = s
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;           } 5 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Cshow_sema
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = print_n
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr (l , r)
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = count
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 NumericExpression (constant 79 = 0x4F)
;--	load_rr_constant
	MOVE	#0x004F, RR
;;;             } 6 NumericExpression (constant 79 = 0x4F)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;             { 6 NumericExpression (constant 61 = 0x3D)
;--	load_rr_constant
	MOVE	#0x003D, RR
;;;             } 6 NumericExpression (constant 61 = 0x3D)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           } 5 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_n
;--	pop 3 bytes
	ADD	SP, #3
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_57, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 IfElseStatement
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (serial_in_overflows)
;--	load_rr_var serial_in_overflows, (16 bit)
	MOVE	(Cserial_in_overflows), RR
;;;         } 4 Expression (variable name)
;--	branch_false
	JMP	RRZ, L31_endif_91
;;;         { 4 ExpressionStatement
;;;           { 5 Expr l(r)
;;;             { 6 TypeName
;;;               { 7 TypeSpecifier (all)
;;;                 spec = int (80000)
;;;               } 7 TypeSpecifier (all)
;;;               { 7 List<DeclItem>
;;;                 { 8 DeclItem
;;;                   what = DECL_NAME
;;;                   name = printf
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
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
;;;                 expr_type = "identifier" (serial_in_overflows)
;--	load_rr_var serial_in_overflows, (16 bit)
	MOVE	(Cserial_in_overflows), RR
;;;               } 7 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;               { 7 StringExpression
;--	load_rr_string
	MOVE	#Cstr_58, RR
;;;               } 7 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;             } 6 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;           } 5 Expr l(r)
;;;         } 4 ExpressionStatement
L31_endif_91:
;;;       } 3 IfElseStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L31_return:
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
;;;         name = show_tasks
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = show_tasks
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cshow_tasks:
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
;;;         name = t
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;     { 2 Initializer (skalar)
;;;       { 3 Expr & r
;--	load_address task_idle
	MOVE	#Ctask_idle, RR
;;;       } 3 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;     } 2 Initializer (skalar)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_59, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = print_n
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr (l , r)
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = count
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 NumericExpression (constant 79 = 0x4F)
;--	load_rr_constant
	MOVE	#0x004F, RR
;;;             } 6 NumericExpression (constant 79 = 0x4F)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;             { 6 NumericExpression (constant 45 = 0x2D)
;--	load_rr_constant
	MOVE	#0x002D, RR
;;;             } 6 NumericExpression (constant 45 = 0x2D)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           } 5 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_n
;--	pop 3 bytes
	ADD	SP, #3
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_60, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 do while Statement
L32_loop_92:
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
;;;                   { 9 Expr l(r)
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = stack_used
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                     { 10 ParameterDeclaration
;;;                       isEllipsis = false
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (struct/union)
;;;                           spec = struct '_task' (800000)
;;;                           name = _task
;;;                         } 12 TypeSpecifier (struct/union)
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
;;;                             name = t
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                     } 10 ParameterDeclaration
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                     } 10 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cstack_used
;--	pop 2 bytes
	ADD	SP, #2
;;;                   } 9 Expr l(r)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;                     { 10 Expr l - r
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -4 (16 bit)
	MOVE	2(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0008
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x000A
;--	content
	MOVE	(RR), RR
;--	move_rr_to_ll
	MOVE	RR, LL
;--	pop_rr (16 bit)
	MOVE	(SP)+, RR
;--	scale_rr *1
;--	l - r
	SUB	LL, RR
;--	scale *1
;;;                     } 10 Expr l - r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                     { 10 Expr (l , r)
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
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -6 (16 bit)
	MOVE	4(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x0002
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                       { 11 Expr (l , r)
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
;;;                         { 12 Expr * r
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -8 (16 bit)
	MOVE	6(SP), RR
;;;                           } 13 Expression (variable name)
;;;                         } 12 Expr * r
;--	+ (member)
	ADD	RR, #0x0005
;--	content
	MOVE	(RR), RU
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                         { 12 Expr (l , r)
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
;;;                           { 13 Expr * r
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -10 (16 bit)
	MOVE	8(SP), RR
;;;                             } 14 Expression (variable name)
;;;                           } 13 Expr * r
;--	+ (member)
	ADD	RR, #0x0006
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
	MOVE	#Cstr_61, RR
;;;                           } 13 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                         } 12 Expr (l , r)
;;;                       } 11 Expr (l , r)
;;;                     } 10 Expr (l , r)
;;;                   } 9 Expr (l , r)
;;;                 } 8 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 12 bytes
	ADD	SP, #12
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr * r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                 } 8 Expression (variable name)
;;;               } 7 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
;--	branch_false
	JMP	RRZ, L32_else_94
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
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                       } 11 Expression (variable name)
;;;                     } 10 Expr * r
;--	+ (member)
	ADD	RR, #0x0010
;--	content
	MOVE	(RR), RR
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
	MOVE	#Cstr_62, RR
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
;--	branch
	JMP	L32_endif_94
L32_else_94:
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
	MOVE	#Cstr_63, RR
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
L32_endif_94:
;;;             } 6 IfElseStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l == r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l == r
	SEQ	RR, #0x0000
;;;               } 7 Expr l == r
;--	branch_false
	JMP	RRZ, L32_endif_95
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
	MOVE	#Cstr_64, RR
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
L32_endif_95:
;;;             } 6 IfElseStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l & r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0x0004
;;;               } 7 Expr l & r
;--	branch_false
	JMP	RRZ, L32_endif_96
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
	MOVE	#Cstr_65, RR
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
L32_endif_96:
;;;             } 6 IfElseStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l & r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0x0002
;;;               } 7 Expr l & r
;--	branch_false
	JMP	RRZ, L32_endif_97
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
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                       } 11 Expression (variable name)
;;;                     } 10 Expr * r
;--	+ (member)
	ADD	RR, #0x0012
;--	content
	MOVE	(RR), RR
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
	MOVE	#Cstr_66, RR
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
L32_endif_97:
;;;             } 6 IfElseStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l & r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
	ADD	RR, #0x0004
;--	content
	MOVE	(RR), RS
;--	l & r
	AND	RR, #0x0001
;;;               } 7 Expr l & r
;--	branch_false
	JMP	RRZ, L32_endif_98
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
;;;                       { 11 Expr * r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                         } 12 Expression (variable name)
;;;                       } 11 Expr * r
;--	+ (member)
	ADD	RR, #0x000E
;--	content
	MOVE	(RR), RR
;;;                     } 10 Expr * r
;--	+ (member)
	ADD	RR, #0x0006
;--	content
	MOVE	(RR), RR
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
	MOVE	#Cstr_67, RR
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
L32_endif_98:
;;;             } 6 IfElseStatement
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
	MOVE	#Cstr_68, RR
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
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (struct/union)
;;;                     spec = struct '_task' (800000)
;;;                     name = _task
;;;                   } 9 TypeSpecifier (struct/union)
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
;;;                       name = t
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr * r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (t)
;--	load_rr_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), RR
;;;                   } 9 Expression (variable name)
;;;                 } 8 Expr * r
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	store_rr_var t = -2(FP), SP at -2
	MOVE	RR, 0(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L32_cont_92:
;;;         { 4 Expr l != r
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (struct/union)
;;;               spec = struct '_task' (800000)
;;;               name = _task
;;;             } 6 TypeSpecifier (struct/union)
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
;;;                 name = t
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr & r
;--	load_address task_idle
	MOVE	#Ctask_idle, RR
;;;           } 5 Expr & r
;;;           { 5 Expression (variable name)
;;;             expr_type = "identifier" (t)
;--	load_ll_var t = -2(FP), SP at -2 (16 bit)
	MOVE	0(SP), LL
;;;           } 5 Expression (variable name)
;--	l != r
	SNE	LL, RR
;;;         } 4 Expr l != r
;--	branch_true
	JMP	RRNZ, L32_loop_92
L32_brk_93:
;;;       } 3 do while Statement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = print_n
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;;;           { 5 Expr (l , r)
;;;             { 6 ParameterDeclaration
;;;               isEllipsis = false
;;;               { 7 TypeName
;;;                 { 8 TypeSpecifier (all)
;;;                   spec = int (80000)
;;;                 } 8 TypeSpecifier (all)
;;;                 { 8 List<DeclItem>
;;;                   { 9 DeclItem
;;;                     what = DECL_NAME
;;;                     name = count
;;;                   } 9 DeclItem
;;;                 } 8 List<DeclItem>
;;;               } 7 TypeName
;;;             } 6 ParameterDeclaration
;;;             { 6 NumericExpression (constant 79 = 0x4F)
;--	load_rr_constant
	MOVE	#0x004F, RR
;;;             } 6 NumericExpression (constant 79 = 0x4F)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
;;;             { 6 NumericExpression (constant 61 = 0x3D)
;--	load_rr_constant
	MOVE	#0x003D, RR
;;;             } 6 NumericExpression (constant 61 = 0x3D)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;;;           } 5 Expr (l , r)
;--	push 0 bytes
;--	call
	CALL	Cprint_n
;--	pop 3 bytes
	ADD	SP, #3
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
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
;;;           { 5 ParameterDeclaration
;;;             isEllipsis = true
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
;;;                   name = format
;;;                 } 8 DeclItem
;;;               } 7 List<DeclItem>
;;;             } 6 TypeName
;;;           } 5 ParameterDeclaration
;;;           { 5 StringExpression
;--	load_rr_string
	MOVE	#Cstr_69, RR
;;;           } 5 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 2 bytes
	ADD	SP, #2
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L32_return:
;--	pop 2 bytes
	ADD	SP, #2
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
L33_loop_99:
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
L33_cont_99:
;;;         { 4 Expression (variable name)
;;;           expr_type = "identifier" (seconds_changed)
;--	load_rr_var seconds_changed, (8 bit)
	MOVE	(Cseconds_changed), RU
;;;         } 4 Expression (variable name)
;--	branch_true
	JMP	RRNZ, L33_loop_99
L33_brk_100:
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
	MOVE	#Cstr_70, RR
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
L33_return:
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
	JMP	L34_tst_101
L34_loop_101:
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
	MOVE	#Cstr_71, RR
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
	JMP	L34_tst_103
L34_loop_103:
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
	MOVE	#Cstr_72, RR
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
L34_cont_103:
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
L34_tst_103:
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
	JMP	RRNZ, L34_loop_103
L34_brk_104:
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
	MOVE	#Cstr_73, RR
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
	JMP	L34_tst_105
L34_loop_105:
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
	JMP	RRZ, L34_else_107
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
	JMP	L34_endif_107
L34_else_107:
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
	JMP	RRZ, L34_else_108
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
	JMP	L34_endif_108
L34_else_108:
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
L34_endif_108:
;;;                     } 10 IfElseStatement
L34_endif_107:
;;;                   } 9 IfElseStatement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L34_cont_105:
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
L34_tst_105:
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
	JMP	RRNZ, L34_loop_105
L34_brk_106:
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
	MOVE	#Cstr_74, RR
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
L34_cont_101:
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
L34_tst_101:
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
	JMP	RRNZ, L34_loop_101
L34_brk_102:
;;;       } 3 for Statement
;;;     } 2 List<for Statement>
;;;   } 1 CompoundStatement
;--	ret
L34_return:
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
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cmain:
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
	MOVE #0x05, RR
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
	OUT  R, (OUT_INT_MASK)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = deschedule
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cdeschedule
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = init_unused
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cinit_unused
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = init_stack
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cinit_stack
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L35_loop_109:
;;;         { 4 ExpressionStatement
	HALT
;;;         } 4 ExpressionStatement
L35_cont_109:
;--	branch
	JMP	L35_loop_109
L35_brk_110:
;;;       } 3 for Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L35_return:
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
;;;         name = main_1
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = main_1
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
Cmain_1:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = c
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
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
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = value
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = init_stack
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cinit_stack
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L36_loop_111:
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
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
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
	MOVE	#Cstr_78, RR
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
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
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
;;;                       name = last_c
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -2(FP), SP at -7 (16 bit)
	MOVE	5(SP), RR
;;;                 } 8 Expression (variable name)
;--	store_rr_var last_c = -3(FP), SP at -7
	MOVE	R, 4(SP)
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
;;;                         name = getchr_timed
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 ParameterDeclaration
;;;                     isEllipsis = false
;;;                     { 10 TypeName
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = unsigned int (82000)
;;;                       } 11 TypeSpecifier (all)
;;;                       { 11 List<DeclItem>
;;;                         { 12 DeclItem
;;;                           what = DECL_NAME
;;;                           name = ticks
;;;                         } 12 DeclItem
;;;                       } 11 List<DeclItem>
;;;                     } 10 TypeName
;;;                   } 9 ParameterDeclaration
;;;                   { 9 NumericExpression (constant 60000 = 0xEA60)
;--	load_rr_constant
	MOVE	#0xEA60, RR
;;;                   } 9 NumericExpression (constant 60000 = 0xEA60)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cgetchr_timed
;--	pop 2 bytes
	ADD	SP, #2
;;;                 } 8 Expr l(r)
;--	store_rr_var c = -2(FP), SP at -7
	MOVE	RR, 5(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 IfElseStatement
;;;               { 7 Expr l == r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (c)
;--	load_rr_var c = -2(FP), SP at -7 (16 bit)
	MOVE	5(SP), RR
;;;                 } 8 Expression (variable name)
;--	l == r
	SEQ	RR, #0xFFFF
;;;               } 7 Expr l == r
;--	branch_false
	JMP	RRZ, L36_endif_113
;;;               { 7 CompoundStatement
;;;                 { 8 List<ExpressionStatement>
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = void (10000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = P
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (struct/union)
;;;                             spec = struct '_semaphore' (800000)
;;;                             name = _semaphore
;;;                           } 13 TypeSpecifier (struct/union)
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
;;;                               name = sema
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                       } 11 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
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
;;;                             name = printf
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr (l , r)
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
;;;                         { 12 Expr * r
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (current_task)
;--	load_rr_var current_task, (16 bit)
	MOVE	(Ccurrent_task), RR
;;;                           } 13 Expression (variable name)
;;;                         } 12 Expr * r
;--	+ (member)
	ADD	RR, #0x0006
;--	content
	MOVE	(RR), RR
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
	MOVE	#Cstr_79, RR
;;;                         } 12 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                       } 11 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
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
;;;                             name = V
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (struct/union)
;;;                             spec = struct '_semaphore' (800000)
;;;                             name = _semaphore
;;;                           } 13 TypeSpecifier (struct/union)
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
;;;                               name = sema
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                       } 11 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_cont_111
;;;                   } 9 break/continue Statement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L36_endif_113:
;;;             } 6 IfElseStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 SwitchStatement
;;;               { 7 Expression (variable name)
;;;                 expr_type = "identifier" (c)
;--	load_rr_var c = -2(FP), SP at -7 (16 bit)
	MOVE	5(SP), RR
;;;               } 7 Expression (variable name)
;--	move_rr_to_ll
	MOVE	RR, LL
;--	branch_case (16 bit)
	SEQ	LL, #0x000D
	JMP	RRNZ, L36_case_114_000D
;--	branch_case (16 bit)
	SEQ	LL, #0x000A
	JMP	RRNZ, L36_case_114_000A
;--	branch_case (16 bit)
	SEQ	LL, #0x0032
	JMP	RRNZ, L36_case_114_0032
;--	branch_case (16 bit)
	SEQ	LL, #0x0033
	JMP	RRNZ, L36_case_114_0033
;--	branch_case (16 bit)
	SEQ	LL, #0x0062
	JMP	RRNZ, L36_case_114_0062
;--	branch_case (16 bit)
	SEQ	LL, #0x0063
	JMP	RRNZ, L36_case_114_0063
;--	branch_case (16 bit)
	SEQ	LL, #0x0064
	JMP	RRNZ, L36_case_114_0064
;--	branch_case (16 bit)
	SEQ	LL, #0x0065
	JMP	RRNZ, L36_case_114_0065
;--	branch_case (16 bit)
	SEQ	LL, #0x006D
	JMP	RRNZ, L36_case_114_006D
;--	branch_case (16 bit)
	SEQ	LL, #0x0073
	JMP	RRNZ, L36_case_114_0073
;--	branch_case (16 bit)
	SEQ	LL, #0x0074
	JMP	RRNZ, L36_case_114_0074
;--	branch_case (16 bit)
	SEQ	LL, #0x0048
	JMP	RRNZ, L36_case_114_0048
;--	branch_case (16 bit)
	SEQ	LL, #0x0049
	JMP	RRNZ, L36_case_114_0049
;--	branch_case (16 bit)
	SEQ	LL, #0x0053
	JMP	RRNZ, L36_case_114_0053
;--	branch_case (16 bit)
	SEQ	LL, #0x0054
	JMP	RRNZ, L36_case_114_0054
;--	branch
	JMP	L36_deflt_114
;;;               { 7 CompoundStatement
;;;                 { 8 List<case Statement>
;;;                   { 9 case Statement
L36_case_114_000D:
;;;                     { 10 case Statement
L36_case_114_000A:
;;;                       { 11 IfElseStatement
;;;                         { 12 Expr l == r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (last_c)
;--	load_rr_var last_c = -3(FP), SP at -7 (8 bit)
	MOVE	4(SP), RS
;;;                           } 13 Expression (variable name)
;--	l == r
	SEQ	RR, #0x0064
;;;                         } 12 Expr l == r
;--	branch_false
	JMP	RRZ, L36_endif_115
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
;--	load_rr_var address = -5(FP), SP at -7 (16 bit)
	MOVE	2(SP), RR
;;;                                   } 17 Expression (variable name)
;--	l + r
	ADD	RR, #0x0100
;;;                                 } 16 Expr l + r
;--	store_rr_var address = -5(FP), SP at -7
	MOVE	RR, 2(SP)
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
;;;                                       name = putchr
;;;                                     } 18 DeclItem
;;;                                   } 17 List<DeclItem>
;;;                                 } 16 TypeName
;;;                                 { 16 ParameterDeclaration
;;;                                   isEllipsis = false
;;;                                   { 17 TypeName
;;;                                     { 18 TypeSpecifier (all)
;;;                                       spec = char (20000)
;;;                                     } 18 TypeSpecifier (all)
;;;                                     { 18 List<DeclItem>
;;;                                       { 19 DeclItem
;;;                                         what = DECL_NAME
;;;                                         name = c
;;;                                       } 19 DeclItem
;;;                                     } 18 List<DeclItem>
;;;                                   } 17 TypeName
;;;                                 } 16 ParameterDeclaration
;;;                                 { 16 NumericExpression (constant 13 = 0xD)
;--	load_rr_constant
	MOVE	#0x000D, RR
;;;                                 } 16 NumericExpression (constant 13 = 0xD)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
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
;--	load_rr_var address = -5(FP), SP at -7 (16 bit)
	MOVE	2(SP), RR
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
;;;                                     spec = int (80000)
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
;--	store_rr_var c = -2(FP), SP at -7
	MOVE	RR, 5(SP)
;;;                               } 15 Expr l = r
;;;                             } 14 ExpressionStatement
;;;                           } 13 List<ExpressionStatement>
;;;                         } 12 CompoundStatement
L36_endif_115:
;;;                       } 11 IfElseStatement
;;;                     } 10 case Statement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0032:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = void (10000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = V
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 ParameterDeclaration
;;;                           isEllipsis = false
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (struct/union)
;;;                               spec = struct '_semaphore' (800000)
;;;                               name = _semaphore
;;;                             } 14 TypeSpecifier (struct/union)
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
;;;                                 name = sema
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                         } 12 ParameterDeclaration
;;;                         { 12 Expr & r
;--	load_address t2_control
	MOVE	#Ct2_control, RR
;;;                         } 12 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
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
	MOVE	#Cstr_80, RR
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
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0033:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = void (10000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = V
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 ParameterDeclaration
;;;                           isEllipsis = false
;;;                           { 13 TypeName
;;;                             { 14 TypeSpecifier (struct/union)
;;;                               spec = struct '_semaphore' (800000)
;;;                               name = _semaphore
;;;                             } 14 TypeSpecifier (struct/union)
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
;;;                                 name = sema
;;;                               } 15 DeclItem
;;;                             } 14 List<DeclItem>
;;;                           } 13 TypeName
;;;                         } 12 ParameterDeclaration
;;;                         { 12 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;                         } 12 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = void (10000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = sleep
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = millisecs
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 100 = 0x64)
;--	load_rr_constant
	MOVE	#0x0064, RR
;;;                       } 11 NumericExpression (constant 100 = 0x64)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Csleep
;--	pop 2 bytes
	ADD	SP, #2
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
;;;                             name = P
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (struct/union)
;;;                             spec = struct '_semaphore' (800000)
;;;                             name = _semaphore
;;;                           } 13 TypeSpecifier (struct/union)
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
;;;                               name = sema
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;                       } 11 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
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
	MOVE	#Cstr_81, RR
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
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0062:
;;;                     { 10 ExpressionStatement
;;;                       { 11 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                       } 11 NumericExpression (constant 0 = 0x0)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 ExpressionStatement
	OUT  R, (OUT_START_CLK_CTR)
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
;;;                             name = deschedule
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;--	push 0 bytes
;--	call
	CALL	Cdeschedule
;--	pop 0 bytes
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	OUT  R, (OUT_STOP_CLK_CTR)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l = r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = value
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l | r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expr l << r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
	IN   (IN_CLK_CTR_HIGH), RU
;--	l << r
	LSL	RR, #0x0008
;;;                         } 12 Expr l << r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
	IN   (IN_CLK_CTR_LOW), RU
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	l | r
	OR	LL, RR
;;;                       } 11 Expr l | r
;--	store_rr_var value = -7(FP), SP at -7
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
;;;                       { 11 Expr (l , r)
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
;;;                         { 12 Expr l / r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expr l + r
;;;                             { 14 Expression (variable name)
;;;                               expr_type = "identifier" (value)
;--	load_rr_var value = -7(FP), SP at -7 (16 bit)
	MOVE	0(SP), RR
;;;                             } 14 Expression (variable name)
;--	l + r
	ADD	RR, #0x000A
;;;                           } 13 Expr l + r
;--	l / r
	MOVE	RR, LL
	MOVE	#0x0014, RR
;--	l / r
	DI
	DIV_IS
	CALL	mult_div
	MD_FIN
	EI
;;;                         } 12 Expr l / r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                         { 12 Expr (l , r)
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
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (value)
;--	load_rr_var value = -7(FP), SP at -9 (16 bit)
	MOVE	2(SP), RR
;;;                           } 13 Expression (variable name)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
	MOVE	#Cstr_86, RR
;;;                           } 13 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                         } 12 Expr (l , r)
;;;                       } 11 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 6 bytes
	ADD	SP, #6
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0063:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = void (10000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = show_time
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 0 bytes
;--	call
	CALL	Cshow_time
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0064:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l = r
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = char (20000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = last_c
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                         { 12 NumericExpression (constant 100 = 0x64)
;--	load_rr_constant
	MOVE	#0x0064, RR
;;;                         } 12 NumericExpression (constant 100 = 0x64)
;--	store_rr_var last_c = -3(FP), SP at -7
	MOVE	R, 4(SP)
;;;                       } 11 Expr l = r
;;;                     } 10 ExpressionStatement
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
	MOVE	#Cstr_87, RR
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
;--	store_rr_var address = -5(FP), SP at -7
	MOVE	RR, 2(SP)
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
	MOVE	#Cstr_88, RR
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
;--	load_rr_var address = -5(FP), SP at -7 (16 bit)
	MOVE	2(SP), RR
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
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0065:
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
	MOVE	#Cstr_89, RR
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
	MOVE	#Cstr_91, RR
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
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_006D:
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
	MOVE	#Cstr_92, RR
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
;--	store_rr_var address = -5(FP), SP at -7
	MOVE	RR, 2(SP)
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
	MOVE	#Cstr_93, RR
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
;--	load_rr_var address = -5(FP), SP at -8 (16 bit)
	MOVE	3(SP), RR
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
	MOVE	#Cstr_94, RR
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
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0073:
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
;;;                         { 12 Expr (l , r)
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
	IN (IN_DIP_SWITCH), RU
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
	MOVE	#Cstr_95, RR
;;;                           } 13 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                         } 12 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0074:
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
;;;                         { 12 Expr (l , r)
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
	IN (IN_TEMPERAT), RU
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
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
	MOVE	#Cstr_97, RR
;;;                           } 13 StringExpression
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                         } 12 Expr (l , r)
;--	push 2 bytes
;--	call
	CALL	Cprintf
;--	pop 4 bytes
	ADD	SP, #4
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0048:
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
	MOVE	#Cstr_99, RR
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
;;;                   { 9 while Statement
L36_loop_116:
;;;                     { 10 ExpressionStatement
;;;                     } 10 ExpressionStatement
L36_cont_116:
;;;                     { 10 Expr l < r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;--	load_address tx_sema
	MOVE	#Ctx_sema, RR
;--	+ (member)
;--	content
	MOVE	(RR), RR
;--	l < r
	SLT	RR, #0x0010
;;;                     } 10 Expr l < r
;--	branch_true
	JMP	RRNZ, L36_loop_116
L36_brk_117:
;;;                   } 9 while Statement
;;;                   { 9 ExpressionStatement
	DI
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	HALT
;;;                   } 9 ExpressionStatement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0049:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = void (10000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = load_image
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 0 bytes
;--	call
	CALL	Cload_image
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0053:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = void (10000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = show_semas
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 0 bytes
;--	call
	CALL	Cshow_semas
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_case_114_0054:
;;;                     { 10 ExpressionStatement
;;;                       { 11 Expr l(r)
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = void (10000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = show_tasks
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;--	push 0 bytes
;--	call
	CALL	Cshow_tasks
;--	pop 0 bytes
;;;                       } 11 Expr l(r)
;;;                     } 10 ExpressionStatement
;;;                   } 9 case Statement
;;;                   { 9 break/continue Statement
;--	branch
	JMP	L36_brk_114
;;;                   } 9 break/continue Statement
;;;                   { 9 case Statement
L36_deflt_114:
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
	MOVE	#Cstr_102, RR
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
L36_brk_114:
;;;             } 6 SwitchStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L36_cont_111:
;--	branch
	JMP	L36_loop_111
L36_brk_112:
;;;       } 3 for Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L36_return:
;--	pop 7 bytes
	ADD	SP, #7
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
;;;         name = main_2
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = main_2
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cmain_2:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = all_value
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = halt_value
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = all_total
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = halt_total
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = n
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = idle
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 2 bytes
	CLRW	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = init_stack
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cinit_stack
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L37_loop_118:
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
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address t2_control
	MOVE	#Ct2_control, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
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
;;;                       name = all_value
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var all_value = -2(FP), SP at -12
	MOVE	RR, 10(SP)
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
;;;                       name = halt_value
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var halt_value = -4(FP), SP at -12
	MOVE	RR, 8(SP)
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
;;;                       name = all_total
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var all_total = -6(FP), SP at -12
	MOVE	RR, 6(SP)
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
;;;                       name = halt_total
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                 } 8 NumericExpression (constant 0 = 0x0)
;--	store_rr_var halt_total = -8(FP), SP at -12
	MOVE	RR, 4(SP)
;;;               } 7 Expr l = r
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
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
	MOVE	#Cstr_117, RR
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
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
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
;;;                         name = n
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                   } 9 NumericExpression (constant 0 = 0x0)
;--	store_rr_var n = -10(FP), SP at -12
	MOVE	RR, 2(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L37_tst_120
L37_loop_120:
;;;               { 7 CompoundStatement
;;;                 { 8 List<ExpressionStatement>
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l(r)
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = void (10000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = sleep
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = millisecs
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                       } 11 NumericExpression (constant 1 = 0x1)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Csleep
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 NumericExpression (constant 0 = 0x0)
;--	load_rr_constant
	MOVE	#0x0000, RR
;;;                     } 10 NumericExpression (constant 0 = 0x0)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	OUT  R, (OUT_START_CLK_CTR)
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
;;;                             name = sleep
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = millisecs
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                       } 11 NumericExpression (constant 1 = 0x1)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Csleep
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	OUT  R, (OUT_STOP_CLK_CTR)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = all_value
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expr l | r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expr l << r
;;;                             { 14 TypeName (internal)
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = int (80000)
;;;                               } 15 TypeSpecifier (all)
;;;                             } 14 TypeName (internal)
	IN   (IN_CLK_CTR_HIGH), RU
;--	l << r
	LSL	RR, #0x0008
;;;                           } 13 Expr l << r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
	IN   (IN_CLK_CTR_LOW), RU
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	l | r
	OR	LL, RR
;;;                         } 12 Expr l | r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (all_value)
;--	load_ll_var all_value = -2(FP), SP at -12 (16 bit)
	MOVE	10(SP), LL
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var all_value = -2(FP), SP at -12
	MOVE	RR, 10(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = all_total
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expr l >> r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (all_value)
;--	load_rr_var all_value = -2(FP), SP at -12 (16 bit)
	MOVE	10(SP), RR
;;;                           } 13 Expression (variable name)
;--	l >> r
	ASR	RR, #0x0008
;;;                         } 12 Expr l >> r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (all_total)
;--	load_ll_var all_total = -6(FP), SP at -12 (16 bit)
	MOVE	6(SP), LL
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var all_total = -6(FP), SP at -12
	MOVE	RR, 6(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l & r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = all_value
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l & r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = unsigned int (82000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (all_value)
;--	load_rr_var all_value = -2(FP), SP at -12 (16 bit)
	MOVE	10(SP), RR
;;;                         } 12 Expression (variable name)
;--	l & r
	AND	RR, #0x00FF
;;;                       } 11 Expr l & r
;--	store_rr_var all_value = -2(FP), SP at -12
	MOVE	RR, 10(SP)
;;;                     } 10 Expr l & r
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
;;;                             name = sleep
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = millisecs
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                       } 11 NumericExpression (constant 1 = 0x1)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Csleep
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 NumericExpression (constant 3 = 0x3)
;--	load_rr_constant
	MOVE	#0x0003, RR
;;;                     } 10 NumericExpression (constant 3 = 0x3)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	OUT  R, (OUT_START_CLK_CTR)
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
;;;                             name = sleep
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 ParameterDeclaration
;;;                         isEllipsis = false
;;;                         { 12 TypeName
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = int (80000)
;;;                           } 13 TypeSpecifier (all)
;;;                           { 13 List<DeclItem>
;;;                             { 14 DeclItem
;;;                               what = DECL_NAME
;;;                               name = millisecs
;;;                             } 14 DeclItem
;;;                           } 13 List<DeclItem>
;;;                         } 12 TypeName
;;;                       } 11 ParameterDeclaration
;;;                       { 11 NumericExpression (constant 1 = 0x1)
;--	load_rr_constant
	MOVE	#0x0001, RR
;;;                       } 11 NumericExpression (constant 1 = 0x1)
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	Csleep
;--	pop 2 bytes
	ADD	SP, #2
;;;                     } 10 Expr l(r)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
	OUT  R, (OUT_STOP_CLK_CTR)
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = halt_value
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expr l | r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expr l << r
;;;                             { 14 TypeName (internal)
;;;                               { 15 TypeSpecifier (all)
;;;                                 spec = int (80000)
;;;                               } 15 TypeSpecifier (all)
;;;                             } 14 TypeName (internal)
	IN   (IN_CLK_CTR_HIGH), RU
;--	l << r
	LSL	RR, #0x0008
;;;                           } 13 Expr l << r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
	IN   (IN_CLK_CTR_LOW), RU
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	l | r
	OR	LL, RR
;;;                         } 12 Expr l | r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (halt_value)
;--	load_ll_var halt_value = -4(FP), SP at -12 (16 bit)
	MOVE	8(SP), LL
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var halt_value = -4(FP), SP at -12
	MOVE	RR, 8(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l += r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = halt_total
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l + r
;;;                         { 12 Expr l >> r
;;;                           { 13 TypeName (internal)
;;;                             { 14 TypeSpecifier (all)
;;;                               spec = int (80000)
;;;                             } 14 TypeSpecifier (all)
;;;                           } 13 TypeName (internal)
;;;                           { 13 Expression (variable name)
;;;                             expr_type = "identifier" (halt_value)
;--	load_rr_var halt_value = -4(FP), SP at -12 (16 bit)
	MOVE	8(SP), RR
;;;                           } 13 Expression (variable name)
;--	l >> r
	ASR	RR, #0x0008
;;;                         } 12 Expr l >> r
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (halt_total)
;--	load_ll_var halt_total = -8(FP), SP at -12 (16 bit)
	MOVE	4(SP), LL
;;;                         } 12 Expression (variable name)
;--	scale_rr *1
;--	l + r
	ADD	LL, RR
;;;                       } 11 Expr l + r
;--	store_rr_var halt_total = -8(FP), SP at -12
	MOVE	RR, 4(SP)
;;;                     } 10 Expr l += r
;;;                   } 9 ExpressionStatement
;;;                   { 9 ExpressionStatement
;;;                     { 10 Expr l & r
;;;                       { 11 TypeName
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = unsigned int (82000)
;;;                         } 12 TypeSpecifier (all)
;;;                         { 12 List<DeclItem>
;;;                           { 13 DeclItem
;;;                             what = DECL_NAME
;;;                             name = halt_value
;;;                           } 13 DeclItem
;;;                         } 12 List<DeclItem>
;;;                       } 11 TypeName
;;;                       { 11 Expr l & r
;;;                         { 12 TypeName (internal)
;;;                           { 13 TypeSpecifier (all)
;;;                             spec = unsigned int (82000)
;;;                           } 13 TypeSpecifier (all)
;;;                         } 12 TypeName (internal)
;;;                         { 12 Expression (variable name)
;;;                           expr_type = "identifier" (halt_value)
;--	load_rr_var halt_value = -4(FP), SP at -12 (16 bit)
	MOVE	8(SP), RR
;;;                         } 12 Expression (variable name)
;--	l & r
	AND	RR, #0x00FF
;;;                       } 11 Expr l & r
;--	store_rr_var halt_value = -4(FP), SP at -12
	MOVE	RR, 8(SP)
;;;                     } 10 Expr l & r
;;;                   } 9 ExpressionStatement
;;;                 } 8 List<ExpressionStatement>
;;;               } 7 CompoundStatement
L37_cont_120:
;;;               { 7 Expr l - r
;;;                 { 8 Expr ++r
;;;                   { 9 Expression (variable name)
;;;                     expr_type = "identifier" (n)
;--	load_rr_var n = -10(FP), SP at -12 (16 bit)
	MOVE	2(SP), RR
;;;                   } 9 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var n = -10(FP), SP at -12
	MOVE	RR, 2(SP)
;;;                 } 8 Expr ++r
;--	l - r
	SUB	RR, #0x0001
;;;               } 7 Expr l - r
L37_tst_120:
;;;               { 7 Expr l < r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (n)
;--	load_rr_var n = -10(FP), SP at -12 (16 bit)
	MOVE	2(SP), RR
;;;                 } 8 Expression (variable name)
;--	l < r
	SLT	RR, #0x0064
;;;               } 7 Expr l < r
;--	branch_true
	JMP	RRNZ, L37_loop_120
L37_brk_121:
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
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
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
;;;                     expr_type = "identifier" (all_total)
;--	load_rr_var all_total = -6(FP), SP at -12 (16 bit)
	MOVE	6(SP), RR
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
	MOVE	#Cstr_126, RR
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
;;;                     expr_type = "identifier" (halt_total)
;--	load_rr_var halt_total = -8(FP), SP at -12 (16 bit)
	MOVE	4(SP), RR
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
	MOVE	#Cstr_127, RR
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
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l = r
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = idle
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 Expr l / r
;;;                   { 9 TypeName (internal)
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = int (80000)
;;;                     } 10 TypeSpecifier (all)
;;;                   } 9 TypeName (internal)
;;;                   { 9 Expr l * r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expr l >> r
;;;                       { 11 TypeName (internal)
;;;                         { 12 TypeSpecifier (all)
;;;                           spec = int (80000)
;;;                         } 12 TypeSpecifier (all)
;;;                       } 11 TypeName (internal)
;;;                       { 11 Expression (variable name)
;;;                         expr_type = "identifier" (halt_total)
;--	load_rr_var halt_total = -8(FP), SP at -12 (16 bit)
	MOVE	4(SP), RR
;;;                       } 11 Expression (variable name)
;--	l >> r
	ASR	RR, #0x0008
;;;                     } 10 Expr l >> r
;--	l * r
	MOVE	RR, LL
	MOVE	#0x0064, RR
;--	l * r
	DI
	MUL_IS
	CALL	mult_div
	MD_FIN
	EI
;;;                   } 9 Expr l * r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;;;                   { 9 Expr l >> r
;;;                     { 10 TypeName (internal)
;;;                       { 11 TypeSpecifier (all)
;;;                         spec = int (80000)
;;;                       } 11 TypeSpecifier (all)
;;;                     } 10 TypeName (internal)
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (all_total)
;--	load_rr_var all_total = -6(FP), SP at -14 (16 bit)
	MOVE	8(SP), RR
;;;                     } 10 Expression (variable name)
;--	l >> r
	ASR	RR, #0x0008
;;;                   } 9 Expr l >> r
;--	pop_ll (16 bit)
	MOVE	(SP)+, LL
;--	l / r
	DI
	DIV_IS
	CALL	mult_div
	MD_FIN
	EI
;;;                 } 8 Expr l / r
;--	store_rr_var idle = -12(FP), SP at -12
	MOVE	RR, 0(SP)
;;;               } 7 Expr l = r
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
;;;                     expr_type = "identifier" (idle)
;--	load_rr_var idle = -12(FP), SP at -12 (16 bit)
	MOVE	0(SP), RR
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
	MOVE	#Cstr_128, RR
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
;;;                   { 9 Expr l - r
;;;                     { 10 Expression (variable name)
;;;                       expr_type = "identifier" (idle)
;--	load_rr_var idle = -12(FP), SP at -12 (16 bit)
	MOVE	0(SP), RR
;;;                     } 10 Expression (variable name)
	MOVE	#0x0064, LL
;--	l - r
	SUB	LL, RR
;;;                   } 9 Expr l - r
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
	MOVE	#Cstr_129, RR
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
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L37_cont_118:
;--	branch
	JMP	L37_loop_118
L37_brk_119:
;;;       } 3 for Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L37_return:
;--	pop 12 bytes
	ADD	SP, #12
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
;;;         name = main_3
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;;;   } 1 TypeName
;;;   { 1 List<DeclItem>
;;;     { 2 DeclItem
;;;       what = DECL_NAME
;;;       name = main_3
;;;     } 2 DeclItem
;;;     { 2 DeclItem
;;;       what = DECL_FUN
;;;     } 2 DeclItem
;;;   } 1 List<DeclItem>
Cmain_3:
;;;   { 1 InitDeclarator
;;;     { 2 List<DeclItem>
;;;       { 3 DeclItem
;;;         what = DECL_NAME
;;;         name = out
;;;       } 3 DeclItem
;;;     } 2 List<DeclItem>
;--	push_zero 1 bytes
	CLRB	-(SP)
;;;   } 1 InitDeclarator
;;;   { 1 CompoundStatement
;;;     { 2 List<ExpressionStatement>
;;;       { 3 ExpressionStatement
;;;         { 4 Expr l(r)
;;;           { 5 TypeName
;;;             { 6 TypeSpecifier (all)
;;;               spec = void (10000)
;;;             } 6 TypeSpecifier (all)
;;;             { 6 List<DeclItem>
;;;               { 7 DeclItem
;;;                 what = DECL_NAME
;;;                 name = init_stack
;;;               } 7 DeclItem
;;;             } 6 List<DeclItem>
;;;           } 5 TypeName
;--	push 0 bytes
;--	call
	CALL	Cinit_stack
;--	pop 0 bytes
;;;         } 4 Expr l(r)
;;;       } 3 ExpressionStatement
;;;       { 3 for Statement
;;;         { 4 ExpressionStatement
;;;         } 4 ExpressionStatement
L38_loop_122:
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
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address t3_control
	MOVE	#Ct3_control, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = P
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CP
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = char (20000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = out
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 48 = 0x30)
;--	load_rr_constant
	MOVE	#0x0030, RR
;;;                   } 9 NumericExpression (constant 48 = 0x30)
;--	store_rr_var out = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L38_tst_124
L38_loop_124:
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
;;;                     expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
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
L38_cont_124:
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var out = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;               } 7 Expr ++r
L38_tst_124:
;;;               { 7 Expr l <= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	l <= r
	SLE	RR, #0x0039
;;;               } 7 Expr l <= r
;--	branch_true
	JMP	RRNZ, L38_loop_124
L38_brk_125:
;;;             } 6 for Statement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = char (20000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = out
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 65 = 0x41)
;--	load_rr_constant
	MOVE	#0x0041, RR
;;;                   } 9 NumericExpression (constant 65 = 0x41)
;--	store_rr_var out = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L38_tst_126
L38_loop_126:
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
;;;                     expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
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
L38_cont_126:
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var out = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;               } 7 Expr ++r
L38_tst_126:
;;;               { 7 Expr l <= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	l <= r
	SLE	RR, #0x005A
;;;               } 7 Expr l <= r
;--	branch_true
	JMP	RRNZ, L38_loop_126
L38_brk_127:
;;;             } 6 for Statement
;;;             { 6 for Statement
;;;               { 7 ExpressionStatement
;;;                 { 8 Expr l = r
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = char (20000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = out
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                   { 9 NumericExpression (constant 97 = 0x61)
;--	load_rr_constant
	MOVE	#0x0061, RR
;;;                   } 9 NumericExpression (constant 97 = 0x61)
;--	store_rr_var out = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;                 } 8 Expr l = r
;;;               } 7 ExpressionStatement
;--	branch
	JMP	L38_tst_128
L38_loop_128:
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
;;;                     expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
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
L38_cont_128:
;;;               { 7 Expr ++r
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	++
	ADD	RR, #0x0001
;--	store_rr_var out = -1(FP), SP at -1
	MOVE	R, 0(SP)
;;;               } 7 Expr ++r
L38_tst_128:
;;;               { 7 Expr l <= r
;;;                 { 8 TypeName (internal)
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = int (80000)
;;;                   } 9 TypeSpecifier (all)
;;;                 } 8 TypeName (internal)
;;;                 { 8 Expression (variable name)
;;;                   expr_type = "identifier" (out)
;--	load_rr_var out = -1(FP), SP at -1 (8 bit)
	MOVE	0(SP), RS
;;;                 } 8 Expression (variable name)
;--	l <= r
	SLE	RR, #0x007A
;;;               } 7 Expr l <= r
;--	branch_true
	JMP	RRNZ, L38_loop_128
L38_brk_129:
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
;;;                       name = putchr
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = char (20000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = c
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 NumericExpression (constant 13 = 0xD)
;--	load_rr_constant
	MOVE	#0x000D, RR
;;;                 } 8 NumericExpression (constant 13 = 0xD)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;               } 7 Expr l(r)
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
;;;                       name = putchr
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (all)
;;;                       spec = char (20000)
;;;                     } 10 TypeSpecifier (all)
;;;                     { 10 List<DeclItem>
;;;                       { 11 DeclItem
;;;                         what = DECL_NAME
;;;                         name = c
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 NumericExpression (constant 10 = 0xA)
;--	load_rr_constant
	MOVE	#0x000A, RR
;;;                 } 8 NumericExpression (constant 10 = 0xA)
;--	push_rr (8 bit)
	MOVE	R, -(SP)
;--	push 2 bytes
;--	call
	CALL	Cputchr
;--	pop 1 bytes
	ADD	SP, #1
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;             { 6 ExpressionStatement
;;;               { 7 Expr l(r)
;;;                 { 8 TypeName
;;;                   { 9 TypeSpecifier (all)
;;;                     spec = void (10000)
;;;                   } 9 TypeSpecifier (all)
;;;                   { 9 List<DeclItem>
;;;                     { 10 DeclItem
;;;                       what = DECL_NAME
;;;                       name = V
;;;                     } 10 DeclItem
;;;                   } 9 List<DeclItem>
;;;                 } 8 TypeName
;;;                 { 8 ParameterDeclaration
;;;                   isEllipsis = false
;;;                   { 9 TypeName
;;;                     { 10 TypeSpecifier (struct/union)
;;;                       spec = struct '_semaphore' (800000)
;;;                       name = _semaphore
;;;                     } 10 TypeSpecifier (struct/union)
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
;;;                         name = sema
;;;                       } 11 DeclItem
;;;                     } 10 List<DeclItem>
;;;                   } 9 TypeName
;;;                 } 8 ParameterDeclaration
;;;                 { 8 Expr & r
;--	load_address serial_out
	MOVE	#Cserial_out, RR
;;;                 } 8 Expr & r
;--	push_rr (16 bit)
	MOVE	RR, -(SP)
;--	push 0 bytes
;--	call
	CALL	CV
;--	pop 2 bytes
	ADD	SP, #2
;;;               } 7 Expr l(r)
;;;             } 6 ExpressionStatement
;;;           } 5 List<ExpressionStatement>
;;;         } 4 CompoundStatement
L38_cont_122:
;--	branch
	JMP	L38_loop_122
L38_brk_123:
;;;       } 3 for Statement
;;;     } 2 List<ExpressionStatement>
;;;   } 1 CompoundStatement
;--	ret
L38_return:
;--	pop 1 bytes
	ADD	SP, #1
	RET
;;; } 0 FunctionDefinition
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cstack_1:			; 
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
	.BYTE	0			; VOID [16]
	.BYTE	0			; VOID [17]
	.BYTE	0			; VOID [18]
	.BYTE	0			; VOID [19]
	.BYTE	0			; VOID [20]
	.BYTE	0			; VOID [21]
	.BYTE	0			; VOID [22]
	.BYTE	0			; VOID [23]
	.BYTE	0			; VOID [24]
	.BYTE	0			; VOID [25]
	.BYTE	0			; VOID [26]
	.BYTE	0			; VOID [27]
	.BYTE	0			; VOID [28]
	.BYTE	0			; VOID [29]
	.BYTE	0			; VOID [30]
	.BYTE	0			; VOID [31]
	.BYTE	0			; VOID [32]
	.BYTE	0			; VOID [33]
	.BYTE	0			; VOID [34]
	.BYTE	0			; VOID [35]
	.BYTE	0			; VOID [36]
	.BYTE	0			; VOID [37]
	.BYTE	0			; VOID [38]
	.BYTE	0			; VOID [39]
	.BYTE	0			; VOID [40]
	.BYTE	0			; VOID [41]
	.BYTE	0			; VOID [42]
	.BYTE	0			; VOID [43]
	.BYTE	0			; VOID [44]
	.BYTE	0			; VOID [45]
	.BYTE	0			; VOID [46]
	.BYTE	0			; VOID [47]
	.BYTE	0			; VOID [48]
	.BYTE	0			; VOID [49]
	.BYTE	0			; VOID [50]
	.BYTE	0			; VOID [51]
	.BYTE	0			; VOID [52]
	.BYTE	0			; VOID [53]
	.BYTE	0			; VOID [54]
	.BYTE	0			; VOID [55]
	.BYTE	0			; VOID [56]
	.BYTE	0			; VOID [57]
	.BYTE	0			; VOID [58]
	.BYTE	0			; VOID [59]
	.BYTE	0			; VOID [60]
	.BYTE	0			; VOID [61]
	.BYTE	0			; VOID [62]
	.BYTE	0			; VOID [63]
	.BYTE	0			; VOID [64]
	.BYTE	0			; VOID [65]
	.BYTE	0			; VOID [66]
	.BYTE	0			; VOID [67]
	.BYTE	0			; VOID [68]
	.BYTE	0			; VOID [69]
	.BYTE	0			; VOID [70]
	.BYTE	0			; VOID [71]
	.BYTE	0			; VOID [72]
	.BYTE	0			; VOID [73]
	.BYTE	0			; VOID [74]
	.BYTE	0			; VOID [75]
	.BYTE	0			; VOID [76]
	.BYTE	0			; VOID [77]
	.BYTE	0			; VOID [78]
	.BYTE	0			; VOID [79]
	.BYTE	0			; VOID [80]
	.BYTE	0			; VOID [81]
	.BYTE	0			; VOID [82]
	.BYTE	0			; VOID [83]
	.BYTE	0			; VOID [84]
	.BYTE	0			; VOID [85]
	.BYTE	0			; VOID [86]
	.BYTE	0			; VOID [87]
	.BYTE	0			; VOID [88]
	.BYTE	0			; VOID [89]
	.BYTE	0			; VOID [90]
	.BYTE	0			; VOID [91]
	.BYTE	0			; VOID [92]
	.BYTE	0			; VOID [93]
	.BYTE	0			; VOID [94]
	.BYTE	0			; VOID [95]
	.BYTE	0			; VOID [96]
	.BYTE	0			; VOID [97]
	.BYTE	0			; VOID [98]
	.BYTE	0			; VOID [99]
	.BYTE	0			; VOID [100]
	.BYTE	0			; VOID [101]
	.BYTE	0			; VOID [102]
	.BYTE	0			; VOID [103]
	.BYTE	0			; VOID [104]
	.BYTE	0			; VOID [105]
	.BYTE	0			; VOID [106]
	.BYTE	0			; VOID [107]
	.BYTE	0			; VOID [108]
	.BYTE	0			; VOID [109]
	.BYTE	0			; VOID [110]
	.BYTE	0			; VOID [111]
	.BYTE	0			; VOID [112]
	.BYTE	0			; VOID [113]
	.BYTE	0			; VOID [114]
	.BYTE	0			; VOID [115]
	.BYTE	0			; VOID [116]
	.BYTE	0			; VOID [117]
	.BYTE	0			; VOID [118]
	.BYTE	0			; VOID [119]
	.BYTE	0			; VOID [120]
	.BYTE	0			; VOID [121]
	.BYTE	0			; VOID [122]
	.BYTE	0			; VOID [123]
	.BYTE	0			; VOID [124]
	.BYTE	0			; VOID [125]
	.BYTE	0			; VOID [126]
	.BYTE	0			; VOID [127]
	.BYTE	0			; VOID [128]
	.BYTE	0			; VOID [129]
	.BYTE	0			; VOID [130]
	.BYTE	0			; VOID [131]
	.BYTE	0			; VOID [132]
	.BYTE	0			; VOID [133]
	.BYTE	0			; VOID [134]
	.BYTE	0			; VOID [135]
	.BYTE	0			; VOID [136]
	.BYTE	0			; VOID [137]
	.BYTE	0			; VOID [138]
	.BYTE	0			; VOID [139]
	.BYTE	0			; VOID [140]
	.BYTE	0			; VOID [141]
	.BYTE	0			; VOID [142]
	.BYTE	0			; VOID [143]
	.BYTE	0			; VOID [144]
	.BYTE	0			; VOID [145]
	.BYTE	0			; VOID [146]
	.BYTE	0			; VOID [147]
	.BYTE	0			; VOID [148]
	.BYTE	0			; VOID [149]
	.BYTE	0			; VOID [150]
	.BYTE	0			; VOID [151]
	.BYTE	0			; VOID [152]
	.BYTE	0			; VOID [153]
	.BYTE	0			; VOID [154]
	.BYTE	0			; VOID [155]
	.BYTE	0			; VOID [156]
	.BYTE	0			; VOID [157]
	.BYTE	0			; VOID [158]
	.BYTE	0			; VOID [159]
	.BYTE	0			; VOID [160]
	.BYTE	0			; VOID [161]
	.BYTE	0			; VOID [162]
	.BYTE	0			; VOID [163]
	.BYTE	0			; VOID [164]
	.BYTE	0			; VOID [165]
	.BYTE	0			; VOID [166]
	.BYTE	0			; VOID [167]
	.BYTE	0			; VOID [168]
	.BYTE	0			; VOID [169]
	.BYTE	0			; VOID [170]
	.BYTE	0			; VOID [171]
	.BYTE	0			; VOID [172]
	.BYTE	0			; VOID [173]
	.BYTE	0			; VOID [174]
	.BYTE	0			; VOID [175]
	.BYTE	0			; VOID [176]
	.BYTE	0			; VOID [177]
	.BYTE	0			; VOID [178]
	.BYTE	0			; VOID [179]
	.BYTE	0			; VOID [180]
	.BYTE	0			; VOID [181]
	.BYTE	0			; VOID [182]
	.BYTE	0			; VOID [183]
	.BYTE	0			; VOID [184]
	.BYTE	0			; VOID [185]
	.BYTE	0			; VOID [186]
	.BYTE	0			; VOID [187]
	.BYTE	0			; VOID [188]
	.BYTE	0			; VOID [189]
	.BYTE	0			; VOID [190]
	.BYTE	0			; VOID [191]
	.BYTE	0			; VOID [192]
	.BYTE	0			; VOID [193]
	.BYTE	0			; VOID [194]
	.BYTE	0			; VOID [195]
	.BYTE	0			; VOID [196]
	.BYTE	0			; VOID [197]
	.BYTE	0			; VOID [198]
	.BYTE	0			; VOID [199]
	.BYTE	0			; VOID [200]
	.BYTE	0			; VOID [201]
	.BYTE	0			; VOID [202]
	.BYTE	0			; VOID [203]
	.BYTE	0			; VOID [204]
	.BYTE	0			; VOID [205]
	.BYTE	0			; VOID [206]
	.BYTE	0			; VOID [207]
	.BYTE	0			; VOID [208]
	.BYTE	0			; VOID [209]
	.BYTE	0			; VOID [210]
	.BYTE	0			; VOID [211]
	.BYTE	0			; VOID [212]
	.BYTE	0			; VOID [213]
	.BYTE	0			; VOID [214]
	.BYTE	0			; VOID [215]
	.BYTE	0			; VOID [216]
	.BYTE	0			; VOID [217]
	.BYTE	0			; VOID [218]
	.BYTE	0			; VOID [219]
	.BYTE	0			; VOID [220]
	.BYTE	0			; VOID [221]
	.BYTE	0			; VOID [222]
	.BYTE	0			; VOID [223]
	.BYTE	0			; VOID [224]
	.BYTE	0			; VOID [225]
	.BYTE	0			; VOID [226]
	.BYTE	0			; VOID [227]
	.BYTE	0			; VOID [228]
	.BYTE	0			; VOID [229]
	.BYTE	0			; VOID [230]
	.BYTE	0			; VOID [231]
	.BYTE	0			; VOID [232]
	.BYTE	0			; VOID [233]
	.BYTE	0			; VOID [234]
	.BYTE	0			; VOID [235]
	.BYTE	0			; VOID [236]
	.BYTE	0			; VOID [237]
	.BYTE	0			; VOID [238]
	.BYTE	0			; VOID [239]
	.BYTE	0			; VOID [240]
	.BYTE	0			; VOID [241]
	.BYTE	0			; VOID [242]
	.BYTE	0			; VOID [243]
	.BYTE	0			; VOID [244]
	.BYTE	0			; VOID [245]
	.BYTE	0			; VOID [246]
	.BYTE	0			; VOID [247]
	.BYTE	0			; VOID [248]
	.BYTE	0			; VOID [249]
	.BYTE	0			; VOID [250]
	.BYTE	0			; VOID [251]
	.BYTE	0			; VOID [252]
	.BYTE	0			; VOID [253]
	.BYTE	0			; VOID [254]
	.BYTE	0			; VOID [255]
	.BYTE	0			; VOID [256]
	.BYTE	0			; VOID [257]
	.BYTE	0			; VOID [258]
	.BYTE	0			; VOID [259]
	.BYTE	0			; VOID [260]
	.BYTE	0			; VOID [261]
	.BYTE	0			; VOID [262]
	.BYTE	0			; VOID [263]
	.BYTE	0			; VOID [264]
	.BYTE	0			; VOID [265]
	.BYTE	0			; VOID [266]
	.BYTE	0			; VOID [267]
	.BYTE	0			; VOID [268]
	.BYTE	0			; VOID [269]
	.BYTE	0			; VOID [270]
	.BYTE	0			; VOID [271]
	.BYTE	0			; VOID [272]
	.BYTE	0			; VOID [273]
	.BYTE	0			; VOID [274]
	.BYTE	0			; VOID [275]
	.BYTE	0			; VOID [276]
	.BYTE	0			; VOID [277]
	.BYTE	0			; VOID [278]
	.BYTE	0			; VOID [279]
	.BYTE	0			; VOID [280]
	.BYTE	0			; VOID [281]
	.BYTE	0			; VOID [282]
	.BYTE	0			; VOID [283]
	.BYTE	0			; VOID [284]
	.BYTE	0			; VOID [285]
	.BYTE	0			; VOID [286]
	.BYTE	0			; VOID [287]
	.BYTE	0			; VOID [288]
	.BYTE	0			; VOID [289]
	.BYTE	0			; VOID [290]
	.BYTE	0			; VOID [291]
	.BYTE	0			; VOID [292]
	.BYTE	0			; VOID [293]
	.BYTE	0			; VOID [294]
	.BYTE	0			; VOID [295]
	.BYTE	0			; VOID [296]
	.BYTE	0			; VOID [297]
	.BYTE	0			; VOID [298]
	.BYTE	0			; VOID [299]
	.BYTE	0			; VOID [300]
	.BYTE	0			; VOID [301]
	.BYTE	0			; VOID [302]
	.BYTE	0			; VOID [303]
	.BYTE	0			; VOID [304]
	.BYTE	0			; VOID [305]
	.BYTE	0			; VOID [306]
	.BYTE	0			; VOID [307]
	.BYTE	0			; VOID [308]
	.BYTE	0			; VOID [309]
	.BYTE	0			; VOID [310]
	.BYTE	0			; VOID [311]
	.BYTE	0			; VOID [312]
	.BYTE	0			; VOID [313]
	.BYTE	0			; VOID [314]
	.BYTE	0			; VOID [315]
	.BYTE	0			; VOID [316]
	.BYTE	0			; VOID [317]
	.BYTE	0			; VOID [318]
	.BYTE	0			; VOID [319]
	.BYTE	0			; VOID [320]
	.BYTE	0			; VOID [321]
	.BYTE	0			; VOID [322]
	.BYTE	0			; VOID [323]
	.BYTE	0			; VOID [324]
	.BYTE	0			; VOID [325]
	.BYTE	0			; VOID [326]
	.BYTE	0			; VOID [327]
	.BYTE	0			; VOID [328]
	.BYTE	0			; VOID [329]
	.BYTE	0			; VOID [330]
	.BYTE	0			; VOID [331]
	.BYTE	0			; VOID [332]
	.BYTE	0			; VOID [333]
	.BYTE	0			; VOID [334]
	.BYTE	0			; VOID [335]
	.BYTE	0			; VOID [336]
	.BYTE	0			; VOID [337]
	.BYTE	0			; VOID [338]
	.BYTE	0			; VOID [339]
	.BYTE	0			; VOID [340]
	.BYTE	0			; VOID [341]
	.BYTE	0			; VOID [342]
	.BYTE	0			; VOID [343]
	.BYTE	0			; VOID [344]
	.BYTE	0			; VOID [345]
	.BYTE	0			; VOID [346]
	.BYTE	0			; VOID [347]
	.BYTE	0			; VOID [348]
	.BYTE	0			; VOID [349]
	.BYTE	0			; VOID [350]
	.BYTE	0			; VOID [351]
	.BYTE	0			; VOID [352]
	.BYTE	0			; VOID [353]
	.BYTE	0			; VOID [354]
	.BYTE	0			; VOID [355]
	.BYTE	0			; VOID [356]
	.BYTE	0			; VOID [357]
	.BYTE	0			; VOID [358]
	.BYTE	0			; VOID [359]
	.BYTE	0			; VOID [360]
	.BYTE	0			; VOID [361]
	.BYTE	0			; VOID [362]
	.BYTE	0			; VOID [363]
	.BYTE	0			; VOID [364]
	.BYTE	0			; VOID [365]
	.BYTE	0			; VOID [366]
	.BYTE	0			; VOID [367]
	.BYTE	0			; VOID [368]
	.BYTE	0			; VOID [369]
	.BYTE	0			; VOID [370]
	.BYTE	0			; VOID [371]
	.BYTE	0			; VOID [372]
	.BYTE	0			; VOID [373]
	.BYTE	0			; VOID [374]
	.BYTE	0			; VOID [375]
	.BYTE	0			; VOID [376]
	.BYTE	0			; VOID [377]
	.BYTE	0			; VOID [378]
	.BYTE	0			; VOID [379]
	.BYTE	0			; VOID [380]
	.BYTE	0			; VOID [381]
	.BYTE	0			; VOID [382]
	.BYTE	0			; VOID [383]
	.BYTE	0			; VOID [384]
	.BYTE	0			; VOID [385]
	.BYTE	0			; VOID [386]
	.BYTE	0			; VOID [387]
	.BYTE	0			; VOID [388]
	.BYTE	0			; VOID [389]
	.BYTE	0			; VOID [390]
	.BYTE	0			; VOID [391]
	.BYTE	0			; VOID [392]
	.BYTE	0			; VOID [393]
	.BYTE	0			; VOID [394]
	.BYTE	0			; VOID [395]
	.BYTE	0			; VOID [396]
	.BYTE	0			; VOID [397]
	.BYTE	0			; VOID [398]
	.BYTE	0			; VOID [399]
Ctos_1:			; 
	.WORD	0
	.WORD	0
	.WORD	Cmain_1			; & main_1
Ctop_1:			; 
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cstack_2:			; 
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
	.BYTE	0			; VOID [16]
	.BYTE	0			; VOID [17]
	.BYTE	0			; VOID [18]
	.BYTE	0			; VOID [19]
	.BYTE	0			; VOID [20]
	.BYTE	0			; VOID [21]
	.BYTE	0			; VOID [22]
	.BYTE	0			; VOID [23]
	.BYTE	0			; VOID [24]
	.BYTE	0			; VOID [25]
	.BYTE	0			; VOID [26]
	.BYTE	0			; VOID [27]
	.BYTE	0			; VOID [28]
	.BYTE	0			; VOID [29]
	.BYTE	0			; VOID [30]
	.BYTE	0			; VOID [31]
	.BYTE	0			; VOID [32]
	.BYTE	0			; VOID [33]
	.BYTE	0			; VOID [34]
	.BYTE	0			; VOID [35]
	.BYTE	0			; VOID [36]
	.BYTE	0			; VOID [37]
	.BYTE	0			; VOID [38]
	.BYTE	0			; VOID [39]
	.BYTE	0			; VOID [40]
	.BYTE	0			; VOID [41]
	.BYTE	0			; VOID [42]
	.BYTE	0			; VOID [43]
	.BYTE	0			; VOID [44]
	.BYTE	0			; VOID [45]
	.BYTE	0			; VOID [46]
	.BYTE	0			; VOID [47]
	.BYTE	0			; VOID [48]
	.BYTE	0			; VOID [49]
	.BYTE	0			; VOID [50]
	.BYTE	0			; VOID [51]
	.BYTE	0			; VOID [52]
	.BYTE	0			; VOID [53]
	.BYTE	0			; VOID [54]
	.BYTE	0			; VOID [55]
	.BYTE	0			; VOID [56]
	.BYTE	0			; VOID [57]
	.BYTE	0			; VOID [58]
	.BYTE	0			; VOID [59]
	.BYTE	0			; VOID [60]
	.BYTE	0			; VOID [61]
	.BYTE	0			; VOID [62]
	.BYTE	0			; VOID [63]
	.BYTE	0			; VOID [64]
	.BYTE	0			; VOID [65]
	.BYTE	0			; VOID [66]
	.BYTE	0			; VOID [67]
	.BYTE	0			; VOID [68]
	.BYTE	0			; VOID [69]
	.BYTE	0			; VOID [70]
	.BYTE	0			; VOID [71]
	.BYTE	0			; VOID [72]
	.BYTE	0			; VOID [73]
	.BYTE	0			; VOID [74]
	.BYTE	0			; VOID [75]
	.BYTE	0			; VOID [76]
	.BYTE	0			; VOID [77]
	.BYTE	0			; VOID [78]
	.BYTE	0			; VOID [79]
	.BYTE	0			; VOID [80]
	.BYTE	0			; VOID [81]
	.BYTE	0			; VOID [82]
	.BYTE	0			; VOID [83]
	.BYTE	0			; VOID [84]
	.BYTE	0			; VOID [85]
	.BYTE	0			; VOID [86]
	.BYTE	0			; VOID [87]
	.BYTE	0			; VOID [88]
	.BYTE	0			; VOID [89]
	.BYTE	0			; VOID [90]
	.BYTE	0			; VOID [91]
	.BYTE	0			; VOID [92]
	.BYTE	0			; VOID [93]
	.BYTE	0			; VOID [94]
	.BYTE	0			; VOID [95]
	.BYTE	0			; VOID [96]
	.BYTE	0			; VOID [97]
	.BYTE	0			; VOID [98]
	.BYTE	0			; VOID [99]
	.BYTE	0			; VOID [100]
	.BYTE	0			; VOID [101]
	.BYTE	0			; VOID [102]
	.BYTE	0			; VOID [103]
	.BYTE	0			; VOID [104]
	.BYTE	0			; VOID [105]
	.BYTE	0			; VOID [106]
	.BYTE	0			; VOID [107]
	.BYTE	0			; VOID [108]
	.BYTE	0			; VOID [109]
	.BYTE	0			; VOID [110]
	.BYTE	0			; VOID [111]
	.BYTE	0			; VOID [112]
	.BYTE	0			; VOID [113]
	.BYTE	0			; VOID [114]
	.BYTE	0			; VOID [115]
	.BYTE	0			; VOID [116]
	.BYTE	0			; VOID [117]
	.BYTE	0			; VOID [118]
	.BYTE	0			; VOID [119]
	.BYTE	0			; VOID [120]
	.BYTE	0			; VOID [121]
	.BYTE	0			; VOID [122]
	.BYTE	0			; VOID [123]
	.BYTE	0			; VOID [124]
	.BYTE	0			; VOID [125]
	.BYTE	0			; VOID [126]
	.BYTE	0			; VOID [127]
	.BYTE	0			; VOID [128]
	.BYTE	0			; VOID [129]
	.BYTE	0			; VOID [130]
	.BYTE	0			; VOID [131]
	.BYTE	0			; VOID [132]
	.BYTE	0			; VOID [133]
	.BYTE	0			; VOID [134]
	.BYTE	0			; VOID [135]
	.BYTE	0			; VOID [136]
	.BYTE	0			; VOID [137]
	.BYTE	0			; VOID [138]
	.BYTE	0			; VOID [139]
	.BYTE	0			; VOID [140]
	.BYTE	0			; VOID [141]
	.BYTE	0			; VOID [142]
	.BYTE	0			; VOID [143]
	.BYTE	0			; VOID [144]
	.BYTE	0			; VOID [145]
	.BYTE	0			; VOID [146]
	.BYTE	0			; VOID [147]
	.BYTE	0			; VOID [148]
	.BYTE	0			; VOID [149]
	.BYTE	0			; VOID [150]
	.BYTE	0			; VOID [151]
	.BYTE	0			; VOID [152]
	.BYTE	0			; VOID [153]
	.BYTE	0			; VOID [154]
	.BYTE	0			; VOID [155]
	.BYTE	0			; VOID [156]
	.BYTE	0			; VOID [157]
	.BYTE	0			; VOID [158]
	.BYTE	0			; VOID [159]
	.BYTE	0			; VOID [160]
	.BYTE	0			; VOID [161]
	.BYTE	0			; VOID [162]
	.BYTE	0			; VOID [163]
	.BYTE	0			; VOID [164]
	.BYTE	0			; VOID [165]
	.BYTE	0			; VOID [166]
	.BYTE	0			; VOID [167]
	.BYTE	0			; VOID [168]
	.BYTE	0			; VOID [169]
	.BYTE	0			; VOID [170]
	.BYTE	0			; VOID [171]
	.BYTE	0			; VOID [172]
	.BYTE	0			; VOID [173]
	.BYTE	0			; VOID [174]
	.BYTE	0			; VOID [175]
	.BYTE	0			; VOID [176]
	.BYTE	0			; VOID [177]
	.BYTE	0			; VOID [178]
	.BYTE	0			; VOID [179]
	.BYTE	0			; VOID [180]
	.BYTE	0			; VOID [181]
	.BYTE	0			; VOID [182]
	.BYTE	0			; VOID [183]
	.BYTE	0			; VOID [184]
	.BYTE	0			; VOID [185]
	.BYTE	0			; VOID [186]
	.BYTE	0			; VOID [187]
	.BYTE	0			; VOID [188]
	.BYTE	0			; VOID [189]
	.BYTE	0			; VOID [190]
	.BYTE	0			; VOID [191]
	.BYTE	0			; VOID [192]
	.BYTE	0			; VOID [193]
	.BYTE	0			; VOID [194]
	.BYTE	0			; VOID [195]
	.BYTE	0			; VOID [196]
	.BYTE	0			; VOID [197]
	.BYTE	0			; VOID [198]
	.BYTE	0			; VOID [199]
	.BYTE	0			; VOID [200]
	.BYTE	0			; VOID [201]
	.BYTE	0			; VOID [202]
	.BYTE	0			; VOID [203]
	.BYTE	0			; VOID [204]
	.BYTE	0			; VOID [205]
	.BYTE	0			; VOID [206]
	.BYTE	0			; VOID [207]
	.BYTE	0			; VOID [208]
	.BYTE	0			; VOID [209]
	.BYTE	0			; VOID [210]
	.BYTE	0			; VOID [211]
	.BYTE	0			; VOID [212]
	.BYTE	0			; VOID [213]
	.BYTE	0			; VOID [214]
	.BYTE	0			; VOID [215]
	.BYTE	0			; VOID [216]
	.BYTE	0			; VOID [217]
	.BYTE	0			; VOID [218]
	.BYTE	0			; VOID [219]
	.BYTE	0			; VOID [220]
	.BYTE	0			; VOID [221]
	.BYTE	0			; VOID [222]
	.BYTE	0			; VOID [223]
	.BYTE	0			; VOID [224]
	.BYTE	0			; VOID [225]
	.BYTE	0			; VOID [226]
	.BYTE	0			; VOID [227]
	.BYTE	0			; VOID [228]
	.BYTE	0			; VOID [229]
	.BYTE	0			; VOID [230]
	.BYTE	0			; VOID [231]
	.BYTE	0			; VOID [232]
	.BYTE	0			; VOID [233]
	.BYTE	0			; VOID [234]
	.BYTE	0			; VOID [235]
	.BYTE	0			; VOID [236]
	.BYTE	0			; VOID [237]
	.BYTE	0			; VOID [238]
	.BYTE	0			; VOID [239]
	.BYTE	0			; VOID [240]
	.BYTE	0			; VOID [241]
	.BYTE	0			; VOID [242]
	.BYTE	0			; VOID [243]
	.BYTE	0			; VOID [244]
	.BYTE	0			; VOID [245]
	.BYTE	0			; VOID [246]
	.BYTE	0			; VOID [247]
	.BYTE	0			; VOID [248]
	.BYTE	0			; VOID [249]
	.BYTE	0			; VOID [250]
	.BYTE	0			; VOID [251]
	.BYTE	0			; VOID [252]
	.BYTE	0			; VOID [253]
	.BYTE	0			; VOID [254]
	.BYTE	0			; VOID [255]
	.BYTE	0			; VOID [256]
	.BYTE	0			; VOID [257]
	.BYTE	0			; VOID [258]
	.BYTE	0			; VOID [259]
	.BYTE	0			; VOID [260]
	.BYTE	0			; VOID [261]
	.BYTE	0			; VOID [262]
	.BYTE	0			; VOID [263]
	.BYTE	0			; VOID [264]
	.BYTE	0			; VOID [265]
	.BYTE	0			; VOID [266]
	.BYTE	0			; VOID [267]
	.BYTE	0			; VOID [268]
	.BYTE	0			; VOID [269]
	.BYTE	0			; VOID [270]
	.BYTE	0			; VOID [271]
	.BYTE	0			; VOID [272]
	.BYTE	0			; VOID [273]
	.BYTE	0			; VOID [274]
	.BYTE	0			; VOID [275]
	.BYTE	0			; VOID [276]
	.BYTE	0			; VOID [277]
	.BYTE	0			; VOID [278]
	.BYTE	0			; VOID [279]
	.BYTE	0			; VOID [280]
	.BYTE	0			; VOID [281]
	.BYTE	0			; VOID [282]
	.BYTE	0			; VOID [283]
	.BYTE	0			; VOID [284]
	.BYTE	0			; VOID [285]
	.BYTE	0			; VOID [286]
	.BYTE	0			; VOID [287]
	.BYTE	0			; VOID [288]
	.BYTE	0			; VOID [289]
	.BYTE	0			; VOID [290]
	.BYTE	0			; VOID [291]
	.BYTE	0			; VOID [292]
	.BYTE	0			; VOID [293]
	.BYTE	0			; VOID [294]
	.BYTE	0			; VOID [295]
	.BYTE	0			; VOID [296]
	.BYTE	0			; VOID [297]
	.BYTE	0			; VOID [298]
	.BYTE	0			; VOID [299]
	.BYTE	0			; VOID [300]
	.BYTE	0			; VOID [301]
	.BYTE	0			; VOID [302]
	.BYTE	0			; VOID [303]
	.BYTE	0			; VOID [304]
	.BYTE	0			; VOID [305]
	.BYTE	0			; VOID [306]
	.BYTE	0			; VOID [307]
	.BYTE	0			; VOID [308]
	.BYTE	0			; VOID [309]
	.BYTE	0			; VOID [310]
	.BYTE	0			; VOID [311]
	.BYTE	0			; VOID [312]
	.BYTE	0			; VOID [313]
	.BYTE	0			; VOID [314]
	.BYTE	0			; VOID [315]
	.BYTE	0			; VOID [316]
	.BYTE	0			; VOID [317]
	.BYTE	0			; VOID [318]
	.BYTE	0			; VOID [319]
	.BYTE	0			; VOID [320]
	.BYTE	0			; VOID [321]
	.BYTE	0			; VOID [322]
	.BYTE	0			; VOID [323]
	.BYTE	0			; VOID [324]
	.BYTE	0			; VOID [325]
	.BYTE	0			; VOID [326]
	.BYTE	0			; VOID [327]
	.BYTE	0			; VOID [328]
	.BYTE	0			; VOID [329]
	.BYTE	0			; VOID [330]
	.BYTE	0			; VOID [331]
	.BYTE	0			; VOID [332]
	.BYTE	0			; VOID [333]
	.BYTE	0			; VOID [334]
	.BYTE	0			; VOID [335]
	.BYTE	0			; VOID [336]
	.BYTE	0			; VOID [337]
	.BYTE	0			; VOID [338]
	.BYTE	0			; VOID [339]
	.BYTE	0			; VOID [340]
	.BYTE	0			; VOID [341]
	.BYTE	0			; VOID [342]
	.BYTE	0			; VOID [343]
	.BYTE	0			; VOID [344]
	.BYTE	0			; VOID [345]
	.BYTE	0			; VOID [346]
	.BYTE	0			; VOID [347]
	.BYTE	0			; VOID [348]
	.BYTE	0			; VOID [349]
	.BYTE	0			; VOID [350]
	.BYTE	0			; VOID [351]
	.BYTE	0			; VOID [352]
	.BYTE	0			; VOID [353]
	.BYTE	0			; VOID [354]
	.BYTE	0			; VOID [355]
	.BYTE	0			; VOID [356]
	.BYTE	0			; VOID [357]
	.BYTE	0			; VOID [358]
	.BYTE	0			; VOID [359]
	.BYTE	0			; VOID [360]
	.BYTE	0			; VOID [361]
	.BYTE	0			; VOID [362]
	.BYTE	0			; VOID [363]
	.BYTE	0			; VOID [364]
	.BYTE	0			; VOID [365]
	.BYTE	0			; VOID [366]
	.BYTE	0			; VOID [367]
	.BYTE	0			; VOID [368]
	.BYTE	0			; VOID [369]
	.BYTE	0			; VOID [370]
	.BYTE	0			; VOID [371]
	.BYTE	0			; VOID [372]
	.BYTE	0			; VOID [373]
	.BYTE	0			; VOID [374]
	.BYTE	0			; VOID [375]
	.BYTE	0			; VOID [376]
	.BYTE	0			; VOID [377]
	.BYTE	0			; VOID [378]
	.BYTE	0			; VOID [379]
	.BYTE	0			; VOID [380]
	.BYTE	0			; VOID [381]
	.BYTE	0			; VOID [382]
	.BYTE	0			; VOID [383]
	.BYTE	0			; VOID [384]
	.BYTE	0			; VOID [385]
	.BYTE	0			; VOID [386]
	.BYTE	0			; VOID [387]
	.BYTE	0			; VOID [388]
	.BYTE	0			; VOID [389]
	.BYTE	0			; VOID [390]
	.BYTE	0			; VOID [391]
	.BYTE	0			; VOID [392]
	.BYTE	0			; VOID [393]
	.BYTE	0			; VOID [394]
	.BYTE	0			; VOID [395]
	.BYTE	0			; VOID [396]
	.BYTE	0			; VOID [397]
	.BYTE	0			; VOID [398]
	.BYTE	0			; VOID [399]
Ctos_2:			; 
	.WORD	0
	.WORD	0
	.WORD	Cmain_2			; & main_2
Ctop_2:			; 
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (all)
;;;     spec = unsigned int (82000)
;;;   } 1 TypeSpecifier (all)
Cstack_3:			; 
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
	.BYTE	0			; VOID [16]
	.BYTE	0			; VOID [17]
	.BYTE	0			; VOID [18]
	.BYTE	0			; VOID [19]
	.BYTE	0			; VOID [20]
	.BYTE	0			; VOID [21]
	.BYTE	0			; VOID [22]
	.BYTE	0			; VOID [23]
	.BYTE	0			; VOID [24]
	.BYTE	0			; VOID [25]
	.BYTE	0			; VOID [26]
	.BYTE	0			; VOID [27]
	.BYTE	0			; VOID [28]
	.BYTE	0			; VOID [29]
	.BYTE	0			; VOID [30]
	.BYTE	0			; VOID [31]
	.BYTE	0			; VOID [32]
	.BYTE	0			; VOID [33]
	.BYTE	0			; VOID [34]
	.BYTE	0			; VOID [35]
	.BYTE	0			; VOID [36]
	.BYTE	0			; VOID [37]
	.BYTE	0			; VOID [38]
	.BYTE	0			; VOID [39]
	.BYTE	0			; VOID [40]
	.BYTE	0			; VOID [41]
	.BYTE	0			; VOID [42]
	.BYTE	0			; VOID [43]
	.BYTE	0			; VOID [44]
	.BYTE	0			; VOID [45]
	.BYTE	0			; VOID [46]
	.BYTE	0			; VOID [47]
	.BYTE	0			; VOID [48]
	.BYTE	0			; VOID [49]
	.BYTE	0			; VOID [50]
	.BYTE	0			; VOID [51]
	.BYTE	0			; VOID [52]
	.BYTE	0			; VOID [53]
	.BYTE	0			; VOID [54]
	.BYTE	0			; VOID [55]
	.BYTE	0			; VOID [56]
	.BYTE	0			; VOID [57]
	.BYTE	0			; VOID [58]
	.BYTE	0			; VOID [59]
	.BYTE	0			; VOID [60]
	.BYTE	0			; VOID [61]
	.BYTE	0			; VOID [62]
	.BYTE	0			; VOID [63]
	.BYTE	0			; VOID [64]
	.BYTE	0			; VOID [65]
	.BYTE	0			; VOID [66]
	.BYTE	0			; VOID [67]
	.BYTE	0			; VOID [68]
	.BYTE	0			; VOID [69]
	.BYTE	0			; VOID [70]
	.BYTE	0			; VOID [71]
	.BYTE	0			; VOID [72]
	.BYTE	0			; VOID [73]
	.BYTE	0			; VOID [74]
	.BYTE	0			; VOID [75]
	.BYTE	0			; VOID [76]
	.BYTE	0			; VOID [77]
	.BYTE	0			; VOID [78]
	.BYTE	0			; VOID [79]
	.BYTE	0			; VOID [80]
	.BYTE	0			; VOID [81]
	.BYTE	0			; VOID [82]
	.BYTE	0			; VOID [83]
	.BYTE	0			; VOID [84]
	.BYTE	0			; VOID [85]
	.BYTE	0			; VOID [86]
	.BYTE	0			; VOID [87]
	.BYTE	0			; VOID [88]
	.BYTE	0			; VOID [89]
	.BYTE	0			; VOID [90]
	.BYTE	0			; VOID [91]
	.BYTE	0			; VOID [92]
	.BYTE	0			; VOID [93]
	.BYTE	0			; VOID [94]
	.BYTE	0			; VOID [95]
	.BYTE	0			; VOID [96]
	.BYTE	0			; VOID [97]
	.BYTE	0			; VOID [98]
	.BYTE	0			; VOID [99]
	.BYTE	0			; VOID [100]
	.BYTE	0			; VOID [101]
	.BYTE	0			; VOID [102]
	.BYTE	0			; VOID [103]
	.BYTE	0			; VOID [104]
	.BYTE	0			; VOID [105]
	.BYTE	0			; VOID [106]
	.BYTE	0			; VOID [107]
	.BYTE	0			; VOID [108]
	.BYTE	0			; VOID [109]
	.BYTE	0			; VOID [110]
	.BYTE	0			; VOID [111]
	.BYTE	0			; VOID [112]
	.BYTE	0			; VOID [113]
	.BYTE	0			; VOID [114]
	.BYTE	0			; VOID [115]
	.BYTE	0			; VOID [116]
	.BYTE	0			; VOID [117]
	.BYTE	0			; VOID [118]
	.BYTE	0			; VOID [119]
	.BYTE	0			; VOID [120]
	.BYTE	0			; VOID [121]
	.BYTE	0			; VOID [122]
	.BYTE	0			; VOID [123]
	.BYTE	0			; VOID [124]
	.BYTE	0			; VOID [125]
	.BYTE	0			; VOID [126]
	.BYTE	0			; VOID [127]
	.BYTE	0			; VOID [128]
	.BYTE	0			; VOID [129]
	.BYTE	0			; VOID [130]
	.BYTE	0			; VOID [131]
	.BYTE	0			; VOID [132]
	.BYTE	0			; VOID [133]
	.BYTE	0			; VOID [134]
	.BYTE	0			; VOID [135]
	.BYTE	0			; VOID [136]
	.BYTE	0			; VOID [137]
	.BYTE	0			; VOID [138]
	.BYTE	0			; VOID [139]
	.BYTE	0			; VOID [140]
	.BYTE	0			; VOID [141]
	.BYTE	0			; VOID [142]
	.BYTE	0			; VOID [143]
	.BYTE	0			; VOID [144]
	.BYTE	0			; VOID [145]
	.BYTE	0			; VOID [146]
	.BYTE	0			; VOID [147]
	.BYTE	0			; VOID [148]
	.BYTE	0			; VOID [149]
	.BYTE	0			; VOID [150]
	.BYTE	0			; VOID [151]
	.BYTE	0			; VOID [152]
	.BYTE	0			; VOID [153]
	.BYTE	0			; VOID [154]
	.BYTE	0			; VOID [155]
	.BYTE	0			; VOID [156]
	.BYTE	0			; VOID [157]
	.BYTE	0			; VOID [158]
	.BYTE	0			; VOID [159]
	.BYTE	0			; VOID [160]
	.BYTE	0			; VOID [161]
	.BYTE	0			; VOID [162]
	.BYTE	0			; VOID [163]
	.BYTE	0			; VOID [164]
	.BYTE	0			; VOID [165]
	.BYTE	0			; VOID [166]
	.BYTE	0			; VOID [167]
	.BYTE	0			; VOID [168]
	.BYTE	0			; VOID [169]
	.BYTE	0			; VOID [170]
	.BYTE	0			; VOID [171]
	.BYTE	0			; VOID [172]
	.BYTE	0			; VOID [173]
	.BYTE	0			; VOID [174]
	.BYTE	0			; VOID [175]
	.BYTE	0			; VOID [176]
	.BYTE	0			; VOID [177]
	.BYTE	0			; VOID [178]
	.BYTE	0			; VOID [179]
	.BYTE	0			; VOID [180]
	.BYTE	0			; VOID [181]
	.BYTE	0			; VOID [182]
	.BYTE	0			; VOID [183]
	.BYTE	0			; VOID [184]
	.BYTE	0			; VOID [185]
	.BYTE	0			; VOID [186]
	.BYTE	0			; VOID [187]
	.BYTE	0			; VOID [188]
	.BYTE	0			; VOID [189]
	.BYTE	0			; VOID [190]
	.BYTE	0			; VOID [191]
	.BYTE	0			; VOID [192]
	.BYTE	0			; VOID [193]
	.BYTE	0			; VOID [194]
	.BYTE	0			; VOID [195]
	.BYTE	0			; VOID [196]
	.BYTE	0			; VOID [197]
	.BYTE	0			; VOID [198]
	.BYTE	0			; VOID [199]
	.BYTE	0			; VOID [200]
	.BYTE	0			; VOID [201]
	.BYTE	0			; VOID [202]
	.BYTE	0			; VOID [203]
	.BYTE	0			; VOID [204]
	.BYTE	0			; VOID [205]
	.BYTE	0			; VOID [206]
	.BYTE	0			; VOID [207]
	.BYTE	0			; VOID [208]
	.BYTE	0			; VOID [209]
	.BYTE	0			; VOID [210]
	.BYTE	0			; VOID [211]
	.BYTE	0			; VOID [212]
	.BYTE	0			; VOID [213]
	.BYTE	0			; VOID [214]
	.BYTE	0			; VOID [215]
	.BYTE	0			; VOID [216]
	.BYTE	0			; VOID [217]
	.BYTE	0			; VOID [218]
	.BYTE	0			; VOID [219]
	.BYTE	0			; VOID [220]
	.BYTE	0			; VOID [221]
	.BYTE	0			; VOID [222]
	.BYTE	0			; VOID [223]
	.BYTE	0			; VOID [224]
	.BYTE	0			; VOID [225]
	.BYTE	0			; VOID [226]
	.BYTE	0			; VOID [227]
	.BYTE	0			; VOID [228]
	.BYTE	0			; VOID [229]
	.BYTE	0			; VOID [230]
	.BYTE	0			; VOID [231]
	.BYTE	0			; VOID [232]
	.BYTE	0			; VOID [233]
	.BYTE	0			; VOID [234]
	.BYTE	0			; VOID [235]
	.BYTE	0			; VOID [236]
	.BYTE	0			; VOID [237]
	.BYTE	0			; VOID [238]
	.BYTE	0			; VOID [239]
	.BYTE	0			; VOID [240]
	.BYTE	0			; VOID [241]
	.BYTE	0			; VOID [242]
	.BYTE	0			; VOID [243]
	.BYTE	0			; VOID [244]
	.BYTE	0			; VOID [245]
	.BYTE	0			; VOID [246]
	.BYTE	0			; VOID [247]
	.BYTE	0			; VOID [248]
	.BYTE	0			; VOID [249]
	.BYTE	0			; VOID [250]
	.BYTE	0			; VOID [251]
	.BYTE	0			; VOID [252]
	.BYTE	0			; VOID [253]
	.BYTE	0			; VOID [254]
	.BYTE	0			; VOID [255]
	.BYTE	0			; VOID [256]
	.BYTE	0			; VOID [257]
	.BYTE	0			; VOID [258]
	.BYTE	0			; VOID [259]
	.BYTE	0			; VOID [260]
	.BYTE	0			; VOID [261]
	.BYTE	0			; VOID [262]
	.BYTE	0			; VOID [263]
	.BYTE	0			; VOID [264]
	.BYTE	0			; VOID [265]
	.BYTE	0			; VOID [266]
	.BYTE	0			; VOID [267]
	.BYTE	0			; VOID [268]
	.BYTE	0			; VOID [269]
	.BYTE	0			; VOID [270]
	.BYTE	0			; VOID [271]
	.BYTE	0			; VOID [272]
	.BYTE	0			; VOID [273]
	.BYTE	0			; VOID [274]
	.BYTE	0			; VOID [275]
	.BYTE	0			; VOID [276]
	.BYTE	0			; VOID [277]
	.BYTE	0			; VOID [278]
	.BYTE	0			; VOID [279]
	.BYTE	0			; VOID [280]
	.BYTE	0			; VOID [281]
	.BYTE	0			; VOID [282]
	.BYTE	0			; VOID [283]
	.BYTE	0			; VOID [284]
	.BYTE	0			; VOID [285]
	.BYTE	0			; VOID [286]
	.BYTE	0			; VOID [287]
	.BYTE	0			; VOID [288]
	.BYTE	0			; VOID [289]
	.BYTE	0			; VOID [290]
	.BYTE	0			; VOID [291]
	.BYTE	0			; VOID [292]
	.BYTE	0			; VOID [293]
	.BYTE	0			; VOID [294]
	.BYTE	0			; VOID [295]
	.BYTE	0			; VOID [296]
	.BYTE	0			; VOID [297]
	.BYTE	0			; VOID [298]
	.BYTE	0			; VOID [299]
	.BYTE	0			; VOID [300]
	.BYTE	0			; VOID [301]
	.BYTE	0			; VOID [302]
	.BYTE	0			; VOID [303]
	.BYTE	0			; VOID [304]
	.BYTE	0			; VOID [305]
	.BYTE	0			; VOID [306]
	.BYTE	0			; VOID [307]
	.BYTE	0			; VOID [308]
	.BYTE	0			; VOID [309]
	.BYTE	0			; VOID [310]
	.BYTE	0			; VOID [311]
	.BYTE	0			; VOID [312]
	.BYTE	0			; VOID [313]
	.BYTE	0			; VOID [314]
	.BYTE	0			; VOID [315]
	.BYTE	0			; VOID [316]
	.BYTE	0			; VOID [317]
	.BYTE	0			; VOID [318]
	.BYTE	0			; VOID [319]
	.BYTE	0			; VOID [320]
	.BYTE	0			; VOID [321]
	.BYTE	0			; VOID [322]
	.BYTE	0			; VOID [323]
	.BYTE	0			; VOID [324]
	.BYTE	0			; VOID [325]
	.BYTE	0			; VOID [326]
	.BYTE	0			; VOID [327]
	.BYTE	0			; VOID [328]
	.BYTE	0			; VOID [329]
	.BYTE	0			; VOID [330]
	.BYTE	0			; VOID [331]
	.BYTE	0			; VOID [332]
	.BYTE	0			; VOID [333]
	.BYTE	0			; VOID [334]
	.BYTE	0			; VOID [335]
	.BYTE	0			; VOID [336]
	.BYTE	0			; VOID [337]
	.BYTE	0			; VOID [338]
	.BYTE	0			; VOID [339]
	.BYTE	0			; VOID [340]
	.BYTE	0			; VOID [341]
	.BYTE	0			; VOID [342]
	.BYTE	0			; VOID [343]
	.BYTE	0			; VOID [344]
	.BYTE	0			; VOID [345]
	.BYTE	0			; VOID [346]
	.BYTE	0			; VOID [347]
	.BYTE	0			; VOID [348]
	.BYTE	0			; VOID [349]
	.BYTE	0			; VOID [350]
	.BYTE	0			; VOID [351]
	.BYTE	0			; VOID [352]
	.BYTE	0			; VOID [353]
	.BYTE	0			; VOID [354]
	.BYTE	0			; VOID [355]
	.BYTE	0			; VOID [356]
	.BYTE	0			; VOID [357]
	.BYTE	0			; VOID [358]
	.BYTE	0			; VOID [359]
	.BYTE	0			; VOID [360]
	.BYTE	0			; VOID [361]
	.BYTE	0			; VOID [362]
	.BYTE	0			; VOID [363]
	.BYTE	0			; VOID [364]
	.BYTE	0			; VOID [365]
	.BYTE	0			; VOID [366]
	.BYTE	0			; VOID [367]
	.BYTE	0			; VOID [368]
	.BYTE	0			; VOID [369]
	.BYTE	0			; VOID [370]
	.BYTE	0			; VOID [371]
	.BYTE	0			; VOID [372]
	.BYTE	0			; VOID [373]
	.BYTE	0			; VOID [374]
	.BYTE	0			; VOID [375]
	.BYTE	0			; VOID [376]
	.BYTE	0			; VOID [377]
	.BYTE	0			; VOID [378]
	.BYTE	0			; VOID [379]
	.BYTE	0			; VOID [380]
	.BYTE	0			; VOID [381]
	.BYTE	0			; VOID [382]
	.BYTE	0			; VOID [383]
	.BYTE	0			; VOID [384]
	.BYTE	0			; VOID [385]
	.BYTE	0			; VOID [386]
	.BYTE	0			; VOID [387]
	.BYTE	0			; VOID [388]
	.BYTE	0			; VOID [389]
	.BYTE	0			; VOID [390]
	.BYTE	0			; VOID [391]
	.BYTE	0			; VOID [392]
	.BYTE	0			; VOID [393]
	.BYTE	0			; VOID [394]
	.BYTE	0			; VOID [395]
	.BYTE	0			; VOID [396]
	.BYTE	0			; VOID [397]
	.BYTE	0			; VOID [398]
	.BYTE	0			; VOID [399]
Ctos_3:			; 
	.WORD	0
	.WORD	0
	.WORD	Cmain_3			; & main_3
Ctop_3:			; 
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Task' (4000000)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
Ctask_3:			; 
	.WORD	Ctask_idle			; & task_idle
	.WORD	Ctos_3
	.BYTE	0
	.BYTE	30
	.WORD	Cstr_130
	.WORD	Cstack_3			; & stack_3
	.WORD	Ctop_3			; & top_3
	.BYTE	0			; VOID sema_ret
	.BYTE	0			; VOID saved_priority
	.WORD	0			; VOID waiting_for
	.WORD	0			; VOID next_waiting_task
	.WORD	0			; VOID sleep_count
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Task' (4000000)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
Ctask_2:			; 
	.WORD	Ctask_3			; & task_3
	.WORD	Ctos_2
	.BYTE	0
	.BYTE	40
	.WORD	Cstr_131
	.WORD	Cstack_2			; & stack_2
	.WORD	Ctop_2			; & top_2
	.BYTE	0			; VOID sema_ret
	.BYTE	0			; VOID saved_priority
	.WORD	0			; VOID waiting_for
	.WORD	0			; VOID next_waiting_task
	.WORD	0			; VOID sleep_count
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Task' (4000000)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
Ctask_1:			; 
	.WORD	Ctask_2			; & task_2
	.WORD	Ctos_1
	.BYTE	0
	.BYTE	50
	.WORD	Cstr_132
	.WORD	Cstack_1			; & stack_1
	.WORD	Ctop_1			; & top_1
	.BYTE	0			; VOID sema_ret
	.BYTE	0			; VOID saved_priority
	.WORD	0			; VOID waiting_for
	.WORD	0			; VOID next_waiting_task
	.WORD	0			; VOID sleep_count
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Task' (4000000)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
Ctask_idle:			; 
	.WORD	Ctask_1			; & task_1
	.WORD	0
	.BYTE	0
	.BYTE	0
	.WORD	Cstr_133
	.WORD	40832
	.WORD	40960
	.BYTE	0			; VOID sema_ret
	.BYTE	0			; VOID saved_priority
	.WORD	0			; VOID waiting_for
	.WORD	0			; VOID next_waiting_task
	.WORD	0			; VOID sleep_count
;;; } 0 Declaration
;;; ------------------------------------;
;;; { 0 Declaration
;;;   { 1 TypeSpecifier (struct/union)
;;;     spec = 'Task' (4000000)
;;;     name = Task
;;;   } 1 TypeSpecifier (struct/union)
Ccurrent_task:			; 
	.WORD	Ctask_idle			; & task_idle
;;; } 0 Declaration
;;; ------------------------------------;
Cstr_0:				;
	.BYTE	0x72			;
	.BYTE	0x78			;
	.BYTE	0x5F			;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x61			;
	.BYTE	0x70			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0			;
Cstr_1:				;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x32			;
	.BYTE	0x20			;
	.BYTE	0x63			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x74			;
	.BYTE	0x72			;
	.BYTE	0x6F			;
	.BYTE	0x6C			;
	.BYTE	0			;
Cstr_2:				;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x33			;
	.BYTE	0x20			;
	.BYTE	0x63			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x74			;
	.BYTE	0x72			;
	.BYTE	0x6F			;
	.BYTE	0x6C			;
	.BYTE	0			;
Cstr_3:				;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x72			;
	.BYTE	0x69			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x20			;
	.BYTE	0x6F			;
	.BYTE	0x75			;
	.BYTE	0x74			;
	.BYTE	0			;
Cstr_4:				;
	.BYTE	0x74			;
	.BYTE	0x78			;
	.BYTE	0x5F			;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x61			;
	.BYTE	0x70			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0			;
Cstr_36:				;
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
Cstr_37:				;
	.BYTE	0x30			;
	.BYTE	0x58			;
	.BYTE	0			;
Cstr_38:				;
	.BYTE	0			;
Cstr_39:				;
	.BYTE	0			;
Cstr_40:				;
	.BYTE	0			;
Cstr_41:				;
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
Cstr_42:				;
	.BYTE	0x30			;
	.BYTE	0x78			;
	.BYTE	0			;
Cstr_44:				;
	.BYTE	0x25			;
	.BYTE	0x2D			;
	.BYTE	0x32			;
	.BYTE	0x30			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_45:				;
	.BYTE	0x25			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x3E			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_46:				;
	.BYTE	0x30			;
	.BYTE	0			;
Cstr_47:				;
	.BYTE	0x6E			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x65			;
	.BYTE	0x2E			;
	.BYTE	0			;
Cstr_48:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_49:				;
	.BYTE	0x4C			;
	.BYTE	0x6F			;
	.BYTE	0x61			;
	.BYTE	0x64			;
	.BYTE	0x69			;
	.BYTE	0x6E			;
	.BYTE	0x67			;
	.BYTE	0x20			;
	.BYTE	0x69			;
	.BYTE	0x6D			;
	.BYTE	0x61			;
	.BYTE	0x67			;
	.BYTE	0x65			;
	.BYTE	0x2E			;
	.BYTE	0x2E			;
	.BYTE	0x2E			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_55:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x53			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x61			;
	.BYTE	0x70			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x43			;
	.BYTE	0x6F			;
	.BYTE	0x75			;
	.BYTE	0x6E			;
	.BYTE	0x74			;
	.BYTE	0x20			;
	.BYTE	0x57			;
	.BYTE	0x61			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x69			;
	.BYTE	0x6E			;
	.BYTE	0x67			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_56:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_57:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_58:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x53			;
	.BYTE	0x65			;
	.BYTE	0x72			;
	.BYTE	0x69			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x20			;
	.BYTE	0x4F			;
	.BYTE	0x76			;
	.BYTE	0x65			;
	.BYTE	0x72			;
	.BYTE	0x66			;
	.BYTE	0x6C			;
	.BYTE	0x6F			;
	.BYTE	0x77			;
	.BYTE	0x73			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x75			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_59:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x54			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x6E			;
	.BYTE	0x61			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x50			;
	.BYTE	0x72			;
	.BYTE	0x69			;
	.BYTE	0x6F			;
	.BYTE	0x20			;
	.BYTE	0x53			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x63			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x53			;
	.BYTE	0x69			;
	.BYTE	0x7A			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x55			;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x4E			;
	.BYTE	0x65			;
	.BYTE	0x78			;
	.BYTE	0x74			;
	.BYTE	0x20			;
	.BYTE	0x77			;
	.BYTE	0x61			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x69			;
	.BYTE	0x6E			;
	.BYTE	0x67			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x53			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x74			;
	.BYTE	0x75			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_60:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_61:				;
	.BYTE	0x25			;
	.BYTE	0x2D			;
	.BYTE	0x31			;
	.BYTE	0x36			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x58			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x35			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x35			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_62:				;
	.BYTE	0x25			;
	.BYTE	0x2D			;
	.BYTE	0x31			;
	.BYTE	0x36			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_63:				;
	.BYTE	0x6E			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x65			;
	.BYTE	0x2E			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_64:				;
	.BYTE	0x52			;
	.BYTE	0x55			;
	.BYTE	0x4E			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_65:				;
	.BYTE	0x53			;
	.BYTE	0x55			;
	.BYTE	0x53			;
	.BYTE	0x50			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_66:				;
	.BYTE	0x53			;
	.BYTE	0x4C			;
	.BYTE	0x45			;
	.BYTE	0x45			;
	.BYTE	0x50			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x6D			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_67:				;
	.BYTE	0x42			;
	.BYTE	0x4C			;
	.BYTE	0x4B			;
	.BYTE	0x44			;
	.BYTE	0x20			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_68:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_69:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_70:				;
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
Cstr_71:				;
	.BYTE	0x25			;
	.BYTE	0x34			;
	.BYTE	0x2E			;
	.BYTE	0x34			;
	.BYTE	0x58			;
	.BYTE	0x3A			;
	.BYTE	0			;
Cstr_72:				;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x32			;
	.BYTE	0x2E			;
	.BYTE	0x32			;
	.BYTE	0x58			;
	.BYTE	0			;
Cstr_73:				;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_74:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_78:				;
	.BYTE	0x52			;
	.BYTE	0x45			;
	.BYTE	0x41			;
	.BYTE	0x44			;
	.BYTE	0x59			;
	.BYTE	0x0D			;
	.BYTE	0			;
Cstr_79:				;
	.BYTE	0x25			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x62			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x2E			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_80:				;
	.BYTE	0x54			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x32			;
	.BYTE	0x20			;
	.BYTE	0x6B			;
	.BYTE	0x69			;
	.BYTE	0x63			;
	.BYTE	0x6B			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_81:				;
	.BYTE	0x54			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x33			;
	.BYTE	0x20			;
	.BYTE	0x65			;
	.BYTE	0x6E			;
	.BYTE	0x61			;
	.BYTE	0x62			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x66			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x20			;
	.BYTE	0x31			;
	.BYTE	0x30			;
	.BYTE	0x30			;
	.BYTE	0x20			;
	.BYTE	0x6D			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_86:				;
	.BYTE	0x64			;
	.BYTE	0x65			;
	.BYTE	0x73			;
	.BYTE	0x63			;
	.BYTE	0x68			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x75			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x6F			;
	.BYTE	0x6F			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x43			;
	.BYTE	0x4C			;
	.BYTE	0x4B			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0x3D			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x75			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_87:				;
	.BYTE	0x44			;
	.BYTE	0x69			;
	.BYTE	0x73			;
	.BYTE	0x70			;
	.BYTE	0x6C			;
	.BYTE	0x61			;
	.BYTE	0x79			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_88:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_89:				;
	.BYTE	0x4C			;
	.BYTE	0x45			;
	.BYTE	0x44			;
	.BYTE	0x73			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_91:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_92:				;
	.BYTE	0x4D			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x79			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_93:				;
	.BYTE	0x20			;
	.BYTE	0x56			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x75			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_94:				;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_95:				;
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
Cstr_97:				;
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
Cstr_99:				;
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
Cstr_102:				;
	.BYTE	0x48			;
	.BYTE	0x65			;
	.BYTE	0x6C			;
	.BYTE	0x70			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x32			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x6B			;
	.BYTE	0x69			;
	.BYTE	0x63			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x32			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x33			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x6B			;
	.BYTE	0x69			;
	.BYTE	0x63			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x33			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x49			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x6C			;
	.BYTE	0x6F			;
	.BYTE	0x61			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x69			;
	.BYTE	0x6D			;
	.BYTE	0x61			;
	.BYTE	0x67			;
	.BYTE	0x65			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x53			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x77			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x61			;
	.BYTE	0x70			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x54			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x68			;
	.BYTE	0x6F			;
	.BYTE	0x77			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x62			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x75			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0x73			;
	.BYTE	0x77			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x63			;
	.BYTE	0x68			;
	.BYTE	0x20			;
	.BYTE	0x28			;
	.BYTE	0x64			;
	.BYTE	0x65			;
	.BYTE	0x73			;
	.BYTE	0x63			;
	.BYTE	0x68			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x75			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x29			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x63			;
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
	.BYTE	0x64			;
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
	.BYTE	0x65			;
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
	.BYTE	0x6D			;
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
	.BYTE	0x73			;
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
	.BYTE	0x74			;
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
	.BYTE	0x48			;
	.BYTE	0x20			;
	.BYTE	0x2D			;
	.BYTE	0x20			;
	.BYTE	0x48			;
	.BYTE	0x41			;
	.BYTE	0x4C			;
	.BYTE	0x54			;
	.BYTE	0x20			;
	.BYTE	0x28			;
	.BYTE	0x66			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x76			;
	.BYTE	0x65			;
	.BYTE	0x72			;
	.BYTE	0x29			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_117:				;
	.BYTE	0x4D			;
	.BYTE	0x65			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x75			;
	.BYTE	0x72			;
	.BYTE	0x69			;
	.BYTE	0x6E			;
	.BYTE	0x67			;
	.BYTE	0x2E			;
	.BYTE	0x2E			;
	.BYTE	0x2E			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_126:				;
	.BYTE	0x74			;
	.BYTE	0x6F			;
	.BYTE	0x74			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x63			;
	.BYTE	0x79			;
	.BYTE	0x63			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_127:				;
	.BYTE	0x68			;
	.BYTE	0x61			;
	.BYTE	0x6C			;
	.BYTE	0x74			;
	.BYTE	0x65			;
	.BYTE	0x64			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x63			;
	.BYTE	0x79			;
	.BYTE	0x63			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x73			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_128:				;
	.BYTE	0x69			;
	.BYTE	0x64			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x25			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_129:				;
	.BYTE	0x6C			;
	.BYTE	0x6F			;
	.BYTE	0x61			;
	.BYTE	0x64			;
	.BYTE	0x3A			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x25			;
	.BYTE	0x25			;
	.BYTE	0x0D			;
	.BYTE	0x0A			;
	.BYTE	0			;
Cstr_130:				;
	.BYTE	0x4C			;
	.BYTE	0x6F			;
	.BYTE	0x61			;
	.BYTE	0x64			;
	.BYTE	0x20			;
	.BYTE	0x54			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0x20			;
	.BYTE	0			;
Cstr_131:				;
	.BYTE	0x4D			;
	.BYTE	0x65			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x75			;
	.BYTE	0x72			;
	.BYTE	0x65			;
	.BYTE	0x6D			;
	.BYTE	0x65			;
	.BYTE	0x6E			;
	.BYTE	0x74			;
	.BYTE	0			;
Cstr_132:				;
	.BYTE	0x4D			;
	.BYTE	0x6F			;
	.BYTE	0x6E			;
	.BYTE	0x69			;
	.BYTE	0x74			;
	.BYTE	0x6F			;
	.BYTE	0x72			;
	.BYTE	0			;
Cstr_133:				;
	.BYTE	0x49			;
	.BYTE	0x64			;
	.BYTE	0x6C			;
	.BYTE	0x65			;
	.BYTE	0x20			;
	.BYTE	0x54			;
	.BYTE	0x61			;
	.BYTE	0x73			;
	.BYTE	0x6B			;
	.BYTE	0			;
Cend_text:				;
