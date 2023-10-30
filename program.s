.data
prompt1:  .asciz "\nPlease enter integer #1: "
prompt2:  .asciz "\nPlease enter integer #2: "
outFormat: .asciz "\nThe operands are: %d and %d\n"
sumStr:    .asciz "\nSum              : %d\n"
prodStr:   .asciz "\nProduct          : %d\n"
andStr:    .asciz "\nLogical and      : %d\n"
orStr:     .asciz "\nLogical or       : %d\n"

.text
.global main
main:
    @ Prolog
    push {r4-r7, lr}

    @ Setup FP/SP
    add r11, sp, #0x18

    @ Local storage for scanf
    sub sp, sp, #64

    @ Load the address of prompt1
    ldr r0, =prompt1

    @ Load the immediate value 0x0f into r1
    mov r1, #0x0f

    @ Call scanf
    mov r7, #3
    sub r2, sp, #28
    svc #0

    @ Load the address of prompt2
    ldr r0, =prompt2

    @ Load the immediate value 0x0f into r1
    mov r1, #0x0f

    @ Call scanf
    mov r7, #3
    ldr r2, =28
    ldr r3, sp
    bl scanf

    @ Load values from memory into registers
    ldr r0, [r3]
    ldr r1, [r3, #4]

    @ Load the address of outFormat
    ldr r3, =outFormat

    @ Call printf
    bl printf

    @ Perform other operations

    @ Epilog
    pop {r4-r7, pc}
