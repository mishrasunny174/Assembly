.model small

.data
num1 	dq 	11223344h				;first number
num2	dq 	22334455h				;second number
res	 	dd 	0				;result will be stored here

.stack 1000h 						; declaring stack of size 1000h

.code
start:
	mov ax, @data					;loading address of stack segment in ax
	mov ds, ax					;correctly loading value of ds
	mov es, ax					;assigning es to same segment as ds
	mov ax, word ptr num1				;loading lower word of op1
	mul word ptr num2				;multiplying with lower word of op2
	mov word ptr res, ax				;storing result lower word to res
	mov cx, dx					;mov upper word to another register
	mov ax, word ptr num1+2				;loading upper word of op1
	mul word ptr num2				;multiplying it with lower word op2
	add cx, ax					;adding remainder of priv multiply
							;to current lower word
							;storing it in cx cause we need to
							;add it to next multiply cause it's a 
							;carry
	mov bx, dx					;saving dx also as we need to add it 
							;as well
	adc bx, 0					;adding carry to bx if there any
							;as bx contains upper word of the 
							;second multiplication
	mov ax, word ptr num1				;loading lower word of op1
	mul word ptr num2+2				;multiplying it with upper word of op2
	add cx, ax					;adding previous lower word remainder 
							;to current lower word result
	mov word ptr res+2, cx				;now second word of result is all
							;summed up so saving it to memory
	mov cx, dx					;save temporaly value of dx in cx cause we will need it again
	adc bx, 0					;add carry of previous addition
	mov ax, word ptr num1+2				;load last num+2 in memory
	mul word ptr num2+2				;multiply it with upper word of op2
	add cx, ax					;add the lower byte of result to upper word of previous result
	adc dx, 0					;adding carry of previous addition
	add cx, bx					;adding previous upper word to current lower word to finalize the 4th word
	mov word ptr res+4, cx				;mov the prepared 3rd word to the result
	adc dx, 0					;add carry to upper word
	mov word ptr res+6, dx				;mov final word to the result
	int 3						;just a intruction to trap the debugger
	.exit 0						;macro to exit gracely
end start
