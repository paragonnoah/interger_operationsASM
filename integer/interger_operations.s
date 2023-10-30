.data
input_format: .asciz "%d %d\n"     @ Format string for reading two integers
output_format: .asciz "You entered: %d and %d\n"
result_format: .asciz "Sum: %d\nProduct: %d\nLogical AND: %d\nLogical OR: %d\n"
.text
.global main
main:
    @ Initialize the stack pointer
    mov sp, #0x8000000
    
    @ Prompt the user to enter two integers
    mov r0, #0       @ File descriptor (0 for stdin)
    ldr r1, =input_format @ Format string
    ldr r2, =int1    @ Address of the first integer variable
    ldr r3, =int2    @ Address of the second integer variable
    bl scanf
    
    @ Calculate the sum of the two integers
    ldr r4, [r2]     @ Load the first integer
    ldr r5, [r3]     @ Load the second integer
    add r6, r4, r5  @ Calculate the sum
    
    @ Calculate the product of the two integers
    mul r7, r4, r5  @ Calculate the product
    
    @ Calculate the logical AND of the two integers
    and r8, r4, r5  @ Calculate the logical AND
    
    @ Calculate the logical OR of the two integers
    orr r9, r4, r5  @ Calculate the logical OR
    
    @ Output the user input and results
    ldr r0, =output_format
    ldr r1, [r2]
    ldr r2, [r3]
    bl printf
    
    ldr r0, =result_format
    mov r1, r6     @ Sum
    mov r2, r7     @ Product
    mov r3, r8     @ Logical AND
    mov r4, r9     @ Logical OR
    bl printf
    
    @ Exit the program
    mov r7, #1      @ Exit syscall number
    mov r0, #0      @ Exit status (success)
    swi 0

.data
int1: .int 0
int2: .int 0
