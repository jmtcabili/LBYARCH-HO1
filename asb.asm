
section .text
bits 64
default rel
global flipVerticall
flipVerticall:
    ;write your code here
    
    ;rcx:  output array
    ;rdx:  input array
    ;r8 :  width
    ;r9 :  height
    
    mov r13, 0            ;r13: counter for columns passed
    mov r14, 0
    mov r15, 0
    
    mov rax, r8
    imul rax, r9
    imul rax, 3
    add rax, rdx         
    
    mov r14, r9
    imul r14, 3           ;r14: the number of bytes per column
    
    mov r15, r14
    imul r15, 2           ;r15: to offset two rows back
    
    sub rax, r14          ;rax points to first set of bytes in last row
    mov rbx, rdx          ;rbx points to first three bytes
    
    
    L1: 
        cmp rax, rbx
        jle L2            ;check if rax and rbx have met
        
        ;load bytes 
        mov r11b, [rax]   ;first byte of lower row
        mov r12b, [rbx]   ;first byte of upper row
        
        mov[rax], r12b    ;swap bytes
        mov[rbx], r11b    ;swap bytes
        
        mov r11b, [rax+1] ;second byte of lower row
        mov r12b, [rbx+1] ;second byte of upper row
        
        mov[rax+1], r12b  ;swap bytes
        mov[rbx+1], r11b  ;swap bytes
        
        mov r11b, [rax+2] ;third byte of lower row
        mov r12b, [rbx+2] ;third byte of upper row
        
        mov[rax+2], r12b  ;swap bytes
        mov[rbx+2], r11b  ;swap bytes
        inc r13           ;increment r13 every time 3 bytes on lower row have been swapped
        
        
        add rbx, 3        ;edx points to next set of 3 bytes on upper half      
        
        cmp r13, r9       ;check if all columns of a row have been passed
        jnz next          
        add rax, 3
        sub rax, r15      ;offset by two rows
        mov r13, 0
        
        jmp L1            ;reset loop
        
        next: 
        add rax, 3        ;ecx points to next set of 3 bytes on lower half
        jmp L1            ;jump back to L1
    
    L2:                   ;rdx has flipped version at this point
    
    mov r10, r8
    imul r10, r9
    imul r10, 3
    
    copy:               ;copy contents of rdx to rcx
        cmp r10, 0
        jz end
        
        mov rax, [rdx]
        mov [rcx], rax
        add rdx, 1
        add rcx, 1
        dec r10
        jmp copy
    end:
        
        
    ret