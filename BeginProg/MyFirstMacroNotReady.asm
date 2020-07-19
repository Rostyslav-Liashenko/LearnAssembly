%macro pcall1 2 ; 2 - count param
	push 	%2
	call 	%1
	add	esp, 4
%endmacro
