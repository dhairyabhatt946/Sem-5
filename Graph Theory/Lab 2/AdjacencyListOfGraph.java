import java.util.Scanner;

public class AdjacencyListOfGraph {
    public static void main(String[] args) {
        Scanner sc =  new Scanner(System.in);

        System.out.println("Enter the number of vertices: ");
        int n = sc.nextInt();
        System.out.println("Enter the number of edges: ");
        int m = sc.nextInt();
        int[][] graph = new int[m][2];

        for(int i=0; i<m; i++) {
            System.out.println("For edge "+(i+1));
            System.out.println("Enter the starting vertex: ");
            int start = sc.nextInt();
            System.out.println("Enter the ending vertex");
            int end = sc.nextInt();
            graph[i][0] = start;
            graph[i][1] = end;
        }

        for(int i=0; i<n; i++) {
            System.out.print(i+" -> ");
            for(int j=0; j<m; j++) {
                if(graph[j][0] == i) {
                    System.out.print(graph[j][1]+" ");
                }
            }
            System.out.println();
        }
        sc.close();
    }
}