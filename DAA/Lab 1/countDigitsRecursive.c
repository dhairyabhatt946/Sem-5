#include<stdio.h>

int countDigits(int num) {
    if(num == 0) {
        return 0;
    }
    else {
        return 1 + countDigits(num/10);
    }
}

void main() {
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    int digits;
    if (num == 0) {
        digits = 1;
    }
    else {
        digits = countDigits(num);
    }
    printf("%d", digits);
}