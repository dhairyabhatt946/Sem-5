#include<stdio.h>

int sumOfnNumbers(int num) {
    if(num == 0) {
        return 0;
    }
    else {
        return num + sumOfnNumbers(num - 1);
    }
}

void main() {
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    int sum = sumOfnNumbers(num);
    printf("%d", sum);
}