section  .data

msg: 		db	'Hello, world!',0xa
length: 	equ	$-msg
section  .text

global  _start

_start:
	mov rbx, 0x10   ;initializing counter to 10
begin:  mov rax, 0x1    ;write syscall number
	mov rdi, 0x1 	;fd to write
	mov rsi, msg 	;msg to write
	mov rdx, length ;length of message to write
	syscall 	;calling system
	dec rbx   	;dec counter
	jnz begin       ;jump if not zero flag set
	mov rax, 0x3c   ;exit syscall number
	mov rdi, 0x0    ;exit status
	syscall 	;syscall
