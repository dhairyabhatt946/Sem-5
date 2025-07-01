#include<stdio.h>
#include<time.h>

int linearSearch(int arr[], int n, int x) {
    for(int i=0; i<n; i++) {
        if(arr[i] == x) return x;
    }
    return -1;
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
    linearSearch(arr, n, 1);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken for best case: %f\n", cpu_time_used);
    // average case
    start = clock();
    linearSearch(arr, n, 50);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken for average case: %f\n", cpu_time_used);
    // worst case
    start = clock();
    linearSearch(arr, n, 100);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken for worst case: %f\n", cpu_time_used);
}