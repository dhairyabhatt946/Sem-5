#include<stdio.h>

void fibonacci(int len, int first, int second) {
    if(len == 0) {
        return;
    }
    printf("%d ", first);
    fibonacci(len-1, first+second, first);
}

void main() {
    int len;
    printf("Enter number: ");
    scanf("%d", &len);
    fibonacci(len, 0, 1);
}