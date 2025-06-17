#include<stdio.h>

void main() {
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    if(num == 0) {
        printf("digits: %d", 1);
    }
    else {
        int digits = 0;
        while (num != 0)
        {
            digits++;
            num /= 10;
        }
        printf("digits: %d", digits);
    }
}