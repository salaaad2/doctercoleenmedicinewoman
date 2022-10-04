; cool comment
global main
extern sprintf
extern open
extern close
extern dprintf

section .rodata
    n db 5
    buf db "", 0
    format_file_str db "Sully_%1$d.s", 0
    code_str db "symbols: %1$c %2$c %3$s", 0
section .text
main:
;; new stack frame
    cmp n, 0x0
    je exit
;; rm 1
    sub n, 1
    enter 0,0
    mov rdi, buf
    mov rsi, format_file_str
    mov rdx, n
    call sprintf
;;
    mov rdi, target_file_str
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

exit:
    xor rax, rax
    ret
