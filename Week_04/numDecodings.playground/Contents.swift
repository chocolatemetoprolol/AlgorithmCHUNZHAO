import UIKit

class Solution {
    func numDecodings(_ s: String) -> Int {
        let nums = s.map { $0.wholeNumberValue! }
        let n = nums.count
        if n == 0 || nums[0] == 0 { // 以0开头的无法解码
            return 0
        }
        var pre = 1, curr = 1
        for i in stride(from: 1, to: n, by: 1) {//顺序循环1至n（不包括n），依次递增1
            let temp = curr
            if nums[i] == 0 { // 当前位是0，需要判断i-1, 0必须要前置的1或者2进行结合，否则无法解码
                if nums[i-1] == 1 || nums[i-1] == 2 {
                    curr = pre
                } else {
                    return 0
                }
            } else if nums[i-1] == 1 || (nums[i-1] == 2 && nums[i] >= 1 && nums[i] <= 6) {
                curr += pre
            }
            pre = temp
        }
        return curr
    }
}
let so = Solution()
so.numDecodings("226")
