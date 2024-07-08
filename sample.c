#include <stdio.h>


extern int asmvecsub(int n, int* vec1, int* vec2, int* vec3);

int main() {
    
    int vec1[] = {20, 30, 40, 50};
    int vec2[] = {9, 8, 7, 6};
    int* vec3 = (int*)malloc(4*sizeof(int));
    
    int n = 4;
    
    asmvecsub(n, vec1, vec2, vec3);

    
    for (int i = 0; i < n; i++) {
        printf("vec3[%d] = %d\n", i, vec3[i]);
    }

    return 0;
}

