global	_start
extern	putstr
extern	getstr
extern	quit

section .data
nmq	db	'Hi, what is your name?', 10, 0
pmy	db	'Pleased to meet you, dear ', 0
exc	db	'!', 10, 0

section .bss
buf	resb	512
buflen	equ	$-buf

section .text
_start:
	push dword nmq
	call putstr
	add esp, 4

	push dword buflen
	push dword buf
	call getstr
	add esp, 8

	push dword pmy
	call putstr
	add esp, 4

	push dword buf
	call putstr
	add esp, 4

	push dword exc
	call putstr
	add esp, 4

	call quit
