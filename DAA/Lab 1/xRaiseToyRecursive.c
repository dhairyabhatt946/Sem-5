#include<stdio.h>

int xRaiseToy(int x, int y) {
    if(y == 1) {
        return x;
    }
    else {
        return x * xRaiseToy(x, y-1);
    }
}

void main() {
    int x, y;
    printf("Enter x: ");
    scanf("%d", &x);
    printf("Enter y: ");
    scanf("%d", &y);
    int res = xRaiseToy(x, y);
    printf("%d", res);
}