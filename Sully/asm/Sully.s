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
section .rodata
buf db "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 0
output db "verylongstrusedasoutput", 0
command_str db "nasm -f elf64 %s", 0
index dq 5
file_str db "./Sully_%d.s", 0
code_str db "; cool comment insert grace ", 0
section .text
main:
    ;;  new stack frame
    enter 0,0
    dec qword [index]
    mov rdi, output
    mov rsi, file_str
    mov rdx, index
    xor rax, rax
    call sprintf

    xor rax, rax
    mov rdi, output
    mov rsi, OPEN_FLAGS
    mov rdx, OPEN_PERMISSIONS
    mov rax, 0
    call open

    mov rdi, rax
    lea rsi, [rel code_str]
    mov rdx, CHAR_NEWLINE
    mov rcx, CHAR_QUOTE
    lea r8, [rel code_str]
    mov r9, CHAR_PERCENT
    call dprintf

    xor rax, rax
    cmp word [index], 0
    jne compile_and_run
    leave
    ret

compile_and_run:
    mov rdi, buf
    mov rsi, command_str
    mov rdx, output
    call sprintf

    mov rdi, rax
    call system
    xor rax, rax
    leave
    ret
