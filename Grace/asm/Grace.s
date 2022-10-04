; cool comment
global _main
extern _dprintf
extern _close

section .rodata
    %macro grace 0
    file_str db "./Grace_kid.c", 0
    code_str db "; cool comment%1$cglobal _main%1$cextern _printf%1$c%1$csection .rodata%1$ccode_str db %2$d%3$s%2$c, 0%1$c%1$csection .text%1$c_main:%1$center 0, 0%1$c; new stack frame%1$clea rdi, [rel code_str]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel code_str]%1$ccall _printf%1$cleave%1$c; leave it%1$ccall return%1$creturn:%1$cxor eax, eax%1$cret%1$c", 0
section .text
_main:
    ;;  new stack frame
    enter 0,0
    mov rdi, [rel file_str]
    mov rsi, 514
    mov rdx, 420
    ;;  dprintf fd: hardcode to 1
    mov rdi, [rax]                ; rax holds open retval
    lea rsi, [rel code_str]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel code_str]
    call _dprintf
    leave
    xor eax, eax
    ret
    %endmacro

    insert grace
