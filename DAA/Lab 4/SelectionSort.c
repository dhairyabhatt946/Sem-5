#include<stdio.h>

void selectionSort(int arr[], int n) {
    for(int i=0; i<n-1; i++) {
        int min = arr[i];
        int minIndex = i;
        for(int j=i+1; j<n; j++) {
            if(arr[j] < min) {
                min = arr[j];
                minIndex = j;
            }
        }
        if(minIndex != i) {
            arr[minIndex] = arr[i];
            arr[i] = min;
        }
    }
}

void main() {
    int n;
    printf("Enter the size of an array: ");
    scanf("%d", &n);
    int arr[n];

    for(int i=0; i<n; i++) {
        printf("Enter element at index %d: ", i);
        scanf("%d", &arr[i]);
    }

    printf("Before sorting:\n");
    for(int i=0; i<n; i++) {
        printf("%d, ", arr[i]);
    }

    selectionSort(arr, n);

    printf("\nAfter sorting:\n");
    for(int i=0; i<n; i++) {
        printf("%d, ", arr[i]);
    }
}