section 	.data
msg 		db 	"Hello, World!",0xa
length 		equ 	$-msg

section 	.text

global _start

nHelloWorld:
	push 	rbp
	mov 	rbp, rsp
	mov 	rcx, rdi
begin:	push rcx
	mov 	rax, 0x1
	mov 	rdi, 0x1
 	mov 	rsi, msg
	mov 	rdx, length
	syscall
	pop 	rcx
	loop 	begin
	leave
	ret

_start:
	mov 	rdi, 0x10
	call 	nHelloWorld
	mov 	rax, 0x3c
	mov 	rdi, 0x1
	syscall
	 
