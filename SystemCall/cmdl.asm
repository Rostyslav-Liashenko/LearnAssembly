global		_start

section		.text

nlstr		db	10, 0

strlen:
	push	ebp
	mov	ebp, esp
	xor	eax, eax
	mov	ecx, [ebp+8]
.lp:	cmp	byte [eax+ecx], 0
	jz	.quit
	inc	eax
	jmp	short .lp
.quit:	pop	ebp
	ret

print_str:
	push	ebp
	mov	ebp, esp
	push	ebx
	mov 	ebx, [ebp+8]
	push	ebx
	call	strlen
	add	esp, 4
%ifdef OS_FREEBSD
	push	eax
	push	ebx
	push	dword 1
	mov	eax, 4
	push	eax
	int	80h
	add	esp, 16
%elifdef OS_LINUX
	mov	edx, eax
	mov	ecx, ebx
	mov	ebx, 1
	mov	eax, 4
	int 	80h
%else
%error please define either OS_FREEBSD or OS_LINUX
%endif
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
_start:
	mov	ebx, [esp]
	mov	esi, esp
	add	esi, 4
again:	push 	dword [esi]
	call	print_str
	add	esp, 4
	add	esi, 4
	dec	ebx
	jnz	again

%ifdef OS_FREEBSD
	push	dword 0
	mov	eax, 1
	push	eax
	int 	80h
%else
	mov	ebx, 0
	mov	eax, 1
	int 	80h
%endif
