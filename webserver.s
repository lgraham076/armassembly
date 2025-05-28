.global _start

.data
    sockaddr:
        .byte 0x02, 0x00
        .byte 0x15, 0xb3
        .word 0x00000000

.text

// rbp - 0x8                         server socket
// rbp - 0x18                        sockaddr_in
// rbp - 0x20                        client socket
// rbp - 0x28                        file descriptor
// rbp - 0x228                       request[512]
// rbp - 0x428                       buffer

_start:
    sub x20, sp, #(8*133)    // Allocate stack space 

    mov x0, #2              // AF_INET
    mov x1, #1              // SOCK_STREAM
    mov x2, xzr             // Protocol
    mov x8, #198            // Syscall to create socket
    svc #0x1337

    str x0, [x20]       // Store socket on stack

    
    ldr x0, [x20]
    adr x1, sockaddr
    mov x2, 16
    mov x8, #200        // Syscall to create socket
    svc #0x1337

    ldr x0, [x20]       // Move socket for close
    mov x8, #57         // Syscall for close
    svc #0x1337

    mov x0, xzr
    mov w8, #93
    svc #0
