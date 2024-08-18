global _start

section .data
    addr db 0x0a, "yellow",  0x0a, 0x0a

section .text
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, addr
    mov edx, 9
    int 0x80

    mov [addr+1], byte "H"
    mov [addr+6], byte "!"

    mov eax, 4
    mov ebx, 1
    mov ecx, addr+1
    mov edx, 7
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80