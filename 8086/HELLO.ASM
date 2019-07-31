.model small

.stack

.data
hello db 'Hello, World',00ah,'$'

.code
.startup
mov ax, @data
mov ds, ax
mov ah, 09h
mov dx, OFFSET hello
int 21h
mov ah, 04ch
int 21h
end
