section .data

greet:	db	'Hello, World!',0xa 	;storing data to write
length: equ	$ - greet		;calculating address by substraction current position($) - greet	
section .text				

global _start

_start:
	mov 	rax, 0x1		;moving write syscall number to rax
	mov	rdi, 0x1		;moving 1(STDOUT) to rdi i,e file descriptor
	mov	rsi, greet		;moving string to print to rsi
	mov	rdx, length		;moving length of data to print to rdx
	syscall				;calling system
	mov	rax, 0x3c		;moving exit syscall number to rax
	mov	rdi, 0x0		;moving exit code to rdi
	syscall				;calling system
