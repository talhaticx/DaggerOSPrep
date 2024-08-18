global _start

section .data

section .text
_start:
    mov ebx, 1                   ; File descriptor for stdout
    mov ecx, 7             ; Number of times to print
label:
    add ebx, ebx
    dec ecx
    cmp ecx, 0
    jg label
    mov eax, 1
    int 0x80