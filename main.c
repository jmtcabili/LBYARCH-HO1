#include <stdio.h>
#include <stdlib.h>

extern void flipVerticall(unsigned int*** img2,
                          unsigned int img1[3][3][3],
                          unsigned int m,
                          unsigned int n);

int main(){

    unsigned int m = 3, h = 3; 
    unsigned int inputArray[3][3][3] = {
                                {
                                    {1, 2, 3},
                                    {4, 5, 6},
                                    {7, 8, 9}
                                }, 
                                {
                                    {10, 11, 12},
                                    {13, 14, 15},
                                    {16, 17, 18}
                                },
                                {
                                    {19, 20, 21},
                                    {22, 23, 24},
                                    {25, 26, 27}
                                }
    };
    
    unsigned int*** outputArray = (unsigned int***)malloc(m*sizeof(unsigned int**)); 
    for (int i = 0; i < m; i++){
        outputArray[i] = (unsigned int **)malloc(h * sizeof(unsigned int*));
        for (int j = 0; j < h; j++){
            outputArray[i][j] = (unsigned int*)malloc(3 * sizeof(unsigned int));
        }
    }
    flipVerticall(outputArray, inputArray, m, h);

    outputArray[0][0][0] = 0; 
    for (int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
            for (int k = 0; k < 3; k++){
                printf("%d ", outputArray[i][j][k]);
            }
            printf("\n"); 
        }
        
    }

    
    return 0; 
}

/*
references

https://stackoverflow.com/questions/2438142/dynamic-memory-allocation-for-3d-array
*/