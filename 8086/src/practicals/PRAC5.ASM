.model small

.data
arr1 dw 1,2,3,4,5
arr2 dw 2,3,4,5,6
res1 dw 5 dup(0)
res2 dw 5 dup(0)
.stack 1000h

.code
start:
        mov ax, @data
        mov ds, ax
        mov es, ax
;adding arr1 to arr2
        mov cx, 5
        mov di, 0
loop1:
        xor ax, ax
        mov ax, arr1[di]
        add ax, arr2[di]
        mov word ptr res1[di], ax
        add di, 2
        loop loop1
;substracting arr1 from arr2
        mov cx, 5
        mov di, 0
loop2:
        xor ax, ax
        mov ax, arr2[di]
        sub ax, arr1[di]
        mov word ptr res2[di], ax
        add di, 2
        loop loop2
        mov ah, 4ch
        int 21h
end start
