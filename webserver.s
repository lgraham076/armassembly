.global _start

.data

.text


_start:
    mov x0, #2              // AF_INET
    mov x1, #1              // SOCK_STREAM
    mov x2, xzr             // Protocol
    mov x8, #198            // Syscall to create socket
    svc #0x1337

    mov x20, x0             // Move socket for use later

    mov x0, x20             // Move socket for close
    mov x8, #57             // Syscall for close
    svc #0x1337

    mov x0, #0
    mov w8, #93
    svc #0
