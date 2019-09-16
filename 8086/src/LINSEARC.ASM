.model small

.data
array db 10 dup(0)
nofelems db 0ah,'Enter no of elements you want to enter (max 9): $'
elems db 0ah,'Enter character: $'
querys db 0ah,'Enter character you want to search for: $'
founds db 0ah,'FOUND!!$'
notfounds db 0ah,'NOT FOUND!!$'
num db 0

.stack 1000h

.code
prints proc stdcall
	arg @@str:WORD
	mov dx, [@@str]
	mov ah, 09h
	int 21h
	ret
prints endp

getArray proc stdcall
	arg @@array:WORD,@@size:WORD
	mov cx, [@@size]
	mov di, [@@array]
again:
	lea ax, elems
	push ax
	call prints
	mov ah, 01h
	int 21h
	mov byte ptr[di], al
	inc di
	loop again
	ret
getArray endp

linsearch proc stdcall
	arg @@array:WORD,@@num:WORD
	local @@query:BYTE
	lea ax, querys
	push ax
	call prints
	mov ah, 01h
	int 21h
	mov byte ptr[@@query], al
	mov cx, [@@num]
	mov al, byte ptr [@@query]
	mov di,word ptr [@@array]
	repne scasb
	je found
	lea ax, notfounds
	push ax
	call prints
	ret
found:
	lea ax, founds
	push ax
	call prints
	ret
linsearch endp

main proc stdcall
	lea ax, nofelems
	push ax
	call prints
	mov ah, 01h
	int 21h
	and al, 0fh
	mov byte ptr[num], al
	xor ax, ax
	mov al, [num]
	push ax
	lea ax, array
	push ax 
	call getArray
	xor ax, ax
	mov al, [num]
	push ax
	lea ax, array
	push ax
	call linsearch
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