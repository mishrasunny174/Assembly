.model small

.data
array db 0,1,2,3,4,5,6,7,8,9
query db 5
founds db 'Found',0ah,'$'
nfounds db 'Not Found',0ah,'$'

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
        local @@mid:word, @@start:word, @@end:word
        mov byte ptr[@@start], 0
        mov byte ptr[@@end], 9
        mov word ptr[@@mid],0
        lea di, array
again:
        xor ax, ax
        xor bx, bx
        mov al, byte ptr[@@end]
        add al, byte ptr[@@start]
        mov bl, 2
        div bl
        mov byte ptr[@@mid], al
        cmp al, byte ptr[@@end]
        jg notfound
        mov al, byte ptr[query]
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
