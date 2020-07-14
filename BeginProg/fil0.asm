;stosb записывают в память по адресу [edi]
;fill 0 array buf
%include "stud_io.inc"
global _start

section .bss
buf	resb	1024

section .text
_start:	xor	al, al
	mov 	edi, buf
	mov	ecx, 1024
	cld
lp:	stosb
	loop lp
