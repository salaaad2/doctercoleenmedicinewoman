; cool comment
global main
extern dprintf
extern close
extern open

section .rodata
    file_str db "./Grace_kid.s", 0
    code_str db "symbols: %1$c %2$c %3$s", 0
section .text
main:
    ;;  new stack frame
    enter 0,0
    mov rdi, file_str
    mov rsi, 66
    mov rdx, 420
    mov rax, 0
    call open
    ;;  dprintf fd: hardcode to 1
    mov rdi, rax                ; rax holds open retval
    lea rsi, [rel code_str]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel code_str]
    call dprintf
    leave
    ret
