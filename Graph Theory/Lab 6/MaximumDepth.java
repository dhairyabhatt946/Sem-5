public class MaximumDepth {
    public static void main(String[] args) {
        int[] arr = {3, 9, 20, -1, -1, 15, 7};
        TreeNode root = createTree(arr, 0);
        System.out.println("Preorder:");
        preorder(root);
        int maxDepth = maximumDepth(root);
        System.out.println("\nMaximum depth is " + maxDepth);
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

    public static int maximumDepth(TreeNode root) {
        if(root == null) return 0;
        int leftDepth = maximumDepth(root.left);
        int rightDepth = maximumDepth(root.right);
        return Math.max(leftDepth, rightDepth) + 1;
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