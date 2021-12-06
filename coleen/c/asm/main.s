	section .data
code:	 db "cool str"

section .text
global	main

main:
	push	rax
	mov	edi,
	mov	esi, 1
	xor	eax, eax
	call	printf
	xor	eax, eax
	pop	rcx
	ret
