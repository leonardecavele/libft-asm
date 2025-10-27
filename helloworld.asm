global _start
extern putstr
extern strlen
extern itoa

segment	.data
hw db "Hello world", 10, 0

segment .text
_start:
	mov rdi, hw	
	call putstr		; hw

	mov rdi, hw
	call strlen

	mov rdi, rax
	call itoa

	mov rdi, rax
	call putstr		; len of 'hw'

	mov rdi, -2147483648 
	call itoa

	mov rdi, rax
	call putstr		; upper number

	mov rax, 60
	mov	rdi, 0
	syscall
