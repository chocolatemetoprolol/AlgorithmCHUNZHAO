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

let so = Solution()
so.climbStairs(9)
