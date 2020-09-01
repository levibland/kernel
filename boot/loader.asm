;; simple bootloader, will be updated

; very dumb, only prints X to the screen
mov ah, 0x0e
mov al, 'X'
int 0x10

jmp $

; allocate space for padding and the boot number
times 510-($-$$) db 0
dw 0xaa55
