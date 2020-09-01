;; simple bootloader, will be updated

global loader
extern kernelmain
MODULEALIGN equ 1<<0
MEMINFO equ 1<<1
FLAGS equ MODULEALIGN | MEMINFO
MNUM equ 0x1BADB002
CHECKSUN equ -(MNUM + FLAGS)

section .text
align 4
multiBootHeader:
dd MNUM
dd FLAGS
dd CHECKSUM

STACKSIZE equ 0x400

loader:
mov esp, stack+STACKSIZE
push eax
push ebx

call kernelmain

cli

hang:
hlt
jmp hang

section .bss
align 4
stack:
resb STACKSIZE
