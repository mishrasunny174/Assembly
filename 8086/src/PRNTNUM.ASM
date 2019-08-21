.model small

.data
num dw 1234h;

.stack 1000h

.code
start:
	mov ax, @data
	mov ds, ax
	mov es, ax
	mov cx, 4
lop:
	mov ax, word ptr [num]
	rol ax, 4
	mov word ptr [num], ax
	mov bl, al
	and bl, 0fh
	add bl, 30h
	cmp bl, 39h
	jle dig
	add bl, 7h
dig:
	mov dl, bl
	mov ah, 02h
	int 21h
	loop lop
	.exit 0
end start
