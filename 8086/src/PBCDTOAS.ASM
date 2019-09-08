; packed bcd to ascii
.model small

.stack 1000h

.data
num db 34h,12h
res db 4 dup(0), '$'

.code
main proc stdcall
        mov di, 3
        mov si, 0
        mov cx, 2
        xor ax, ax
begin:
        mov al, byte ptr[num+si]
        and al, 0fh
        add al, 30h
        mov byte ptr[res+di], al
        dec di
        mov al, byte ptr[num+si]
        and al, 0f0h
        shr al, 4
        add al, 30h
        mov byte ptr[res+di], al
        dec di
        inc si
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

