section .data

greet	db	'Hello, World!',0xa

section .text

global _start

_start:
	mov 	rax, 0x1
	mov	rdi, 0x1
	mov	rsi, greet
	mov	rdx, 14
	syscall
	mov	rax, 60
	mov	rdi, 0x1
	syscall	
