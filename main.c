#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern void flipVerticall(uint8_t img2[3][3][3],
                          uint8_t img1[3][3][3],
                          int m,
                          int h);

int main(){

    int m = 3, h = 3; 
    uint8_t inputArray[3][3][3] = {
                                {
                                    {1, 2, 3},
                                    {4, 5, 6},
                                    {7, 8, 9}
                                }, 
                                {
                                    {1, 2, 6},
                                    {2, 6, 7},
                                    {9, 4, 8}
                                }, 
                                {
                                    {1, 5, 7},
                                    {1, 3, 3},
                                    {3, 4, 6}
                                }
                                
    };
    
    uint8_t outputArray[3][3][3] = {0}; 

    flipVerticall(outputArray, inputArray, m, h);

     
    for (int i = 0; i < m; i++){
        for(int j = 0; j < h; j++){
            printf("[");
            for (int k = 0; k < 3; k++){
                printf("%d ", outputArray[i][j][k]);
            }
            printf("\b] ");            
        }
        printf("\n");
    }

    
    return 0; 
    /*


        push 24 bytes for m*h times 
        mov stack pointer 16 bytes back then pop thrice (repeat for m*h times)

        
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
    
    mov r10, r8
    imul r10, r9
    imul r10, 3
    
    
    loop_start: 
        cmp r10, 0
        jz loop_end
        
        mov rax, [rdx]
        mov [rcx], rax
        add rdx, 1
        add rcx, 1
        dec r10
        jmp loop_start
    loop_end:
        
    ret
    */
}

/*
references

https://stackoverflow.com/questions/2438142/dynamic-memory-allocation-for-3d-array
*/