global itoa

segment .text
itoa:
	mov rax, rdi	; quotient
	mov rsi, 1		; NULL
	cmp rax, 0
	jge .size_loop
	inc rsi			; minus
	neg rax
	.size_loop:
		inc rsi
		mov rcx, 10
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
	syscall			; mmap

	mov r10, rax	; save beginning pointer
	mov rsi, rax
	mov rax, rdi
	cmp rax, 0
	jge .itoa_loop
	mov byte [rsi], '-'
	inc rsi
	neg rax
	.itoa_loop:
		mov rcx, 10
		xor rdx, rdx
		div rcx
		add rdx, '0'
		mov byte [rsi], dl
		inc rsi
		cmp rax, 0
		jg .itoa_loop
	mov byte [rsi], 0
	mov rax, r10
	ret
