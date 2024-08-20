; Prints Hello World 10 times
global _start

section .data
    msg db "Hello World", 0x0a  ; string
    len equ $ - msg             ; length of the message

section .text
_start:
    mov ebx, 10                 ; number of iterations
label:
    push ebx                    ; save iteration value
    mov eax, 4                  ; sys_write syscall number
    mov ebx, 1                  ; sys_out
    mov ecx, msg                ; pointer to the message
    mov edx, len                ; length of the message
    int 0x80                    ; call kernel

    pop ebx                     ; restore original value of ebx
    sub ebx, 1
    cmp ebx, 0                  ; check if ebx is zero, if not jump to the label again
    jnz label                   ; loop until ebx is zero

    mov eax, 1                  ; sys_exit syscall number
    xor ebx, ebx                ; exit status 0
    int 0x80                    ; call kernel