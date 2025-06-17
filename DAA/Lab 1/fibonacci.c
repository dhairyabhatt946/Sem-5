#include<stdio.h>

void main() {
    int len;
    printf("Enter number: ");
    scanf("%d", &len);
    int first = 0, second = 1;
    for(int i=1; i<=len; i++) {
        printf("%d ", first);
        int temp = first;
        first += second;
        second = temp;
    }
}