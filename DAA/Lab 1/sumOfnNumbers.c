#include<stdio.h>

void main() {
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    int sum = 0;
    for(int i=1; i<=num; i++) {
        sum += i;
    }
    printf("%d", sum);
}