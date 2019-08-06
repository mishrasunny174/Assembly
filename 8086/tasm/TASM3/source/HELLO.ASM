.model small

.stack

.data
hello db 'Hello, World',00ah,'$'

assume ds: @data

.code
mov ax, @data
mov ds, ax
mov ah, 09h
mov dx, offset hello
int 21h
mov ah, 4ch
int 21h
end
