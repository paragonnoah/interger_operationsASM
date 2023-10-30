.data
prompt1: .asciz "Please enter integer #1: "
prompt2: .asciz "Please enter integer #2: "
outFormat: .asciz "The operands are: %d and %d\n"
sumStr: .asciz "Sum: %d\n"
productStr: .asciz "Product: %d\n"
andStr: .asciz "Logical AND: %d\n"
orStr: .asciz "Logical OR: %d\n"

.text
.global main

main:
    // Print the first prompt and read the first integer
    ldr r0, =prompt1
    bl printf
    ldr r0, =0  // Read integer from the user
    ldr r1, r0
    ldr r2, r0
    bl scanf

    // Print the second prompt and read the second integer
    ldr r0, =prompt2
    bl printf
    ldr r0, =0  // Read integer from the user
    ldr r1, r0
    ldr r2, r0
    bl scanf

    // Display the entered operands
    ldr r0, =outFormat
    ldr r1, r1
    ldr r2, r2
    bl printf

    // Calculate and display the sum
    add r0, r1, r2
    ldr r1, =sumStr
    bl printf

    // Calculate and display the product
    mul r0, r1, r2
    ldr r1, =productStr
    bl printf

    // Calculate and display the logical AND
    and r0, r1, r2
    ldr r1, =andStr
    bl printf

    // Calculate and display the logical OR
    orr r0, r1, r2
    ldr r1, =orStr
    bl printf

    // Exit the program
    mov r7, #1
    swi 0
