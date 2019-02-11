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

; shellcode '\x48\x31\xc0\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\xb0\x01\x48\xff\xc7\xeb\x0f\x48\x8b\x34\x24\xb2\x08\x0f\x05\xb0\x3c\x48\x31\xff\x0f\x05\xe8\xec\xff\xff\xff\x6f\x77\x6e\x65\x64\x21\x21\x0a'
; length = 47 bytes