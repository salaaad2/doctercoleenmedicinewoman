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
code_str db "; cool comment%1$cglobal main%1$cextern dprintf%1$cextern close%1$cextern open%1$c%4$cdefine OPEN_FLAGS 66%1$c%4$cdefine OPEN_PERMISSIONS 420%1$c%4$cdefine CHAR_NEWLINE 10%1$c%4$cmacro grace 0%1$csection .rodata%1$cfile_str db %2$c./Grace_kid.s%2$c, 0%1$ccode_str db %2$c%3$s%2$c, 0%1$csection .text%1$cmain:%1$c;;  new stack frame%1$center 0,0%1$cmov rdi, file_str%1$cmov rsi, OPEN_FLAGS%1$cmov rdx, OPEN_PERMISSIONS%1$cmov rax, 0%1$ccall open%1$cmov rdi, rax%1$clea rsi, [rel code_str]%1$cmov rdx, CHAR_NEWLINE%1$cmov rcx, 34%1$clea r8, [rel code_str]%1$cmov r9, 37%1$ccall dprintf%1$cleave%1$cret%1$c%4$cendmacro%1$cinsert grace%1$c", 0
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
mov rcx, 34
lea r8, [rel code_str]
mov r9, 37
call dprintf
leave
ret
%endmacro
insert grace
