section .data
    prompt db 'Enter a string: ', 0  ; prompt message
    prompt_len equ $ - prompt        ; length of the prompt

section .bss
    input resb 100                  ; reserve 100 bytes for input

section .text
global _start

_start:
    ; Print the prompt
    mov eax, 4                      ; syscall number for sys_write
    mov ebx, 1                      ; file descriptor 1 (stdout)
    mov ecx, prompt                 ; pointer to the prompt message
    mov edx, prompt_len             ; length of the prompt message
    int 0x80                        ; call kernel

    ; Read the user input
    mov eax, 3                      ; syscall number for sys_read
    mov ebx, 0                      ; file descriptor 0 (stdin)
    mov ecx, input                  ; pointer to the input buffer
    mov edx, 100                    ; number of bytes to read
    int 0x80                        ; call kernel

    ; Print the user input
    mov eax, 4                      ; syscall number for sys_write
    mov ebx, 1                      ; file descriptor 1 (stdout)
    mov ecx, input                  ; pointer to the input buffer
    mov edx, eax                    ; number of bytes read
    int 0x80                        ; call kernel

    ; Exit the program
    mov eax, 1                      ; syscall number for sys_exit
    xor ebx, ebx    
    int 0x80
    ; End of program
