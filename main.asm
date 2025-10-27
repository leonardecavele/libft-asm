global _start
extern putstr
extern strlen
extern itoa
extern putchar

segment	.data
hw db "Hello world", 10, 0

segment .text
_start:
	mov rdi, hw	
	call putstr

	mov rdi, hw
	call strlen
	mov rdi, rax
	call itoa
	mov rdi, rax
	call putstr
	mov rdi, 10
	call putchar

	mov rdi, -2147483648 
	call itoa
	mov rdi, rax
	call putstr
	mov rdi, 10
	call putchar

	mov rdi, 60
	call putchar
	mov rdi, 10
	call putchar

	mov rax, 60
	mov	rdi, 0
	syscall
