import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class BFS {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of vertices: ");
        int n = sc.nextInt();
        ArrayList<ArrayList<Integer>> adjacencyList = new ArrayList<>();

        for(int i=0; i<n; i++) {
            adjacencyList.add(new ArrayList<>());
            int j = 1;
            System.out.println("For vertex "+i+" enter edge: ");
            System.out.println("Enter vertex "+j+" or -1 to quit: ");
            int ver = sc.nextInt();
            while (ver >= 0) {
                adjacencyList.get(i).add(ver);
                j++;
                System.out.println("Enter vertex "+j+" or -1 to quit: ");
                ver = sc.nextInt();
            }
        }
        System.out.println(adjacencyList);
        Queue<Integer> queue = new LinkedList<>();
        boolean[] visited = new boolean[n];
        ArrayList<Integer> result = new ArrayList<>();
        queue.add(0);
        visited[0] = true;
        while (!queue.isEmpty()) {
            int node = queue.poll();
            result.add(node);
            for(int i=0; i<adjacencyList.get(node).size(); i++) {
                int temp = adjacencyList.get(node).get(i);
                if(visited[temp] != true) {
                    queue.add(temp);
                    visited[temp] = true;
                }
            }
        }
        System.out.println(result);
        sc.close();
    }
}
