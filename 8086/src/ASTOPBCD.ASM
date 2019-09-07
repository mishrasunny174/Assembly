; ASCII to unpacked BCD
.model small

.stack 1000h

.data
num db '1234'
res dw 0

.code
main proc stdcall
        mov si, 0
        mov cx, 4
        xor ax, ax
        xor dx, 0
begin:
        xor ax, ax
        mov al, byte ptr[num+si]
        and al, 0fh
        shl dx, 4h
        or dx, ax
        inc si
        loop begin
        mov word ptr[res], dx
        ret
main endp

start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        call main
        .exit 0
end start
