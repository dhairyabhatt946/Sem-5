import java.util.Scanner;

public class MinMax {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the size of array: ");
        int n = sc.nextInt();
        int[] array = new int[n];

        for(int i=0; i<n; i++) {
            System.out.println("Enter element at index " + i);
            array[i] = sc.nextInt();
        }

        int min = array[0], max = array[0];

        for(int i=0; i<n; i++) {
            if(array[i] > max) {
                max = array[i];
            }
            if(array[i] < min) {
                min = array[i];
            }
        }

        System.out.println("Max = "+max+" and Min = "+min);
        sc.close();
    }
}
