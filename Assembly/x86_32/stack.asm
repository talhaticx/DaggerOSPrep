global _start

section .data

section .text
_start:
    push 100
    push 30
    push 60
    pop ebx
    mov ebx, [esp-4]

    mov eax, 1  ; sys_exit
    int 0x80    ; interrupt call