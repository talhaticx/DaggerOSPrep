BITS 64

%macro print 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro input 2
    mov rax, 0
    mov rdi, 0
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

section .data
	FEW_ARGS: db "Too Few Arguments", 0xA
	INVALID_OPERATOR: db "Invalid Operator", 0xA
	INVALID_OPERAND: db "Invalid Operand", 0XA
	BYTE_BUFFER: times 10 db 0 ;It's just a memory to size 10 , each slot holds the value 0

    welcomeText db "Welcome to the calculator.", 10
    welcomeTextLen equ $-welcomeText

    promptText db "[A]dd / [S]ubtract / [M]ultiply / [D]ivide: ", 0
    promptTextLen equ $-promptText

    input1Text db "Enter first number: ", 0
    input1TextLen equ $-input1Text

    input2Text db "Enter second number: ", 0
    input2TextLen equ $-input2Text

    resultText db "Result: ", 10, 0
    resultTextLen equ $-resultText

    en db "Enter", 10, 0
    enl equ $-en

    ex db "Exit", 10, 0
    exl equ $-ex

    numSize equ 8

section .bss
    operator resb 2
    num1 resb numSize
    num2 resb numSize

section .text

	global _start

_start:
    ; Print welcome message
    print welcomeText, welcomeTextLen

    ; Print prompt
    print promptText, promptTextLen

    ; Read operator
    input operator, 2


    ; Print and read first number
    print input1Text, input1TextLen
    input num1, numSize

    ; Print and read second number
    print input2Text, input2TextLen
    input num2, numSize

    mov rsi, operator
	;This is part is all checking part which switches the block according to our <operand> + - / *
	cmp byte[rsi], 'm' ;If operator is '*' then goto block multiplication , can be used only if escaped manually while giving input
	je multiplication
	cmp byte[rsi], 'M' ;If operator is 'x' then goto block multiplication , cause you know some shells or every have '*' as wildcard
	je multiplication
	cmp byte[rsi], 'a' ;If operator is '+' then goto block addition
	je addition
	cmp byte[rsi], 'A' ;If operator is '+' then goto block addition
	je addition
	cmp byte[rsi], 's' ;If operator is '-' then goto block subtraction
	je subtraction
	cmp byte[rsi], 'S' ;If operator is '-' then goto block subtraction
	je subtraction
	cmp byte[rsi], 'd' ;If operator is '/' then goto block division
	je division
	cmp byte[rsi], 'D' ;If operator is '/' then goto block division
	je division


	;If <operator> does not match to any case then goto block invalid_operator
	jmp invalid_operator ; go to error block - prompt 'Invalid Operator' and exit

addition:
	mov rsi, num1 ;Let's Pop our second argument (i.e argv[2]) from argument stack which is our <operand1>
	;Well even if it is a number it is in its ASCII code representation lets convert it to our actual integer
	;This is function will take number in its ASCII form (rsi as argument) and return its integer equivalent in rax
	call char_to_int
	mov r10, rax ;Lets store integer equivalent of <operand1> in r10
	mov rsi, num2 ;Let's Pop our third argument (i.e argv[3]) from argument stack which is our <operand2>
	call char_to_int ;Do same for <operand2>
	add rax, r10 ;Let's add them integer equivalent of <operand1> and integer equivalent of <operand2>
	jmp print_result ;Throw cursor at block print cursor, which will print the result

;Same thing we are doing in block subtraction , multiplication and division

subtraction:
	mov rsi, num1 ;Let's Pop our second argument (i.e argv[2]) from argument stack which is our <operand1>
	;Well even if it is a number it is in its ASCII code representation lets convert it to our actual integer
	;This is function will take number in its ASCII form (rsi as argument) and return its integer equivalent in rax
	call char_to_int
	mov r10, rax ;Lets store integer equivalent of <operand1> in r10
	mov rsi, num2 ;Let's Pop our third argument (i.e argv[3]) from argument stack which is our <operand2>
	call char_to_int 
	sub r10, rax
	mov rax, r10
	jmp print_result

multiplication:
	mov rsi, num1 ;Let's Pop our second argument (i.e argv[2]) from argument stack which is our <operand1>
	;Well even if it is a number it is in its ASCII code representation lets convert it to our actual integer
	;This is function will take number in its ASCII form (rsi as argument) and return its integer equivalent in rax
	call char_to_int
	mov r10, rax ;Lets store integer equivalent of <operand1> in r10
	mov rsi, num2 ;Let's Pop our third argument (i.e argv[3]) from argument stack which is our <operand2>
	call char_to_int 
	mul r10
	jmp print_result

division:
	mov rsi, num1 ;Let's Pop our second argument (i.e argv[2]) from argument stack which is our <operand1>
	;Well even if it is a number it is in its ASCII code representation lets convert it to our actual integer
	;This is function will take number in its ASCII form (rsi as argument) and return its integer equivalent in rax
	call char_to_int
	mov r10, rax ;Lets store integer equivalent of <operand1> in r10
	mov rsi, num2 ;Let's Pop our third argument (i.e argv[3]) from argument stack which is our <operand2>
	call char_to_int 
	mov r11, rax
	mov rax, r10
	mov rdx, 0
	div r11 ;Divide the value in rax (implied by 'div') by r11
	jmp print_result


;This block is responsible for printing the content to the screen
;you have to store your content in rax and jump to it , it'll do the rest :)
print_result:
	;This function will convert our integer in rax back to ASCII format (character)
	; Argument - takes integer to be converted (must be stored in rax)
	; Returns pointer to the char string (returns r9 as pointer to the string or char)
	call int_to_char
	mov rax, 1 ;Store syscall number , 1 is for sys_write
	mov rdi, 1 ;Descriptor where we want to write , 1 is for stdout
	mov rsi, r9 ;This is pointer to the string which was returned by int_to_char
	mov rdx, r11 ;r11 stores the number of chars in our string , read about how to make syscall in asm
	syscall ;interrupt , give the wheel to OS it'll handle your systemcall
	jmp exit


invalid_operator:
	mov rdi, INVALID_OPERATOR
	call print_error

invalid_operand:
	mov rdi, INVALID_OPERAND
	call print_error

print_error:
	push rdi
	call strlen ;calculate the length of rdi (error message)
	mov rdi, 2 ;write to stderr
	pop rsi
	mov rdx, rax ;result of strlen
	mov rax, 1 ;write syscall
	syscall
	call error_exit
	ret

strlen:
	xor rax, rax ;store zero in rax
.strlen_loop:
	cmp BYTE [rdi + rax], 0xA ;compare byte to a newline
	je .strlen_break ;break if the current byte is a newline
	inc rax
	jmp .strlen_loop ;repeat if the current byte isn't a newline
.strlen_break:
	inc rax ;add one to string length to count the newline
	ret


;This is the function which will convert our character input to integers
;Argument - pointer to string or char ( takes rsi as argument )
;Returns equivalent integer value (in rax)
char_to_int:
	xor ax, ax ;store zero in ax
	xor cx, cx ;same
	mov bx, 10 ; store 10 in bx - the input string is in base 10, so each place value increases by a factor of 10

.loop_block:

	;REMEMBER rsi is base address to the string which we want to convert to integer equivalent

	mov cl, [rsi] ;Store value at address (rsi + 0) or (rsi + index) in cl, rsi is incremented below so dont worry about where is index.
	cmp cl, byte 10 ;If value at address (rsi + index ) is byte 0 (NULL) , means our string is terminated here
	je .return_block

	;Each digit must be between 0 (ASCII code 48) and 9 (ASCII code 57)
	cmp cl, 0x30 ;If value is lesser than 0 goto invalid operand
	jl invalid_operand
	cmp cl, 0x39 ;If value is greater than 9 goto invalid operand
	jg invalid_operand

	sub cl, 48 ;Convert ASCII to integer by subtracting 48 - '0' is ASCII code 48, so subtracting 48 gives us the integer value

	;Multiply the value in 'ax' (implied by 'mul') by bx (always 10). This can be thought of as shifting the current value
	;to the left by one place (e.g. '123' -> '1230'), which 'makes room' for the current digit to be added onto the end.
	;The result is stored in dx:ax.
	mul bx

	;Add the current digit, stored in cl, to the current intermediate number.
	;The resulting sum will be mulitiplied by 10 during the next iteration of the loop, with a new digit being added onto it
	add ax, cx

	inc rsi ;Increment the rsi's index i.e (rdi + index ) we are incrementing the index

	jmp .loop_block ;Keep looping until loop breaks on its own

.return_block:
	ret


;This is the function which will convert our integers back to characters
;Argument - Integer Value in rax
;Returns pointer to equivalent string (in r9)
int_to_char:
	mov rbx, 10
	;We have declared a memory which we will use as buffer to store our result
	mov r9, BYTE_BUFFER+10 ;We are are storing the number in backward order like LSB in 10 index and decrementing index as we move to MSB
	mov [r9], byte 0 ;Store NULL terminating byte in last slot
	dec r9 ;Decrement memory index
	mov [r9], byte 0XA ;Store break line
	dec r9 ;Decrement memory index
	mov r11, 2;r11 will store the size of our string stored in buffer we will use it while printing as argument to sys_write

.loop_block:
	mov rdx, 0
	div rbx    ;Get the LSB by dividing number by 10 , LSB will be remainder (stored in 'dl') like 23 divider 10 will give us 3 as remainder which is LSB here
	cmp rax, 0 ;If rax (quotient) becomes 0 our procedure reached to the MSB of the number we should leave now
	je .return_block
	add dl, 48 ;Convert each digit to its ASCII value
	mov [r9], dl ;Store the ASCII value in memory by using r9 as index
	dec r9 ;Dont forget to decrement r9 remember we are using memory backwards
	inc r11 ;Increment size as soon as you add a digit in memory
	jmp .loop_block ;Loop until it breaks on its own

.return_block:
	add dl, 48 ;Don't forget to repeat the routine for out last MSB as loop ended early
	mov [r9], dl
	dec r9
	inc r11
	ret

;Syscall 60 is exit. Return code normally is 0, on errors set it to 1
error_exit:
	mov rax, 60
	mov rdi, 1
	syscall

exit:
	mov rax, 60
	mov rdi, 0
	syscall
