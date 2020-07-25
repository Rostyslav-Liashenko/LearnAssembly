global _start

section .data
msg	db	"Hello world", 10
msg_len equ	$-msg

section .text
_start:	mov	eax, 4
	mov	ebx, 1
	mov	ecx, msg
	mov	edx, msg_len
	int	80h
	mov	eax, 1
	mov 	ebx, 0
	int 	80h

