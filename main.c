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

    int i,j,k;
     
    for (i = 0; i < m; i++){
        for(j = 0; j < h; j++){
            printf("[");
            for (k = 0; k < 3; k++){
                printf("%d ", outputArray[i][j][k]);
            }
            printf("\b] ");            
        }
        printf("\n");
    }

    
    return 0; 
}

