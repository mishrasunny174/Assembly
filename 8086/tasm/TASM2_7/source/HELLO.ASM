.model small

.STACK

.DATA
hello db 'Hello, World',00ah,'$'

.CODE
mov ax, @data
mov ds, ax
mov ah, 09h
mov dx, OFFSET hello
int 21h
mov ah, 4ch
int 21h
end