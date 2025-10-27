global itoa

segment .text
itoa:
	push rbx
	mov rbx, rdi		; save n
	mov rax, rbx		; quotient
	mov rcx, 10
	mov rsi, 2			; NULL
	cmp rax, 0
	jge .size_loop
	inc rsi				; minus
	neg rax
	.size_loop:
		inc rsi
		xor rdx, rdx
		div rcx
		cmp rax, 0
		jg .size_loop	; size in rsi

	mov rax, 9
	xor rdi, rdi
	mov rdx, 3
	mov r10, 0x22
	mov r8, -1
	xor r9, r9
	syscall				; mmap

	mov r9, rax			; save beginning pointer
	mov r10, rax
	add r10, rsi
	dec r10
	mov byte [r10], 0
	dec r10
	mov byte [r10], 10
	dec r10

	mov rax, rbx		; quotient
	mov rcx, 10
	cmp rax, 0
	jge .itoa_loop
	neg rax
	mov byte [r9], '-'
	.itoa_loop:
		xor rdx, rdx
		div rcx
		add dl, '0'
		mov byte [r10], dl
		dec r10
		cmp rax, 0
		jg .itoa_loop
	mov rax, r9
	pop rbx
	ret
