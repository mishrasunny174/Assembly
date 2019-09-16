.model small

.data
enterNum db 0ah,'Enter character: $'
printRes db 0ah, 'Character in binary is: $'

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
	lea ax, enterNum
	push ax
	call prints
	mov ah, 01h
	int 21h
	xor bl, bl
	mov bl, al
	lea ax, printRes
	push ax
	call prints
	mov cx, 8
again:
	xor bh, bh
	shl bx, 1
	mov dl, bh
	add dl, 30h
	mov ah, 02h
	int 21h
	loop again
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