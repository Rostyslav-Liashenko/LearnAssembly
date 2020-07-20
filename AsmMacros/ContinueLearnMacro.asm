; lazy method
%define	 thenumber	25
%define	 mkvar		dd thenumber
; example var1 	mkvar = var1 dd thenumber = var1 dd 25
%define  thenumber	36
; example var2 mkvar = var2 dd thenumber = var2 dd 36
; total var1 = 25, var2 = 36
; energy method
%define	 	thenumber	25
%xdefine	mkvar		dd thenumber
var1		mkvar
%define		thenumber	36
var2		mkvar
; total  var1 = 25, var2 = 25;
