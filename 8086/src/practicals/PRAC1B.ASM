.model small

.data
num1 dd 99998888h
num2 dw 1122h
numer dd 0
rem dw 0

.stack 1000h

.code

start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        mov ax, word ptr num1+2
        div word ptr num2
        mov word ptr numer+2, ax
        mov ax, word ptr num1
        div word ptr num2
        mov word ptr numer, ax
        mov word ptr rem, dx
        mov ah, 3ch
        int 21h
end start
