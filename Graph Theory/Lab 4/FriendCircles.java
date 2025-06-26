import java.util.Scanner;

public class FriendCircles {

    public static void dfs(int[][] adjMatrix, boolean[] visited, int person) {
        visited[person] = true;
        for (int friend = 0; friend < adjMatrix.length; friend++) {
            if (adjMatrix[person][friend] == 1 && !visited[friend]) {
                dfs(adjMatrix, visited, friend);
            }
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of people: ");
        int n = sc.nextInt();
        int[][] adjacencyMatrix = new int[n][n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.println("Enter element at adjacencyMatrix[" + i + "][" + j + "]: ");
                adjacencyMatrix[i][j] = sc.nextInt();
            }
        }

        boolean[] visited = new boolean[n];
        int friendCircles = 0;

        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                dfs(adjacencyMatrix, visited, i);
                friendCircles++;
            }
        }

        System.out.println("Number of friend circles: " + friendCircles);
        sc.close();
    }
}
