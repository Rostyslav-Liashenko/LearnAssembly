%macro	pcall	1-*
 %rep	%0 - 1
  %rotate -1
 	push dword %1
 %endrep
 %rotate -1
	call %1
	add  esp, (%0 - 1) * 4
%endmacro	
