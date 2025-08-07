import java.util.ArrayList;
import java.util.List;


public class DominantSets {
    public static void main(String[] args) {
        int N = 4;
        int[][] edges = {
            {1, 2},
            {1, 3},
            {3, 4},
            {2, 4}
        };
        
        List<List<Integer>> dominantSet = new ArrayList<>();
        
        List<List<Integer>> result = generateIncreasingSequences(N);
        for (List<Integer> seq : result) {
            if(isDominantSet(edges, seq)) {
                dominantSet.add(seq);
            }
        }
        
        System.out.println(dominantSet);
    }

    public static boolean isDominantSet(int[][] edges, List<Integer> set) {
        boolean[] arr = new boolean[edges.length];
        
        for(int i=0; i<arr.length; i++) {
            arr[i] = false;
        }

        for(int i=0; i<set.size(); i++) {
            int u = set.get(i);
            arr[u-1] = true;

            for(int j=0; j<edges[u-1].length; j++) {
                int v = edges[u-1][j];
                arr[v-1] = true;
            }
        }

        for(int i=0; i<arr.length; i++) {
            if(arr[i] == false) {
                return false;
            }
        }

        return true;
    }
    
    public static List<List<Integer>> generateIncreasingSequences(int N) {
        List<List<Integer>> result = new ArrayList<>();

        int max = 1 << N;
        for (int mask = 1; mask < max; mask++) {
            List<Integer> current = new ArrayList<>();
            int prevDigit = 0;
            boolean isIncreasing = true;

            for (int i = 0; i < N; i++) {
                if ((mask & (1 << i)) != 0) {
                    int digit = i + 1;

                    if (digit <= prevDigit) {
                        isIncreasing = false;
                        break;
                    }

                    current.add(digit);
                    prevDigit = digit;
                }
            }

            if (isIncreasing) {
                result.add(current);
            }
        }

        return result;
    }
}
