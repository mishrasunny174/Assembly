section	.data

lol	db	"Bye!",0xa


section	.text
global _start

_start:
	mov	eax, 2 	;loading fork syscall number in eax
	int 	0x80	;calling system
	cmp	eax, 0	;testing if fork returned value > 0 or not
	jne	_child	
	mov	eax, 4	;loading write syscall
	mov	ebx, 1	;loading fd
	mov	ecx, lol;loading buffer
	mov	edx, 5	;loading size of buffer
	mov	eax, 1	;loading exit syscall
	mov	ebx, 0	;loading exit value
	int 	0x80	;calling system
_child:
	mov	eax, 2	;loading fork syscall number
	int	0x80	;calling system
	jmp	_child	;going in loop
