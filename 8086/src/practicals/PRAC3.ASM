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

start:
        mov ax, @data
        mov ds, ax
        mov es, ax

        mov cx, 10
        lea di, array
        mov al, byte ptr [query]
        repne scasb
        jne notfound
        lea ax, founds
        push ax
        call prints
        mov ah, 4ch
        int 21h
notfound:
        lea ax, nfounds
        push ax
        call prints
        mov ah, 4ch
        int 21h
end start
