%include "stud_io.inc"
global _start

_start:		PRINT 	"Hello"
		PUTCHAR 10
note:		PRINT 	"Note"
		PUTCHAR 10
		PRINT 	"Cool"
		PUTCHAR 10
		jmp	 note
		FINISH
