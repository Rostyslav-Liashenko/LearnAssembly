
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


section	.bss
buffer	resb	4096
bufsize	equ	$-buffer

argc	resd	1
argvp	resd	1

fdsrc	resd	1
fddest	resd	1

section	.data
helpmsg	db	'Usage: copy <src> <dest>', 10
helplen	equ	$-helpmsg
err1msg	db	"Couldn't open source file for reading", 10
err1len	equ	$-err1msg
err2msg	db	"Couldn't open destination file for writing", 10
err2len	equ	$-err1msg

section	.text
global	_start
_start:
	pop dword [argc]
	mov [argvp], esp
	cmp dword [argc], 3
	je .args_count_ok
	kernel 4, 2, helpmsg, helplen
	kernel 1, 1
.args_count_ok:
	; open the source file
	mov esi, [argvp]
	mov edi, [esi+4]
	kernel	5, edi, 0 ; O_RDONLY
	cmp eax, -1
	jne .source_open_ok
	kernel 4, 2, err1msg, err1len
	kernel 1, 2
.source_open_ok:
	mov [fdsrc], eax
	; now open the destination
	mov esi, [argvp]
	mov edi, [esi+8]
	kernel 5, edi, openwr_flags, 0666o
	cmp eax, -1
	jne .dest_open_ok
	kernel 4, 2, err2msg, err2len
	kernel 1, 3
.dest_open_ok:
	mov [fddest], eax


again:
	kernel 3, [fdsrc], buffer, bufsize
	cmp eax, 0
	jle .end_of_file
	kernel 4, [fddest], buffer, eax
	jmp again

.end_of_file:
	kernel 6, [fdsrc]
	kernel 6, [fddest]
	kernel 1, 0
