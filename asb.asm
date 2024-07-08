
section .text
bits 64
default rel
global flipVerticall
flipVerticall:
    ;write your code here
    mov r10, r8
    imul r10, r9
    imul r10, 3
    loop_start: 
        cmp r10, 0
        je loop_end
        
        mov al, byte [rdx]
        mov byte[rcx], al
        add dl, 1 
        add cl, 1
        dec r10
    loop_end:
        
        
    ret