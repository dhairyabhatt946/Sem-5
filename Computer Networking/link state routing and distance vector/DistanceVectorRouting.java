import java.util.Arrays;

public class DistanceVectorRouting {

    // Represents a large value for infinity (unreachable)
    private static final int INF = 9999; 

    public static void main(String[] args) {
        // Example network topology (adjacency matrix with costs)
        // Rows and columns represent routers (0, 1, 2, 3)
        int[][] graph = {
            {0, 1, 3, INF},  // Router 0
            {1, 0, 1, 5},   // Router 1
            {3, 1, 0, 2},   // Router 2
            {INF, 5, 2, 0}   // Router 3
        };

        int numRouters = graph.length;

        // Routing table for each router: distance to destination
        int[][] routingTable = new int[numRouters][numRouters]; 
        // Next hop for each router: next hop to reach destination
        int[][] nextHop = new int[numRouters][numRouters]; 

        // Initialize routing tables
        for (int i = 0; i < numRouters; i++) {
            for (int j = 0; j < numRouters; j++) {
                routingTable[i][j] = graph[i][j]; // Direct cost
                if (i == j) {
                    nextHop[i][j] = i; // Self as next hop for self
                } else if (graph[i][j] != INF) {
                    nextHop[i][j] = j; // Direct neighbor
                } else {
                    nextHop[i][j] = -1; // No known next hop initially
                }
            }
        }

        boolean converged;
        do {
            converged = true;
            for (int i = 0; i < numRouters; i++) { // For each router 'i'
                for (int j = 0; j < numRouters; j++) { // For each possible destination 'j'
                    for (int k = 0; k < numRouters; k++) { // For each neighbor 'k' of 'i'
                        if (graph[i][k] != INF) { // If 'k' is a direct neighbor of 'i'
                            // Bellman-Ford equation: D_i(j) = min_k {C(i,k) + D_k(j)}
                            if (routingTable[i][j] > graph[i][k] + routingTable[k][j]) {
                                routingTable[i][j] = graph[i][k] + routingTable[k][j];
                                nextHop[i][j] = k; // Update next hop
                                converged = false; // Table updated, not converged yet
                            }
                        }
                    }
                }
            }
        } while (!converged); // Repeat until no more updates occur

        // Print final routing tables
        for (int i = 0; i < numRouters; i++) {
            System.out.println("Routing Table for Router " + i + ":");
            System.out.println("Destination\tCost\tNext Hop");
            for (int j = 0; j < numRouters; j++) {
                System.out.println(j + "\t\t" + routingTable[i][j] + "\t\t" + nextHop[i][j]);
            }
            System.out.println();
        }
    }
}