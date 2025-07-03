import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class MirrorTree {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of nodes: ");
        int n = sc.nextInt();
        int[] input = new int[n];

        for(int i=0; i<n; i++) {
            System.out.println("Enter element for node "+(i+1)+": ");
            input[i] = sc.nextInt();
        }
        sc.close();
        System.out.println("Input array: "+Arrays.toString(input));
        TreeNode root = constructTree(input, 0);
        System.out.println("");
        preorder(root);
        System.out.println();
        if(isMirrorTree(root)) {
            System.out.println("Mirror Tree");
        }
        else {
            System.out.println("Not Mirror Tree");
        }
    }

    public static TreeNode constructTree(int[] input, int i) {
        TreeNode root = null;
        if(i < input.length) {
            root = new TreeNode(input[i]);
            root.left = constructTree(input, 2*i+1);
            root.right = constructTree(input, 2*i+2);
        }
        return root;
    }

    public static void preorder(TreeNode root) {
        if(root == null) return;
        System.out.print(root.val+" ");
        preorder(root.left);
        preorder(root.right);
    }

    public static boolean isMirrorTree(TreeNode root) {
        if(root.left == null && root.right == null) return true;
        if(root.left == null || root.right == null) {
            return false;
        }
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root.left);
        queue.add(root.right);

        while(!queue.isEmpty()) {
            TreeNode node1 = queue.poll();
            TreeNode node2 = queue.poll();
            if(node1.val != node2.val) return false;
            if((node1.left == null && node2.right != null) || (node1.left != null && node2.right == null)) {
                return false;
            }
            if(node1.left != null) {
                queue.add(node1.left);
                queue.add(node2.right);
            }
            if((node1.right == null && node2.left != null) || (node1.right != null && node2.left == null)) {
                return false;
            }
            if(node1.right != null) {
                queue.add(node1.right);
                queue.add(node2.left);
            }
        }
        return true;
    }
}

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    public TreeNode(int val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}