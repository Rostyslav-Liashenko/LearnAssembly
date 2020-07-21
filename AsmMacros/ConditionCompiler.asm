%include "stud_io.inc"
%define DEBUG_PRINT
global _start

_start:
%ifdef	DEBUG_PRINT
	PRINT 	"Entering suspicious section"
	PUTCHAR	10
%endif
; some code
; some code
%ifdef DEBUG_PRINT
	PRINT 	"Leaving suspicious section"
	PUTCHAR	10
%endif
	FINISH
