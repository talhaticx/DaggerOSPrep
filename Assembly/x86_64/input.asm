BITS 64

global _start

section .data
    text1 db "What's your name?"
    len_text1 equ $-text1
    text2 db "Hello, "
    len_text2 equ $-text2


    len_name equ 30

section .bss
    name resb len_name

section .text
_start:
    call printText1
    call getName
    call printText2
    call printText3

    mov rax, 60      ; Exit system call
    mov rdi, 0       ; Exit code 0
    syscall

printText1:
    mov rax, 1       ; Syscall number for sys_write
    mov rdi, 1       ; File descriptor 1 (stdout)
    mov rsi, text1   ; Address of the string
    mov rdx, len_text1  ; Length of the string to print
    syscall
    ret


getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, len_name
    syscall
    ret


printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, len_text2
    syscall
    ret

printText3:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, len_name
    syscall
    ret

