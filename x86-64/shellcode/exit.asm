section 	.text
global 		_start
_start:
	mov 	al,  0x3c
	xor 	rdi, rdi
	syscall

; shellcode = '\xb0\x3c\x48\x31\xff\x0f\x05'
; length    =  7 bytes
