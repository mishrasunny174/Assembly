.model small

.data
num1 dd 11223344h
num2 dw 1122h
numer dd 0
remain dw 0

.stack 1000h

.code
main proc stdcall
	mov ax, word ptr[num1+2]
	div word ptr[num2]
	mov word ptr[numer+2], ax
	mov ax, word ptr[num1]
	div word ptr[num2]
	mov word ptr[numer], ax
	mov word ptr[remain], dx
	int 3
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
