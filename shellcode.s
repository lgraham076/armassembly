
.data
sh:
    .asciz "/bin/sh"

.text
.global _start

_start:
    ldr x0, =sh
    mov x1, #0
    mov x2, #0
    mov x8, #221
    svc #0

    //mov x0, #0
    //mov w8, #93
    //svc #0
