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
command_str db "nasm -f elf64 %1$s ; gcc %1$.7s.o -o %1$.7s ; rm %1$.7s.o ; ./%1$.7s ", 0
file_str db "Sully_%d.s", 0
code_str db "; cool comment%1$cglobal main%1$cextern dprintf%1$cextern sprintf%1$cextern close%1$cextern open%1$cextern system%1$csection .bss%1$cbuf resb 256%1$csection .data%1$coutput db %2$cverylongstrusedasoutput%2$c, 0%1$ccommand_str db %2$cnasm -f elf64 %5$c1$s ; gcc %5$c1$.7s.o -o %5$c1$.7s ; rm %5$c1$.7s.o ; ./%5$c1$.7s %2$c, 0%1$cfile_str db %2$cSully_%5$cd.s%2$c, 0%1$ccode_str db %2$c%3$s%2$c, 0%1$cindex dq %4$d%1$csection .text%1$cmain:%1$c;;  new stack frame%1$center 0,0%1$cxor rax, rax%1$clea rdi, output%1$clea rsi, file_str%1$cmov rdx, [index]%1$c;; sprintf(output, file_str, index)%1$ccall sprintf%1$c%1$ccmp qword [index], 0%1$cjl ret_0%1$cpush rbp%1$cmov rbp, rsp%1$cpush 37%1$cxor rax, rax%1$cmov rdi, output%1$cmov rsi, 66%1$cmov rdx, 420%1$cmov rax, 0%1$c;; open(output, O_RDWR |[...], 0644)%1$ccall open%1$c%1$cdec qword [index]%1$cmov rdi, rax%1$clea rsi, [rel code_str]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel code_str]%1$cmov r9, [index]%1$c;; dprintf(fd=3, code_str, \n, %2$c, code_str)%1$ccall dprintf%1$c%1$cxor rax, rax%1$cmov rdi, buf%1$cmov rsi, command_str%1$cmov rdx, output%1$c;; sprintf(buf, command_str, output)%1$ccall sprintf%1$c%1$cxor rax, rax%1$cmov rdi, buf%1$c;; system(buf)%1$ccall system%1$cleave%1$cxor rax, rax%1$cadd rsp, 8%1$cret%1$c%1$cret_0:%1$cxor rax, rax%1$cret%1$c", 0
index dq 5
section .text
main:
;;  new stack frame
enter 0,0
xor rax, rax
lea rdi, output
lea rsi, file_str
mov rdx, [index]
;; sprintf(output, file_str, index)
call sprintf

cmp qword [index], 0
jl ret_0
push rbp
mov rbp, rsp
push 37
xor rax, rax
mov rdi, output
mov rsi, 66
mov rdx, 420
mov rax, 0
;; open(output, O_RDWR |[...], 0644)
call open

dec qword [index]
mov rdi, rax
lea rsi, [rel code_str]
mov rdx, 10
mov rcx, 34
lea r8, [rel code_str]
mov r9, [index]
;; dprintf(fd=3, code_str, \n, ", code_str)
call dprintf

xor rax, rax
mov rdi, buf
mov rsi, command_str
mov rdx, output
;; sprintf(buf, command_str, output)
call sprintf

xor rax, rax
mov rdi, buf
;; system(buf)
call system
leave
xor rax, rax
add rsp, 8
ret

ret_0:
xor rax, rax
ret
