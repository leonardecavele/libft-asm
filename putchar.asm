global putchar

segment .text
putchar:
	sub rsp, 8
	mov [rsp], dil
	mov rsi, rsp
	mov rax, 1
	mov rdi, 1
	mov rdx, 1
	syscall
	add rsp, 8
	ret
