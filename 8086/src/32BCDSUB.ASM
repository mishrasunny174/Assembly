.model small

.data
num2 dd 11223344h
num1 dd 55667788h
res dq 0

.stack 1000h

.code
main proc stdcall
	xor ax, ax
	mov al, byte ptr [num1]
	sub al, byte ptr [num2]
	das
	mov byte ptr[res], al
	mov al, byte ptr [num1+1]
	sbb al, byte ptr [num2+1]
	das
	mov byte ptr[res+1], al
	mov al, byte ptr [num1+2]
	sbb al, byte ptr [num2+2]
	das
	mov byte ptr[res+2], al
	mov al, byte ptr [num1+3]
	sbb al, byte ptr [num2+3]
	das
	mov byte ptr[res+3], al
	xor al, al
	sbb al, 0
	das
	mov byte ptr[res+4], al
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