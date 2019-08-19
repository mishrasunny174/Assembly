.model small

.data
num1    dd      0ffffffffh				; first number
num2    dd      0ffffffffh				; second number
res	dq 	0					; result will be stored here

.stack 1000h 						; declaring stack of size 1000h

.code

mul32 proc stdcall
        arg @@op1:DWORD,@@op2:DWORD,@@res:WORD		;declaring that this func takes three arguments
							;op1 is operand1 of multiplication
							;op2 is operand2 of multiplication
							;res is a pointer to the location where result will be stored
	mov di, [@@res]					;initializing di with result ptr which will be used to store result
        mov ax, word ptr @@op1                          ;loading lower word of op1
        mul word ptr @@op2    	                        ;multiplying with lower word of op2
        mov word ptr [di], ax	                        ;storing result lower word to res
        mov cx, dx                                      ;mov upper word to another register
        mov ax, word ptr @@op1+2                        ;loading upper word of op1
        mul word ptr @@op2                              ;multiplying it with lower word op2
        add cx, ax                                      ;adding remainder of priv multiply
							;to current lower word
							;storing it in cx cause we need to
							;add it to next multiply cause it's a 
							;carry
	mov bx, dx					;saving dx also as we need to add it 
							;as well
	adc bx, 0					;adding carry to bx if there any
							;as bx contains upper word of the 
							;second multiplication
        mov ax, word ptr @@op1    			;loading lower word of op1
        mul word ptr @@op2+2             		;multiplying it with upper word of op2
	add cx, ax					;adding previous lower word remainder 
							;to current lower word result
	adc bx, 0					;adding carry of previous addition to upper word of previous multiplication result
	add di ,2					;increamenting res ptr to store second word of the result
	mov word ptr [di], cx	  			;now second word of result is all
							;summed up so saving it to memory
	mov cx, dx					;storing upper word temporary for future use
        mov ax, word ptr @@op1+2			;multiplying the last word of op1 with
        mul word ptr @@op2+2				;last word of op2
	add cx, ax					;adding lower word of the result of previous multiplication with upper word of previous multiplication
	adc dx, 0					;adding carry of prev addition if any to upper word
	add cx, bx					;adding upper word of prev to prev multiplication to current result
	adc dx, 0					;adding carry to dx if any
	add di, 2					;storing the third word
	mov word ptr [di], cx				;
	add di ,2					;storing the 4th word
	mov word ptr [di], dx				;
	ret						;
mul32 endp

main proc stdcall
	lea ax, res
	push ax						;pushing third argument
	mov ax,word ptr [num1]
        push ax						;pushing lower word of second arg
        mov ax,word ptr [num1+1]
        push ax						;pushing upper word of second arg
        mov ax,word ptr [num2]
        push ax						;pushing lower word of first arg
        mov ax, word ptr [num2+1]
        push ax						;pushing upper word of first arg
	call mul32
	mov ax, 0
	ret
main endp

start:
	mov ax, @data
	mov ds, ax
	mov es, ax
       	call main
	.exit
end start
