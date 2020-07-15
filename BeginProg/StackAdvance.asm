%include "stud_io.inc"
global _start

section .text
_start:
	xor 	ebx, ebx
	xor 	ecx, ecx
lp:	mov	bl, [esi+ecx]
	cmp	bl, 0
	je	lpquit
	push	ebx
	inc	ecx
	jmp	lp
lpquit:	jecxz	done
	mov	edi, esi
lp2:	pop	ebx
	mov	[edi], bl
	inc	edi
	loop	lp2
done:
