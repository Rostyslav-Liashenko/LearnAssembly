%include "kernel.inc"
global	getstr

section .text
getstr:	   ; arg1 = address, arg2 = length
	push ebp
	mov ebp, esp
	xor ecx, ecx		; counter
	mov edx, [ebp+8]	; addr
.again:	inc ecx
	cmp ecx, [ebp+12]	;  <?> arg2
	jae .quit
	push ecx
	push edx
	kernel 3, 0, edx, 1
	pop edx
	pop ecx
	cmp eax, 1
        jne .quit
	mov al, [edx]
	cmp al, 10		; EOL
	je .quit
	inc edx
	jmp .again
.quit:	mov [edx], byte 0
	mov esp, ebp
	pop ebp
	ret
