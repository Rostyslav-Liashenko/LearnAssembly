%include "stud_io.inc"
global _start

section .text
R_eq:	PRINT 		"Equal"
	PUTCHAR		10
	FINISH
R_b:	PRINT 		"below"
	PUTCHAR		10
	FINISH
R_a:	PRINT 		"above"
	PUTCHAR		10
	FINISH
_start: PRINT 		"Hello"
	PUTCHAR 	10
	mov		eax, 10
	mov 		ebx, 30
	cmp		eax, ebx
	je		R_eq
	jb		R_b
	ja		R_a	
