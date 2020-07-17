%include "stud_io.inc"

global _start


section .bss
my_array	resb	256

section .text

; fil memory (edi=address, ecx=length, al=value)
fill_memory:
		jecxz	fm_q
fm_lp:		mov	[edi], al
		inc	edi
		loop	fm_lp
fm_q:		ret
;main program
_start:
		mov	edi, my_array
		mov	ecx, 256
		mov	al, '@'
		call	fill_memory
		FINISH
