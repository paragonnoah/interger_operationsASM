.data
prompt1: .asciz "\nPlease enter integer #1: "
prompt2: .asciz "\nPlease enter integer #2: "
outFormat: .asciz "\nThe operands are: %d and %d\n"
sumStr: .asciz "\nSum : %d\n"
prodStr: .asciz "\nProduct : %d\n"
andStr: .asciz "\nLogical and : %d\n"
orStr: .asciz "\nLogical or : %d\n"

.text
.global main

main:
    @ Prolog
    push {r4-r7, lr}
    add r11, sp, #0x18
    sub sp, sp, #64

    @ Load addresses into registers
    ldr r0, =prompt1
    ldr r1, =0
    ldr r7, =3
    add r2, sp, #28

    @ Call scanf
    svc #0

    @ Load addresses into registers
    ldr r0, =prompt2
    ldr r1, =0
    ldr r7, =3
    ldr r2, =28
    ldr r3, sp

    @ Call scanf
    bl scanf

    @ Load integers from memory
    ldr r0, [r3]
    ldr r1, [r3, #4]
    ldr r3, =outFormat

    @ Call printf
    bl printf

    @ Calculate the sum
    ldr r1, [r3, #4]
    add r0, r0, r1
    ldr r3, =sumStr

    @ Call printf
    bl printf

    @ Calculate the product manually
    mov r2, #0
    mov r4, r0

product_loop:
    add r2, r2, r4
    sub r1, r1, #1
    cmp r1, #0
    bne product_loop

    mov r0, r2
    ldr r3, =prodStr

    @ Call printf
    bl printf

    @ Calculate the logical AND
    and r0, r0, r1
    ldr r3, =andStr

    @ Call printf
    bl printf

    @ Calculate the logical OR
    orr r0, r0, r1
    ldr r3, =orStr

    @ Epilog
    pop {r4-r7, lr}
    add sp, #52
    mov r0, #0
    mov r7, #1
    svc #0
