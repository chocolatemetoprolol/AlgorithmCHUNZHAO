import UIKit

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count > 0 else {
               return 0
        }
        let arr = Array(s)
        let size = arr.count
        var big = 0
        var dp = [Int](repeating: 0, count: size)
        for i in 1..<size {
            if arr[i] == ")" {
                if arr[i-1] == "("{
                   dp[i] = 2
                    if i-2 >= 0 {
                        dp[i] = dp[i]+dp[i-2]
                    }
                } else if(dp[i-1] > 0) {
                    let lastSingleIndex = i - dp[i-1] - 1
                    if lastSingleIndex >= 0 && arr[lastSingleIndex] == "(" {
                        dp[i]=dp[i-1]+2;
                        if(lastSingleIndex-1>=0) {
                            dp[i]=dp[i]+dp[lastSingleIndex-1];
                        }
                    }
                }
            }
            big = max(big,dp[i]);
        }
        return big
    }
}

let so = Solution()
so.longestValidParentheses(")(()")

/**
 链接：https://leetcode-cn.com/problems/longest-valid-parentheses
 */
