import UIKit

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var ans = 0
        for i in 1..<prices.count {
             ans += max(0, prices[i] - prices[i - 1])
        }
        return ans
    }

    func maxProfitDynamic(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        let count = prices.count
        var dp = 0,dp1 = -prices[0];
        for i in 1..<count {
             let newDp = max(dp, dp1 + prices[i])
             let newDp1 = max(dp1, dp - prices[i])
             dp = newDp
             dp1 = newDp1
        }
        return dp;
    }
}

let so = Solution()
so.maxProfit([7,6,4,3,1])
