global _start

%include "putstr.asm"
%include "strlen.asm"
%include "itoa.asm"

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
