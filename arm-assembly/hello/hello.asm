# ARM Assembly Educational Projects - Hello world

# System calls are APIs for the interface between the user space and the kernel space.
# The sys calls allow for a broad range of usefull features, in the case of this program
# The sys calls are used to write to the standard output strean and exit the program

# For full break down of the syscalls for Linux see
# SYSCALL table for ARM(32-bit/EABI)
# https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#arm-32_bit_EABI

# Linux default file descriptors
# stdin     -   0
# stdout    -   1
# stderror  -   2

# Entry point of the program - must be declared for linker
.global _start
.section .text

# Tell linker the entry point
_start:

    # branch and link
    bl hello_world
    bl exit

hello_world:
    # System to write to stdout file descriptor
    # Specify file descriptor
    mov r0, #1
    # message - Load the address of the message label
    ldr r1, =message
    # load length of the string
    ldr r2, =len
    # write operation syscall
    mov r7, #4
    # Software Interrupt 0
    swi 0

exit:
    # System call to exit
    # Return value
    mov r0, #0
    # Exit operation
    mov r7, #0x1
    # Software interrupt 0
    swi 0

# Data segment 
.section .data 
    # Message label
message:
    .ascii "Hello World!\n"
    len = .-message 
