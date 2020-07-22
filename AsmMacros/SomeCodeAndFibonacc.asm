%assign	n	50
%rep	100
	db	n
 %assign n	n+1
%endrep
;fil some memmory 50, 51, 52, 53....
fibonacci
%assign i	1
%assign j	1
%rep	100000
 %if j > 100000
    %exitrep
 %endif


	dd	j
%assign	k	j+i
%assign	i	j
%assign	j	k
%endrep
fib_count	equ ($-fibonacci)/4
