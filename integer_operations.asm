section .data
    prompt1 db "Please enter integer #1: ", 0
    prompt2 db "Please enter integer #2: ", 0
    outFormat db "The operands are: %d and %d", 10, 0
    sumStr db "Sum              : %d", 10, 0
    prodStr db "Product          : %d", 10, 0
    andStr db "Logical and      : %d", 10, 0
    orStr db "Logical or       : %d", 10, 0
    integer1 dd 0
    integer2 dd 0

section .text
    global main
    extern printf, scanf

main:
    ; Prompt for the first integer
    push prompt1
    call printf
    add esp, 4

    ; Read the first integer
    push integer1
    push "%d"
    call scanf
    add esp, 8

    ; Prompt for the second integer
    push prompt2
    call printf
    add esp, 4

    ; Read the second integer
    push integer2
    push "%d"
    call scanf
    add esp, 8

    ; Calculate and print the results
    push dword [integer2]
    push dword [integer1]
    push outFormat
    call printf
    add esp, 12

    ; Calculate the sum
    push dword [integer2]
    push dword [integer1]
    call add_integers

    ; Calculate the product
    push dword [integer2]
    push dword [integer1]
    call multiply_integers

    ; Calculate the logical AND
    push dword [integer2]
    push dword [integer1]
    call and_integers

    ; Calculate the logical OR
    push dword [integer2]
    push dword [integer1]
    call or_integers

    ; Exit the program
    mov eax, 0
    ret

add_integers:
    ; Calculate the sum of two integers
    pop ebx
    pop eax
    add eax, ebx
    push eax
    ret

multiply_integers:
    ; Calculate the product of two integers
    pop ebx
    pop eax
    imul eax, ebx
    push eax
    ret

and_integers:
    ; Calculate the logical AND of two integers
    pop ebx
    pop eax
    and eax, ebx
    push eax
    ret

or_integers:
    ; Calculate the logical OR of two integers
    pop ebx
    pop eax
    or eax, ebx
    push eax
    ret
