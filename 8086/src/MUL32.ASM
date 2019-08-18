.model small

.data
num1 	dq 	11223344h; first number
num2	dq 	22334455h; second number
res	 	dd 	0; result will be stored here

.stack 1000h ; declaring stack of size 1000h

.code

main proc stdcall
	mov ax, word ptr num1	;loading lower word of op1
	mul word ptr num2		;multiplying with lower word of op2
	mov word ptr res, ax	;storing result lower word to res
	mov cx, dx				;mov upper word to another register
	mov ax, word ptr num1+2	;loading upper word of op1
	mul word ptr num2		;multiplying it with lower word op2
	add cx, ax				;adding remainder of priv multiply
							;to current lower word
							;storing it in cx cause we need to
							;add it to next multiply cause it's a 
							;carry
	mov bx, dx				;saving dx also as we need to add it 
							;as well
	adc bx, 0				;adding carry to bx if there any
							;as bx contains upper word of the 
							;second multiplication
	mov ax, word ptr num1	;loading lower word of op1
	mul word ptr num2+2		;multiplying it with upper word of op2
	add cx, ax				;adding previous lower word remainder 
							;to current lower word result
	mov word ptr res+2, cx	;now second word of result is all
							;summed up so saving it to memory
	mov cx, dx
	adc bx, 0
	mov ax, word ptr num1+2
	mul word ptr num2+2
	add cx, ax
	adc dx, 0
	add cx, bx
	mov word ptr res+4, cx
	adc dx, 0
	mov word ptr res+6, dx
	int 3
	.exit 0
main endp

start:
	mov ax, @data
	mov ds, ax
	mov es, ax
	call main
end start