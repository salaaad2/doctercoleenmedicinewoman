; cool comment
global main
extern dprintf
extern sprintf
extern close
extern open
extern system
%define OPEN_FLAGS 66
%define OPEN_PERMISSIONS 420
%define CHAR_NEWLINE 10
%define CHAR_QUOTE 34
%define CHAR_PERCENT 37
section .bss
buf resb 256
section .data
buf2 db "echo cool", 0
output db "verylongstrusedasoutput", 0
command_str db "nasm -f elf64 %s; clang %.7s.o -o %.7s ; ./%.7s", 0
file_str db "./Sully_%d.s", 0
code_str db "; cool comment insert grace%c %c %s %c ", 0
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
    mov rsi, OPEN_FLAGS
    mov rdx, OPEN_PERMISSIONS
    mov rax, 0
    ;; open(output, O_RDWR | )
    call open

    mov rdi, rax
    lea rsi, [rel code_str]
    mov rdx, CHAR_NEWLINE
    mov rcx, CHAR_QUOTE
    lea r8, [rel code_str]
    mov r9, CHAR_PERCENT
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
    call system
    xor rax, rax
    leave
    ret
