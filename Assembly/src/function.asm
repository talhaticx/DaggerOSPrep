global _start

section .text
_start:
    call func
    mov eax, 1
    mov ebx, 0
    int 0x80

func:
    pop ebp

    ; sub esp, 2

    mov [esp], byte "H"
    mov [esp+1], byte "i"
    mov [esp+2], byte 0x0a

    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 4

    int 0x80

    jmp ebp