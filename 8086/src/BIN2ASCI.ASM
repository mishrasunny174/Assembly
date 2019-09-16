.model small

.data
enterNum db 0ah,'Enter Number(in binary): $'
printNum db 0ah,'Number in ascii is: $'
number db 0

.stack 1000h

.code
prints proc stdcall
	arg @@str:word
	mov dx, [@@str]
	mov ah, 09h
	int 21h
	ret
prints endp

main proc stdcall
	lea ax, enterNum
	push ax
	call prints
	mov cx, 8
	xor bx, bx
again:
	mov ah, 01h
	int 21h
	and al, 0fh
	shl bl, 1
	or bl, al
	loop again
	mov byte ptr[number], bl
	lea ax, printNum
	push ax
	call prints
	mov dl, byte ptr [number]
	mov ah, 02h
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