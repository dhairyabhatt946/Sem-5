#include<stdio.h>

void main() {
    int n;
    printf("Enter total number of objects: ");
    scanf("%d", &n);

    float value[n], weight[n], ratio[n];
    float capacity, totalProfit = 0.0;

    for(int i=0; i<n; i++) {
        printf("Enter value of object %d: ", (i+1));
        scanf("%f", &value[i]);
        printf("Enter weight of object %d: ", (i+1));
        scanf("%f", &weight[i]);
        ratio[i] = value[i] / weight[i];
    }

    printf("Enter the capacity of knapsack: ");
    scanf("%f", &capacity);

    for(int i=0; i<n-1; i++) {
        int swapped = 0;
        for(int j=0; j<n-i-1; j++) {
            if(ratio[j] < ratio[j+1]) {
                float temp = ratio[j];
                ratio[j] = ratio[j+1];
                ratio[j+1] = temp;

                temp = value[j];
                value[j] = value[j+1];
                value[j+1] = temp;

                temp = weight[j];
                weight[j] = weight[j+1];
                weight[j+1] = temp;

                swapped = 1;
            }
        }
        if(swapped == 0) break;
    }

    for(int i=0; i<n; i++) {
        if(weight[i] <= capacity) {
            totalProfit += value[i];
            capacity -= weight[i];
        }
        else {
            totalProfit += value[i] * (capacity / weight[i]);
        }
    }

    printf("Total profit = %f", totalProfit);
}