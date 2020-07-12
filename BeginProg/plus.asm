%include "stud_io.inc"
global _start

section .text
_start:	PRINT	"Hello"
	PUTCHAR	10
	mov	eax, 10
	mov 	ebx, 20
	add	eax, ebx
	PRINT 	"End"
	PUTCHAR 10
	FINISH

