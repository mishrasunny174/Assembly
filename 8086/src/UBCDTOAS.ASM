.model small

.stack 1000h

.data
num db 04,03,02,01
res db 4 dup(0),'$'

.code
main proc stdcall
        xor ax, ax
        mov si, 3
        mov di, 0
        mov cx, 4
begin:
        mov al, byte ptr[num+si]
        add al, 30h
        mov byte ptr[res+di], al
        inc di
        dec si
        loop begin
        mov ah, 09h
        lea dx, res
        int 21h
        mov al, 0
        ret
main endp

start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        call main
        mov ah, 4ch
        int 21h
end start
