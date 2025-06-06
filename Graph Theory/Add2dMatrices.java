import java.util.Scanner;

public class Add2dMatrices {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter number of rows: ");
        int rows = sc.nextInt();
        System.out.println("Enter number of columns: ");
        int cols = sc.nextInt();

        int[][] a = new int[rows][cols];
        int[][] b = new int[rows][cols];

        System.out.println("Enter elements for array a: ");
        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                System.out.println("Enter element at a["+i+"]["+j+"]: ");
                a[i][j] = sc.nextInt();
            }
        }
        System.out.println("Enter elements for array b: ");
        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                System.out.println("Enter element at b["+i+"]["+j+"]: ");
                b[i][j] = sc.nextInt();
            }
        }

        int[][] c = new int[rows][cols];
        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                c[i][j] = a[i][j] + b[i][j];
            }
        }

        System.out.println("Addition of a and b is: ");
        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                System.out.print(c[i][j]+" ");
            }
            System.out.println();
        }
        sc.close();
    }
}
