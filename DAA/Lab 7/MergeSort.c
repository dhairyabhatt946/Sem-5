#include<stdio.h>

void merge(int arr[], int low, int mid, int high) {
    int temp[high-low];
    int k = 0;
    int i = low, j = mid + 1;
    
    while(i <= mid && j <= high) {
        if(arr[i] <= arr[j]) {
            temp[k++] = arr[i++];
        }
        else {
            temp[k++] = arr[j++];
        }
    }
    
    for(int m=i; m<=mid; m++) {
        temp[k++] = arr[m];
    }
    for(int m=j; m<=high; m++) {
        temp[k++] = arr[m];
    }
    
    int n = low;
    for(int m=0; m<=high-low; m++) {
        arr[n++] = temp[m];
    }
    
}

void mergeSort(int arr[], int low, int high) {
    if(low >= high) return;
    int mid = (low + high) / 2;
    mergeSort(arr, low, mid);
    mergeSort(arr, mid + 1, high);
    merge(arr, low, mid, high);
}

void main() {
    int n;
    printf("Enter the size of array: ");
    scanf("%d", &n);
    int arr[n];

    for(int i=0; i<n; i++) {
        printf("Enter element at index %d: ", i);
        scanf("%d", &arr[i]);
    }
    printf("Before sorting:\n");
    for(int i=0; i<n; i++) {
        printf("%d ", arr[i]);
    }
    mergeSort(arr, 0, n-1);
    printf("\nAfter sorting:\n");
    for(int i=0; i<n; i++) {
        printf("%d ", arr[i]);
    }
}