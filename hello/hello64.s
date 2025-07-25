
.data
helloworld:
    .asciz "Hello World\n"

.text
.global _start

_start:
    mov x0, #1
    ldr x1, =helloworld
    mov x2, #12
    mov w8, #64
    svc #0

    mov x0, #0
    mov w8, #93
    svc #0
