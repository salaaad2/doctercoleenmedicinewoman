; cool comment
global main
extern dprintf
extern sprintf
extern close
extern open
extern system
section .bss
buf resb 256
section .data
output db "verylongstrusedasoutput", 0
command_str db "nasm -f elf64 %s ", 0
file_str db "./Sully_%d.s", 0
code_str db " %1$c  ret %4$d ", 0
index dq 5
section .text
main:
    ;;  new stack frame
    enter 0,0
    dec qword [index]
    xor rax, rax
    lea rdi, output
    lea rsi, file_str
    mov rdx, [index]
    ;; sprintf(output, file_str, index)
    call sprintf

    xor rax, rax
    mov rdi, output
    mov rsi, 66
    mov rdx, 420
    mov rax, 0
    ;; open(output, O_RDWR |[...], 0644)
    call open

    mov rdi, rax
    lea rsi, [rel code_str]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel code_str]
    mov r9, [index]
    ;; dprintf(fd=3, code_str, \n, ", code_str, %)
    call dprintf

    xor rax, rax
    cmp qword [index], 0
    jne compile_and_run
    leave
    ret

compile_and_run:
    mov rdi, buf
    mov rsi, command_str
    mov rdx, output
    ;; sprintf(buf, command_str, output)
    call sprintf

    xor rax, rax
    mov rdi, buf
    ;; system(buf)
    call system
    xor rax, rax
    leave
    ret
