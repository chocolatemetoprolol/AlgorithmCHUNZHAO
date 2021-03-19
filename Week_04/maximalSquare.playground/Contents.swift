import UIKit

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 || matrix[0].count > 0 else {
            return 0
        }
        let width = matrix[0].count;
        var maxSide = 0;
        var dp = Array(repeating: 0, count: width+1)
        for row in matrix {
            var northwest = 0; // 西北角、左上角
            for column in 0..<width {
                let nextNorthwest = dp[column + 1];
                if row[column] == "1" {
                    //Min(Min（左，上）,左上）+ 1
                    dp[column + 1] = min(min(dp[column], dp[column + 1]), northwest) + 1
                    //最大边长
                    maxSide = max(maxSide, dp[column + 1])
                } else {
                    dp[column + 1] = 0
                }
                northwest = nextNorthwest
            }
        }
        return maxSide * maxSide
    }
}

let so = Solution()
so.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
