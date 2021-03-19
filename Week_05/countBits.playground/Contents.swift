import UIKit


class Solution {
    func countBits(_ num: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: num+1)
        for i in 0..<num + 1 {
            bits[i] = countOnes(i)
        }
        return bits
    }

    func countBitsD(_ num: Int) -> [Int] {
        if num <= 0 { return [0] }
        if num == 1 { return [0, 1] }
        if num == 2 { return [0, 1, 1] }
        var bits = [Int](repeating: 0, count: num+1)
        bits[0] = 0
        bits[1] = 1
        bits[2] = 1
        var highBit = 0
        for i in 2..<num + 1 {
            if ((i & (i - 1)) == 0) {
                highBit = i;
            }
            bits[i] = bits[i - highBit] + 1;
        }
        return bits
    }

    func countBitsD1(_ num: Int) -> [Int] {
        if num <= 0 { return [0] }
        if num == 1 { return [0, 1] }
        if num == 2 { return [0, 1, 1] }
        var dp = Array(repeating: 0, count: num+1)
        var currentIndexOf2 = 2
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1
        for i  in 3...num {
            if i == 2 * currentIndexOf2 {
                currentIndexOf2 *= 2
                dp[i] = 1
            } else {
                dp[i] = dp[i-currentIndexOf2] + 1
            }
        }
        return dp
    }

    func countOnes(_ x: Int) -> Int {
        var ones = 0;
        var xx = x
        while (xx > 0) {
             xx = xx&(xx-1)
            ones = ones + 1
        }
        return ones;
    }
}

let so = Solution()
so.countBitsD(5)

/**

 */
