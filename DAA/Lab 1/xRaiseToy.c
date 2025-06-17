#include<stdio.h>

void main() {
    int x, y;
    printf("Enter x: ");
    scanf("%d", &x);
    printf("Enter y: ");
    scanf("%d", &y);
    int res = 1;
    for(int i=1; i<=y; i++) {
        res *= x;
    }
    printf("%d", res);
}