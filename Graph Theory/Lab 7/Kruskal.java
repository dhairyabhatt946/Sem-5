import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class Kruskal {
    public static void main(String[] args) {
        int[] parent = {0, 1, 2, 3};
        int[][] edges = {
            {0, 1, 10},
            {0, 2, 6},
            {0, 3, 5},
            {1, 3, 15},
            {2, 3, 4}
        };
        Arrays.sort(edges, (a, b) -> a[2] - b[2]);
        System.out.println(Arrays.deepToString(edges));
        Set<Integer> vertices = new HashSet<>();
        int i=0, cost = 0;
        while(vertices.size() != parent.length && i < edges.length) {
            int[] edge = edges[i];
            if(parent[edge[0]] != parent[edge[1]]) {
                System.out.println(edge[0] + " -> "+edge[1] + ": weight = " + edge[2]);
                parent[edge[0]] = parent[edge[1]];
                vertices.add(edge[0]);
                vertices.add(edge[1]);
                cost += edge[2];
            }
            i++;
        }
        System.out.println("Total cost after creating minimum spanning tree = "+cost);
    }
}