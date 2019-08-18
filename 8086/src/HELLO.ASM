.model small

.stack 100h

.data
hello db 'hello, world',0ah,'$'

.code
start:
mov ax, @data ;setting up ds segment
mov ds, ax    ;setting up es segment
mov es, ax
mov ah, 09h
mov dx, offset hello
int 21h
.exit
end start
