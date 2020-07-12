%include "stud_io.inc"

global _start

section	.bss
array	resb	256

section .text
_start:	mov	ecx, 256
	mov 	edi, array
	mov	al, '@'
again:	mov	[edi], al
	inc 	edi	
	dec	ecx
	jnz	again
	PRINT	'END'
	PUTCHAR	10
	FINISH
