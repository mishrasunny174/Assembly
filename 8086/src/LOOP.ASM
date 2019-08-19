.model small

.data
msg db 'hello, world',0ah,'$'

.stack 1000h

.code
print proc stdcall
	arg @@msg:WORD
	mov ah, 09h
	mov dx, [@@msg]
	int 21h	
	ret
print endp

main proc stdcall
	mov cx, 10h 
lol:	
	lea ax, msg
	push ax
	call print
	mov ax, 0
	loop lol
	;dec cx
	;cmp cx, 0
	;jne lol
	ret
main endp

start:
	mov ax, @data
	mov ds, ax
	mov es, ax
	call main
	.exit
end start
