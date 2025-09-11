import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class HallCondition {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of vertices of set 1 of bipartite graph: ");
        int X = sc.nextInt();
        System.out.print("Enter number of vertices of set 2 of bipartite graph: ");
        int Y = sc.nextInt();
        int[][] adjacencyMatrix = new int[X][Y];
        
        for(int i=0; i<adjacencyMatrix.length; i++) {
            for(int j=0; j<adjacencyMatrix[i].length; j++) {
                System.out.print("Enter 1 if edge exists between x" + (i+1) + " and y" + (j+1) + " otherwise 0: ");
                adjacencyMatrix[i][j] = sc.nextInt();
            }
        }
        sc.close();

        Set<Integer> set = new HashSet<>();
        for(int i=0; i<adjacencyMatrix.length; i++) {
            for(int j=0; j<adjacencyMatrix[i].length; j++) {
                if(adjacencyMatrix[i][j] == 1) set.add(j);
            }
        }

        if(X <= set.size()) {
            System.out.println("Hall's condition is satisfied.");
        }
        else {
            System.out.println("Hall's condition is not satisfied.");
        }
    }
}