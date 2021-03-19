import UIKit

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
           return n
        }
        var dp = [Int](repeating: 0, count: 3)
        dp[1] = 1
        dp[2] = 2
        for _ in 3..<n+1 {
            let sum = dp[1] + dp[2]
            dp[1] = dp[2]
            dp[2] = sum
        }
        return dp[2];
    }
}

//class Solution {
//    public int climbStairs(int n) {
//        double sqrt_5 = Math.sqrt(5);
//        double fib_n = Math.pow((1 + sqrt_5) / 2, n + 1) - Math.pow((1 - sqrt_5) / 2,n + 1);
//        return (int)(fib_n / sqrt_5);
//    }
//}
/**
 class Solution {
 public:
     int climbStairs(int n) {
         int p = 0, q = 0, r = 1;
         for (int i = 1; i <= n; ++i) {
             p = q;
             q = r;
             r = p + q;
         }
         return r;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/climbing-stairs/solution/pa-lou-ti-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 public class Solution {
     public int climbStairs(int n) {
         int[][] q = {{1, 1}, {1, 0}};
         int[][] res = pow(q, n);
         return res[0][0];
     }

     public int[][] pow(int[][] a, int n) {
         int[][] ret = {{1, 0}, {0, 1}};
         while (n > 0) {
             if ((n & 1) == 1) {
                 ret = multiply(ret, a);
             }
             n >>= 1;
             a = multiply(a, a);
         }
         return ret;
     }

     public int[][] multiply(int[][] a, int[][] b) {
         int[][] c = new int[2][2];
         for (int i = 0; i < 2; i++) {
             for (int j = 0; j < 2; j++) {
                 c[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j];
             }
         }
         return c;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/climbing-stairs/solution/pa-lou-ti-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

let so = Solution()
so.climbStairs(9)

/**
 链接：https://leetcode-cn.com/problems/climbing-stairs/solution/pa-lou-ti-by-leetcode-solution/
https://leetcode-cn.com/problems/climbing-stairs/solution/70-pa-lou-ti-dong-tai-gui-hua-jing-dian-a3na7
 */
