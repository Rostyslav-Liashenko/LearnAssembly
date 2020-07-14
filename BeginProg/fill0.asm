; записать в AL,AX,EAX байт или слово или двойное слово в
; память по адресу [edi] stosb, stosw, stosd
; считать байт или слово или двойное слово [esi] в AL,AX,EAX
; lodsb, lodsw, lodsd
; fill 0 array buf

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
