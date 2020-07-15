%include "stud_io.inc"

global _start

section .text
_start:	
		PRINT	"Hello"
		PUTCHAR 10
		mov	eax, 20
		push	eax
		mov 	eax, 40
		pop	eax
		PRINT 	"END"
		PUTCHAR	10
		FINISH
