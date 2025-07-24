import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Stack;

public class AdjacencyMatrix {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of vertices: ");
        int N = sc.nextInt();
        System.out.println("Enter the number of edges: ");
        int M = sc.nextInt();

        int arr[][] = new int[M][2];
        for(int i=0; i<M; i++) {
            System.out.println("Enter the source of edge " + (i + 1) + ": ");
            int source = sc.nextInt();
            System.out.println("Enter the destination of edge " + (i + 1) + ": ");
            int destination = sc.nextInt();
            arr[i][0] = source;
            arr[i][1] = destination;
        }
        System.out.println("Input array is: ");
        for(int i=0; i<M; i++) {
            System.out.println(arr[i][0] + " " + arr[i][1]);
        }

        int adjacencyMatrix[][] = new int[N][N];
        for(int i=0; i<M; i++) {
            int source = arr[i][0];
            int destination = arr[i][1];
            adjacencyMatrix[source][destination] = 1;
            adjacencyMatrix[destination][source] = 1;
        }
        System.out.println("Adjacency Matrix is: ");
        for(int i=0; i<N; i++) {
            for(int j=0; j<N; j++) {
                System.out.print(adjacencyMatrix[i][j] + " ");
            }
            System.out.println();
        }
        
        Stack<Integer> stack = new Stack<>();
        List<Integer> visisted = new ArrayList<>();
        stack.push(arr[0][0]);
        while(!stack.isEmpty()) {
            int temp = stack.pop();
            visisted.add(temp);
            for(int i=0; i<N; i++) {
                if(adjacencyMatrix[temp][i] == 1 && !visisted.contains(i)) {
                    stack.push(i);
                }
            }
        }
        if(visisted.size() == N) {
            System.out.println("The graph is connected!!");
        }
        else {
            System.out.println("The graph is not connected!!");
        }
        sc.close();
    }
}