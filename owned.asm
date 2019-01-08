section  .text

global   _start

_start:
   xor   eax, eax	;clearing eax
   xor   ebx, ebx	;clearing ebx
   xor   ecx, ecx	;clearing ecx
   xor   edx, edx	;clearing edx
   mov   al, 4		;moving 4 to eax i.e, write op code
   mov   bl, 1		;moving 1 to ebx i.e, fd = 1
   push  0x21212164	;pushing !!!d
   push  0x656e776f	;pushing ewno ; pushed owned!!! to stack in little endian format
   mov   ecx, esp	;moving owned!!! location to ecx
   mov   dl, 8		;moving length of string to edx i.e, 8
   int   0x80		;calling kernel
   mov   al, 1		;push 1 to eax i.e, exit op code
   xor   ebx, ebx	;clearing ebx to return code 0
   int   0x80		;calling system

; char shellcode = "\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xb0\x04\xb3\x01\x68\x64\x21\x21\x21\x68\x64\x6f\x77\x6e\x65\x89\xe1\xb2\x08\xcd\x80\xb0\x01\x31\xdb\xcd\x80"
; length of shellcode = 36
