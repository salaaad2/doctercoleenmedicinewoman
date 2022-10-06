; cool comment
global main
extern dprintf
extern close
extern open
extern system
%define OPEN_FLAGS 66
%define OPEN_PERMISSIONS 420
%define CHAR_NEWLINE 10
%define CHAR_QUOTE 34
%define CHAR_PERCENT 37
section .rodata
index dw 5, 0
file_str db "./Sully_%d.s", 0
code_str db "; cool comment \
global main \
extern dprintf \
extern close \
extern open \
%4$cdefine OPEN_FLAGS 66 \
%4$cdefine OPEN_PERMISSIONS 420 \
%4$cdefine CHAR_NEWLINE 10 \
%4$cmacro grace 0 \
section .rodata \
file_str db %2$c./Grace_kid.s%2$c, 0 \
code_str db %2$c%3$s%2$c, 0 \
section .text \
main: \
;;  new stack frame \
enter 0,0 \
mov rdi, file_str \
mov rsi, OPEN_FLAGS \
mov rdx, OPEN_PERMISSIONS \
mov rax, 0 \
call open \
mov rdi, rax \
lea rsi, [rel code_str] \
mov rdx, CHAR_NEWLINE \
mov rcx, 34 \
lea r8, [rel code_str] \
mov r9, 37 \
call dprintf \
leave \
ret \
%4$cendmacro \
insert grace ", 0
section .text
main:
    ;;  new stack frame
    enter 0,0
    mov rdi, file_str
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
    leave
    ret
