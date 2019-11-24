.model small

.data
num1 dd 55667788h
num2 dd 11223344h
res  dq 0

.stack 1000h

.code
start:
        mov ax, @data
        mov ds, ax
        mov es, ax

        mov al, byte ptr num1
        sub al, byte ptr num2
        mov byte ptr res, al
        mov al, byte ptr num1+1
        sbb al, byte ptr num2+1
        mov byte ptr res+1, al
        mov al, byte ptr num1+2
        sbb al, byte ptr num2+2
        mov byte ptr res+2, al
        mov al, byte ptr num1+3
        sbb al, byte ptr num2+3
        mov byte ptr res+3, al
        xor ax,ax
        sbb ax,0
        mov byte ptr res+4, al
        mov ah, 3ch
        int 21h
end start
