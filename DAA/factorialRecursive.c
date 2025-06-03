#include<stdio.h>

int factorial(int num) {
    if(num == 1) {
        return num;
    }
    else {
        return num * factorial(num - 1);
    }
}

void main() {
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    int fact = factorial(num);
    printf("%d", fact);
}