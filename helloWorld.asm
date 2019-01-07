section .data

msg db 'Hello World',0xa

section .txt

global _start

_start:
	mov eax, 4	;specifying write to call by using code 4
	mov ebx, 1	;specifying file handle i.e, 1
	mov ecx, msg	;specifying address of string to print
	mov edx, 12	;specifying length of string i.e, 12
	int 0x80	;calling system
			
	mov eax,1	;specifying system call exit
	mov ebx,0	;giving return code
	int 0x80	;calling system
