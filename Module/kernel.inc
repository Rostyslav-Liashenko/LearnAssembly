%macro	kernel 1-*

%ifdef OS_FREEBSD

  %rep %0
    %rotate -1
	  	push dword %1
  %endrep
		mov eax, [esp]
		int 80h
		jnc %%ok
		mov ecx, eax
		mov eax, -1
		jmp short %%q
  %%ok:
		xor ecx, ecx
  %%q:
		add esp, (%0-1)*4

%elifdef OS_LINUX

  %if %0 > 1
		push ebx
    %if %0 > 4
		push esi
		push edi
    %endif
  %endif

  %rep %0
    %rotate -1
  		push dword %1
  %endrep

		pop eax
  %if %0 > 1
		pop ebx
    %if %0 > 2
		pop ecx
      %if %0 > 3
		pop edx
        %if %0 > 4
		pop esi
          %if %0 > 5
		pop edi
            %if %0 > 6
              %error "Can't handle Linux syscalls for more than 5 params"
            %endif
          %endif
        %endif
      %endif
    %endif
  %endif
		int 80h
		mov ecx, eax
		and ecx, 0fffff000h
		cmp ecx, 0fffff000h
		jne %%ok
		mov ecx, eax
		neg ecx
		mov eax, -1
		jmp short %%q
  %%ok:		xor ecx, ecx
  %%q:

  %if %0 > 1
    %if %0 > 4
		pop edi
		pop esi
    %endif
		pop ebx
  %endif

%else
%error Please define either OS_LINUX or OS_FREEBSD
%endif

%endmacro


%ifdef OS_FREEBSD
openwr_flags	equ 601h
%else
openwr_flags	equ 241h
%endif
