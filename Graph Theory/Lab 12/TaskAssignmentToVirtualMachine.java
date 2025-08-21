import java.util.Scanner;

public class TaskAssignmentToVirtualMachine {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the number of virtual machines: ");
        int virtualMachines = sc.nextInt();
        System.out.print("Enter the number of tasks: ");
        int tasks = sc.nextInt();

        int[][] virtualMachine = new int[virtualMachines][2];
        int[][] task = new int[tasks][2];
        int[][] cost = new int[virtualMachines][tasks];

        for(int i=0; i<virtualMachines; i++) {
            System.out.print("Enter cpu for virtual machine " + (i+1) + ": ");
            virtualMachine[i][0] = sc.nextInt();
            System.out.print("Enter memory for virtual machine " + (i+1) + ": ");
            virtualMachine[i][1] = sc.nextInt();
        }

        for(int i=0; i<tasks; i++) {
            System.out.print("Enter cpu for task " + (i+1) + ": ");
            task[i][0] = sc.nextInt();
            System.out.print("Enter memory for task " + (i+1) + ": ");
            task[i][1] = sc.nextInt();
        }

        for(int i=0; i<virtualMachines; i++) {
            System.out.println("For virtual machine " + (i+1) +":");
            for(int j=0; j<tasks; j++) {
                System.out.print("Cost for task " + (j+1) + ": ");
                cost[i][j] = sc.nextInt();
            }
        }
        sc.close();

        for(int i=0; i<tasks; i++) {
            int currentCost = task[i][0];
            int currentMemory = task[i][1];
            int minIndex = -1;
            int min = Integer.MAX_VALUE;
            for(int j=0; j<virtualMachines; j++) {
                if(currentCost <= virtualMachine[j][0] && currentMemory <= virtualMachine[j][1] && cost[j][i] < min) {
                    min = cost[j][i];
                    minIndex = j;
                }
            }
            if(minIndex != -1) {
                virtualMachine[minIndex][0] -= currentCost;
                virtualMachine[minIndex][1] -= currentMemory;
                System.out.println("Task " + (i+1) + " is assigned to machine " + (minIndex+1));
            }
            else {
                System.out.println("Task " + (i+1) + " cannot be assigned to any machine");
            }
        }
    }
}