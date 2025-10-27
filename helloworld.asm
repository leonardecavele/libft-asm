global _start
extern putstr
extern strlen
extern itoa

segment	.data
hw db "Hello world", 10, 0
end:

segment .text
_start:
	mov rdi, hw
	call strlen
	call putstr
	mov rdi, rax
	call itoa
	mov rdi, rax
	call putstr
	mov rax, 60
	mov	rdi, 0
	syscall
