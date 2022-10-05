; cool comment
global main
extern dprintf
extern close
extern open

%define OPEN_FLAGS 66
%define OPEN_PERMISSIONS 420
%define CHAR_NEWLINE 10

%macro grace 0
section .rodata
    file_str db "./Grace_kid.s", 0
    code_str db "symbols: %1$c %2$c %3$s", 0
section .text
main:
    ;;  new stack frame
    enter 0,0
    mov rdi, file_str
    mov rsi, OPEN_FLAGS
    mov rdx, OPEN_PERMISSIONS
    mov rax, 0
    call open
    ;;  dprintf fd: hardcode to 1
    mov rdi, rax                ; rax holds open retval
    lea rsi, [rel code_str]
    mov rdx, CHAR_NEWLINE
    mov rcx, 34
    lea r8, [rel code_str]
    call dprintf
    leave
    ret
%endmacro

    insert grace
