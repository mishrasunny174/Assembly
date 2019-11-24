.model small

.data
array db 0,1,2,3,4,5,6,7,9
querys db 0ah,'Enter integer (0-9) to be searched for: $'
founds db 0ah,'Found$'
nfounds db 0ah,'Not Found$'
arrsize db 9
.stack 1000h

.code

prints proc stdcall
       arg @@str:WORD
       mov dx, [@@str]
       mov ah, 09h
       int 21h
       ret
prints endp

main proc stdcall
        local @@mid:byte, @@start:byte, @@end:byte, @@query:byte
        lea ax, querys
        push ax
        call prints
        mov ah, 01h
        int 21h
        and al, 0fh
        mov byte ptr[@@query], al
        mov byte ptr[@@start], 0
        mov al, byte ptr[arrsize]
        sub al, 1
        mov byte ptr[@@end], al
        mov word ptr[@@mid],0
        lea di, array
again:
        xor ax, ax
        xor bx, bx
        mov al, byte ptr[@@end]
        add al, byte ptr[@@start]
        mov bl, 2
        div bl
        cmp ah, 1
        jne skip
        add al, 1
skip:
        mov byte ptr[@@mid], al
        cmp al, byte ptr[@@end]
        jg notfound
        mov al, byte ptr[@@query]
        mov bl, byte ptr[@@mid]
        cmp al, byte ptr [di+bx]
        jl sml
        jg big
        lea ax, founds
        push ax
        call prints
        ret
sml:
        mov al, byte ptr[@@mid]
        sub al, 1
        mov byte ptr[@@end], al
        jmp again
big:
        mov al, byte ptr[@@mid]
        add al,1
        mov byte ptr[@@start], al
        jmp again
notfound:
        lea ax, nfounds
        push ax
        call prints
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
