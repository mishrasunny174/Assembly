.model small

.data
array1 db 10 dup(0)
array2 db 10 dup(0)
resArr db 10 dup(0)
enFirstArr db 0ah,'First array',0ah,'$'
enSecondArr db 0ah,'Second array',0ah,'$'
enSize db 0ah,'Enter array size (max 9): $'
enNumber db 0ah,'Enter number: $'
resArrStr db 0ah, 'Result is',0ah,'$'
arrSize db 0

.stack 1000h

.code
prints proc stdcall
	arg @@str:WORD
	mov dx, [@@str]
	mov ah, 09h
	int 21h
	ret
prints endp

getIntArray proc stdcall
	arg @@array:WORD,@@size:WORD
	mov cx, word ptr[@@size]
	mov di, word ptr[@@array]
again:
	lea ax, enNumber
	push ax
	call prints
	mov ah, 01h
	int 21h
	and al, 0fh
	mov [di], al
	inc di
	loop again
	ret 
getIntArray endp

getArraySize proc stdcall
	lea ax, enSize
	push ax
	call prints
	mov ah, 01h
	int 21h
	and al, 0fh
	mov byte ptr[arrSize], al
	ret
getArraySize endp

subArr proc stdcall
	arg @@arr1:WORD,@@arr2:WORD,@@res:WORD,@@size:WORD
	mov cx, word ptr[@@size]
	mov si, 0
	mov di, word ptr[@@res]
againSubArr:
	mov bx, word ptr[@@arr1]
	mov al, byte ptr[bx+si]
	mov bx, word ptr[@@arr2]
	sub al, byte ptr[bx+si]
	mov byte ptr [di], al
	inc si
	inc di
	loop againSubArr
	ret
subArr endp

printArr proc stdcall
	arg @@arr:WORD,@@size:WORD
	mov cx, [@@size]
	mov di, [@@arr]
againPrint:
	mov dl, byte ptr[di]
	add dl, 30h
	mov ah, 02h
	int 21h
	inc di
	loop againPrint
	ret
printArr endp

main proc stdcall
	call getArraySize
	; calling prints to print enter first array
	lea ax, enFirstArr
	push ax
	call prints
	; calling getIntArray for first array
	xor ax, ax
	mov al, byte ptr[arrSize]
	push ax
	lea ax, array1
	push ax
	call getIntArray
	; calling prints to print enter second array
	lea ax, enSecondArr
	push ax
	call prints
	; calling getIntArray for array2
	xor ax, ax
	mov al, byte ptr[arrSize]
	push ax
	lea ax, array2
	push ax
	call getIntArray
	; calling add2arr to add two arrays
	xor ax, ax
	mov al, byte ptr[arrSize]
	push ax
	lea ax, resArr
	push ax
	lea ax, array2
	push ax
	lea ax, array1
	push ax
	call subArr
	; calling prints to printResult
	lea ax, resArrStr
	push ax
	call prints
	; calling printArr on res Array
	xor ax, ax
	mov al, byte ptr [arrSize]
	push ax
	lea ax, resArr
	push ax
	call printArr
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