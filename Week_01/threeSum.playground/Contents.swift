import UIKit

/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 示例 1：
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 示例 2：
 输入：nums = []
 输出：[]
 示例 3：
 输入：nums = [0]
 输出：[]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        var numsCopy = nums
        var result = [[Int]]()
        numsCopy.sort {return $0 < $1}
        for i in 0...numsCopy.count - 1 {
            if numsCopy[i] > 0 {
                return result
            }
            if i > 0 && numsCopy[i] == numsCopy[i-1] {
                continue//去重
            }
            let center = numsCopy[i]
            var left = i+1
            var right = numsCopy.count - 1
            while left < right {
                let sum = numsCopy[left] + numsCopy[right] + center
                if sum == 0 {
                    let arr = [center, numsCopy[left], numsCopy[right]]
                    result.append(arr)
                    while left < right && numsCopy[left] == numsCopy[left+1] {
                        left += 1//左去重
                    }
                    while left < right && numsCopy[right] == numsCopy[right - 1] {
                        right -= 1//右去重
                    }
                    left += 1
                    right -= 1
                } else if sum > 0{
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return result
    }
}

let so = Solution()
let res = so.threeSum([-1,0,1,2,-1,-4])
print(res)
