.model small

.data
num1 dd 11223344h
num2 dd 55667788h
res dq 0h

.stack 1000h

.code
start:
        mov ax, @data
        mov ds, ax
        mov es, ax

        mov ax, word ptr num1
        mul word ptr num2
        mov word ptr res, ax
        mov bx, dx
        mov ax, word ptr num1+2
        mul word ptr num2
        add bx, ax
        adc dx, 0
        mov cx, dx
        mov ax, word ptr num1
        mul word ptr num2+2
        add bx ,ax
        mov word ptr res+2, bx
        adc cx, dx
        mov ax, word ptr num1+2
        mul word ptr num2+2
        add cx, ax
        adc dx, 0
        mov word ptr res+4, cx
        mov word ptr res+6, dx
        mov ah, 4ch
        int 21h
end start


