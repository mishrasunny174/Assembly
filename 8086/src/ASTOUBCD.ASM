; ascii to unpacked BCD
.model small

.stack 1000h

.data
num db '1234'
res dq 0

.code
main proc stdcall
        mov cx, 4
        mov si, 0
        xor ax, ax
begin:
        mov al, byte ptr[num+si]
        and al, 0fh
        mov byte ptr[res+si], al
        inc si
        loop begin
        ret
main endp

start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        call main
        .exit 0
end start
