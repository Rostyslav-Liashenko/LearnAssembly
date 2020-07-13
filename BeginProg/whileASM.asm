%include "stud_io.inc"
global _start

section .text
_start:		mov 	eax, 0
cycle:		PRINT 	"some text"
		PUTCHAR	10
		inc	eax
		cmp	eax, 10
		jne 	cycle
		FINISH

