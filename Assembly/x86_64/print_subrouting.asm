BITS 64

global _start

section .data
    text db "Hello World", 10

section .text
_start:
    mov rax, text
    call print 

    mov rax, 60
    mov rdi, 0
    syscall

print:
    push rax
    mov rbx, 0

printLoop:
    inc rax
    inc rbx

    mov cl, [rax]
    cmp cl, 0
    jne printLoop

    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall

    ret
    
