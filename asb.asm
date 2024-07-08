
section .text
bits 64
default rel
global flipVerticall
flipVerticall:
    ;write your code here
    
    ;rcx -> output array
    ;rdx -> input array
    ;r8 -> width
    ;r9 -> height
    
    mov r10, r8
    imul r10, r9
    imul r10, 3
    
    
    loop_start: 
        cmp r10, 0
        jz loop_end
        
        mov rax, [rdx]
        mov [rcx], rax
        add rdx, 8 
        add rcx, 8
        dec r10
        jmp loop_start
    loop_end:
        
    ret