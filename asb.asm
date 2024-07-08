
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
    
    
    mov rax, r8
    imul rax, r9
    imul rax, 3
    add rax, rdx
    sub rax, 3          ;rax points to last three byte
    
    mov rbx, rdx        ;rbx points to first three bytes
    
    L1: 
        cmp rax, rbx
        jz L2
        
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
        
        
        add rbx, 3      ;edx points to next set of 3 bytes on upper half
        sub rax, 3      ;ecx points to next set of 3 bytes on lower half
        
        jmp L1          ;jump back to L1
    
    L2:                 ;rdx has flipped version at this point
    
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