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
command_str db "nasm -f elf64 %1$s ; clang %.7s.o -o %1$.7s ; ./%1$.7s", 0
file_str db "Sully_%d.s", 0
code_str db " %1$c \
; cool comment %1$c \
global main %1$c \
extern dprintf %1$c \
extern sprintf %1$c \
extern close %1$c \
extern open %1$c \
extern system %1$c \
section .bss %1$c \
buf resb 256 %1$c \
section .data %1$c \
output db %2$cverylongstrusedasoutput%2$c, 0 %1$c \
command_str db %2$cnasm -f elf64 Sully_4.s ; clang Sully_4.o -o Sully_4 ; ./Sully_4%2$c, 0 %1$c \
file_str db %2$cSully_%d.s%2$c, 0 %1$c \
code_str db %2$c%3$s%2$c, 0 %1$c \
index dq %4$d %1$c \
section .text %1$c \
main: %1$c \
    ;;  new stack frame %1$c \
    enter 0,0 %1$c \
    dec qword [index] %1$c \
    xor rax, rax %1$c \
    lea rdi, output %1$c \
    lea rsi, file_str %1$c \
    mov rdx, [index] %1$c \
    ;; sprintf(output, file_str, index) %1$c \
    call sprintf %1$c \
 %1$c \
    xor rax, rax %1$c \
    mov rdi, output %1$c \
    mov rsi, 66 %1$c \
    mov rdx, 420 %1$c \
    mov rax, 0 %1$c \
    ;; open(output, O_RDWR |[...], 0644) %1$c \
    call open %1$c \
 %1$c \
    mov rdi, rax %1$c \
    lea rsi, [rel code_str] %1$c \
    mov rdx, 10 %1$c \
    mov rcx, 34 %1$c \
    lea r8, [rel code_str] %1$c \
    mov r9, [index] %1$c \
    call dprintf %1$c \
 %1$c \
    xor rax, rax %1$c \
    cmp qword [index], 0 %1$c \
    jne compile_and_run %1$c \
    leave %1$c \
    ret %1$c \
 %1$c \
compile_and_run: %1$c \
    mov rdi, buf %1$c \
    mov rsi, command_str %1$c \
    mov rdx, output %1$c \
    ;; sprintf(buf, command_str, output) %1$c \
    call sprintf %1$c \
 %1$c \
    xor rax, rax %1$c \
    mov rdi, buf %1$c \
    ;; system(buf) %1$c \
    call system %1$c \
    xor rax, rax %1$c \
    leave %1$c \
    ret", 0
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
