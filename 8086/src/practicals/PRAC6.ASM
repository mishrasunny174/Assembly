.model small

.data
enteras db 0ah,'Enter a ascii character: $'
enterbs db 0ah,'Enter a binary string: $'
outa db 0ah,'Ascii value is: $'
outb db 0ah,'Binary string is: $'

.stack 1000h

.code
prints proc stdcall uses dx
        arg @@str:word
        mov dx, [@@str]
        mov ah, 09h
        int 21h
        ret
prints endp

start:
        mov ax, @data
        mov ds, ax
        mov es, ax

        lea ax, enteras
        push ax
        call prints
        xor ax, ax
        mov ah, 01h
        int 21h
        xor bx, bx
        mov bl, al
        lea ax, outb
        push ax
        call prints
        mov cx, 8
again1:
        xor bh, bh
        shl bx, 1
        mov dl, bh
        add dl, 30h
        mov ah, 02h
        int 21h
        loop again1

        lea ax, enterbs
        push ax
        call prints
        mov cx, 8
        xor bx, bx
again2:
        xor ax, ax
        shl bx, 1
        mov ah, 01h
        int 21h
        mov dl, al
        and dl, 0fh
        or bl, dl
        loop again2
        lea ax, outa
        push ax
        call prints
        mov dl, bl
        mov ah, 02h
        int 21h
        mov ah, 4ch
        int 21h
end start
