#include<stdio.h>

void main() {
    int v;
    printf("Enter the number of vertices: ");
    scanf("%d", &v);

    int graph[v][v];
    for(int i=0; i<v; i++) {
        for(int j=0; j<v; j++) {
            printf("Enter the cost of edge between vertices %d and %d: ", i, j);
            scanf("%d", &graph[i][j]);
        }
    }
    int edges = 0, min_cost = 0;
    int visited[v];
    visited[0] = 1;

    printf("Edges\tCost\n");
    while(edges < v - 1) {
        int x, y, min = __INT_MAX__;
        for(int i=0; i<v; i++) {
            if(visited[i] == 1) {
                for(int j=0; j<v; j++) {
                    if(visited[j] == 0 && graph[i][j] != 0) {
                        if(graph[i][j] < min) {
                            x = i;
                            y = j;
                            min = graph[i][j];
                        }
                    }
                }
            }
        }
        printf("%d - %d\t%d\n", x, y, min);
        min_cost += min;
        visited[y] = 1;
        edges++;
    }
    printf("Total edges = %d\n", edges);
    printf("Minimum cost = %d", min_cost);
}