section     .data

vendorString    db "AAAAAAAAAAAA",0xa ;placeholder for storing vendor id

section     .text

global _start

_start:
    mov     edi, vendorString
    mov     eax, 0x0
    cpuid
    mov     [edi], ebx
    mov     [edi+4], edx
    mov     [edi+8], ecx
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, vendorString
    mov     edx, 0xd
    int     0x80
    mov     eax,1
    mov     ebx,0
    int     0x80
