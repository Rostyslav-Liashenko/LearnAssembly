global	strlen

section	.text
strlen:		; arg1 == address of the string
	push ebp
	mov ebp, esp
	xor eax, eax
	mov ecx, [ebp+8]	; arg1
.lp:	cmp byte [eax+ecx], 0
	jz .quit
	inc eax
	jmp short .lp
.quit:	pop ebp
	ret 
