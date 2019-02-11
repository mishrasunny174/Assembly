section .data
lol	db	"No!",0xa

section	.text

global	_start

_start:
	mov	eax, 48		;loading signal call number
	mov	ebx, 2		;loading signal number
	mov	ecx, _fake	;loading address of signal call handler
	int	0x80		;calling system
loop:
	jmp	loop		;looping infinitely

_fake:
	push	ebp
	mov	ebp, esp
	mov	eax, 4		;loading write syscall number
	mov	ebx, 1		;loading fd
	mov	ecx, lol	;loading buf address
	mov	edx, 4		;loading size of buffer
	int	0x80		;calling system
	pop	ebp
	ret	
