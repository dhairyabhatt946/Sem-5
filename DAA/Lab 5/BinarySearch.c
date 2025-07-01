#include<stdio.h>
#include<time.h>

int binarySearch(int arr[], int n, int x) {
    int left = 0, right = n - 1;
    while (left <= right) {
        int mid = (left + right) / 2;
        if(arr[mid] == x) return mid;
        else if(x < arr[mid]) right = mid - 1;
        else left = mid + 1;
    }
    
    return -1;
}

int binarySearchRecusrsive(int arr[], int n, int left, int right, int x) {
    if(left > right) return -1;
    int mid = (left + right) / 2;
    if(arr[mid] == x) return mid;
    else if (x < arr[mid]) return binarySearchRecusrsive(arr, n, left, mid - 1, x);
    else return binarySearchRecusrsive(arr, n, mid + 1, right, x);
}

void main() {
    FILE *file;
    clock_t start, end;
    double cpu_time_used;
    int arr[100];
    int n = 100;
    file = fopen("best_100.txt", "r");
    for(int i=0; i<n; i++) {
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    // best case
    start = clock();
    binarySearch(arr, n, 50);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken for best case: %f\n", cpu_time_used);
    // average case
    start = clock();
    binarySearch(arr, n, 75);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken for average case: %f\n", cpu_time_used);
    // worst case
    start = clock();
    binarySearch(arr, n, 100);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken for worst case: %f\n", cpu_time_used);
}