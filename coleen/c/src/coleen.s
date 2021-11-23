section .text
global start
global _main
extern _printf
main:
    push rbp
    mov rbp, rsp
    lea rdi, [rel message]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel message]
    call _printf
    mov rax, 0
    ret

    mov rax, 60
    xor rdi,rdi
    syscall

    section .data
message:    db "hello\n", 0xa
length: equ $-message
