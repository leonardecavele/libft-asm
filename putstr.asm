global putstr

segment .text
putstr:
	mov rsi, rdi
	.loop:
		cmp byte [rsi], 0
		je .done
		mov rax, 1
		mov rdi, 1
		mov rdx, 1
		syscall
		inc rsi
		jmp .loop
	.done:
	ret
