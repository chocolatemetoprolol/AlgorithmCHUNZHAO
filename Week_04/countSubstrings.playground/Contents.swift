import UIKit

class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard  s.count > 0 else {
                  return 0
        }
        let chars = Array(s)
        let count = chars.count
        var nums = 0;
        var dp = Array(repeating: false, count: count)
        for j in 0..<count {
            for i in 0..<j+1 {
                if chars[i] == chars[j] && (j - i < 2 || dp[i + 1]){
                    dp[i] = true
                    nums += 1
                } else {
                    dp[i] = false
                }
            }
        }
        return nums
    }
}

let so = Solution()
so.countSubstrings("aaa")
