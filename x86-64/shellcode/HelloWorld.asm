global _start

_start:
	xor	rax, rax
	xor	rdi, rdi
	xor	rsi, rsi
	xor	rdx, rdx
	;cleared all the registers
	
	mov	al,  0x1 		;moving write syscall number to rax
	inc	rdi			;moving 1(STDOUT) to rdi i,e file descriptor
	jmp	_owned
back:	mov	rsi, [rsp]		;moving string to print to rsi
	mov	dl,  0x8		;moving length of data to print to rdx
	syscall				;calling system
	mov	al,  0x3c		;moving exit syscall number to rax
	xor	rdi, rdi		;moving exit code to rdi
	syscall				;calling system
_owned:
	call	back
	db	'owned!!',0xa		;stored data to print
