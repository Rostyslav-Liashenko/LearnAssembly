%macro zeromem 2 ;
	push	ecx
	push	esi
	push	dword	%2
	push	dword	%1
	pop	esi
	pop	ecx
%%lp:	mov	byte	[esi], 0
	inc 	esi
	loop	%%lp
	pop	esi
	pop	ecx
%endmacro 
