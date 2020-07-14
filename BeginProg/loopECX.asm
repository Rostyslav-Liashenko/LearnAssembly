%include "stud_io.inc"

global _start

section .bss
array		resd	1000

section .text
_start:		mov	ecx, 1000
		mov	esi, array
		mov 	eax, 0
lp:		add	eax, [esi]
		add	esi, 4 ;адрес следующего элемента
		loop	lp
		PRINT 	"END"
		PUTCHAR 10
		FINISH

