.model small

.data
num1 dd 11223344h
num2 dd 55667788h
res dq 0

.stack 1000h

.code
start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        mov al, byte ptr[num1]
        add al, byte ptr[num2]
        daa
        mov byte ptr res, al
        mov al, byte ptr[num1+1]
        adc al, byte ptr[num2+1]
        daa
        mov byte ptr res+1, al
        mov al, byte ptr num1+2
        adc al, byte ptr num2+2
        daa
        mov byte ptr res+2, al
        mov al, byte ptr[num1+3]
        adc al, byte ptr[num2+3]
        daa
        mov byte ptr res+3, al
        xor ax, ax
        adc al, 0
        daa
        mov byte ptr res+4, al
        mov ah, 4ch
        int 21h
end start
