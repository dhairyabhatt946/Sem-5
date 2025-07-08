#include<stdio.h>
#include <time.h>

int pivot(int arr[], int i, int j) {
    int p = arr[i], k = i, l = j + 1;
    do {
        k++;
    } while(arr[k] <= p && k < j);
    do {
        l--;
    } while(arr[l] > p);
    while(k < l) {
        int temp = arr[k];
        arr[k] = arr[l];
        arr[l] = temp;
        do {
            k++;
        } while(arr[k] <= p);
        do {
            l--;
        } while(arr[l] > p);
    }
    int temp = arr[i];
    arr[i] = arr[l];
    arr[l] = temp;
    return l;
}

void quickSort(int arr[], int i, int j) {
    if(i < j) {
        int pivotIndex = pivot(arr, i, j);
        quickSort(arr, i, pivotIndex-1);
        quickSort(arr, pivotIndex+1, j);
    }
}

void generateBestCase(int arr[], int i, int j) {
    if(i < j) {
        int mid = (i + j) / 2;

        int temp = arr[i];
        arr[i] = arr[mid];
        arr[mid] = temp;

        generateBestCase(arr, i, mid-1);
        generateBestCase(arr, mid+1, j);
    }
}

void main() {
    // int n;
    // printf("Enter the size of array: ");
    // scanf("%d", &n);
    // int arr[n];
    // for(int i=0; i<n; i++) {
    //     printf("Enter element at index %d: ", i);
    //     scanf("%d", &arr[i]);
    // }
    // printf("Before Sorting:\n");
    // for(int i=0; i<n; i++) {
    //     printf("%d ", arr[i]);
    // }
    // quickSort(arr, 0, n-1);
    // printf("\nAfter Sorting:\n");
    // for(int i=0; i<n; i++) {
    //     printf("%d ", arr[i]);
    // }

    FILE *file;
    clock_t start, end;
    double cpu_time_used;
    int arr[100000];
    int n = 100000;
    file = fopen("best_100000.txt", "r");
    for(int i=0; i<n; i++) {
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    generateBestCase(arr, 0, n-1);
    printf("Best case 100000 scenario:\n");
    start = clock();
    quickSort(arr, 0, n-1);
    end = clock();
    cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    printf("Time taken to sort the array: %lf seconds\n", cpu_time_used);

    // file = fopen("average_100000.txt", "r");
    // for(int i=0; i<n; i++) {
    //     fscanf(file, "%d", &arr[i]);
    // }
    // fclose(file);
    // printf("Average case 100000 scenario:\n");
    // start = clock();
    // quickSort(arr, 0, n-1);
    // end = clock();
    // cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    // printf("Time taken to sort the array: %lf seconds\n", cpu_time_used);

    // file = fopen("worst_100000.txt", "r");
    // for(int i=0; i<n; i++) {
    //     fscanf(file, "%d", &arr[i]);
    // }
    // fclose(file);
    // printf("Worst case 100000 scenario:\n");
    // start = clock();
    // quickSort(arr, 0, n-1);
    // end = clock();
    // cpu_time_used = ((double)(end - start) / CLOCKS_PER_SEC);
    // printf("Time taken to sort the array: %lf seconds\n", cpu_time_used);
}