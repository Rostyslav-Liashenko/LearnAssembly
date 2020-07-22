%include "stud_io.inc"
global _start

section .bss
array	resw	128

section .text
_start:
%assign	a	0
%rep	128
		inc word [array + a]
%assign	a	a+2
%endrep
FINISH
