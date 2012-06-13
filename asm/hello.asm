section .data

msg: db "Eat at Joe's!", 10
msg_len: equ $-msg

section .bss

section .text

global _start

_start:
    nop
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
