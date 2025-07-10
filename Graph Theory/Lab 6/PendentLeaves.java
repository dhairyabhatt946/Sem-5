import java.util.ArrayList;
import java.util.List;

public class PendentLeaves {
    public static void main(String[] args) {
        int[] arr = {3, 9, 20, -1, -1, 15, 7};
        TreeNode root = createTree(arr, 0);
        System.out.println("Preorder:");
        preorder(root);
        List<Integer> list = new ArrayList<>();
        pendentLeaves(list, root);
        System.out.println("\nPenden leaves are:\n" + list);
    }

    public static TreeNode createTree(int[] arr, int i) {
        TreeNode root = new TreeNode(arr[i]);
        if(2*i+1 < arr.length && arr[2*i+1] != -1) {
            root.left = createTree(arr, 2*i+1);
        }
        if(2*i+2 < arr.length && arr[2*i+2] != -1) {
            root.right = createTree(arr, 2*i+2);
        }
        return root;
    }

    public static void preorder(TreeNode root) {
        System.out.print(root.val+" ");
        if(root.left != null) preorder(root.left);
        if(root.right != null) preorder(root.right);
    }

    public static void pendentLeaves(List list, TreeNode root) {
        if(root == null) return;
        if(root.left == null && root.right == null) {
            list.add(root.val);
            return;
        }
        pendentLeaves(list, root.left);
        pendentLeaves(list, root.right);
    }
}

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    public TreeNode(int val) {
        this.val = val;
    }
}
