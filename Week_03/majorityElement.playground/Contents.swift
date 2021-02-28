import UIKit

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        return majorityElementRec(nums, 0, nums.count - 1)
        var count = 0
        var candidate = 0
        for num in nums {
            if count == 0 {
                candidate = num
            }
            count = count + ((num == candidate) ? 1 : -1)
        }
        return candidate
    }

    func majorityElementRec(_ nums: [Int],_ start:Int,_ end:Int) -> Int {
        if start == end {
            return nums[start]
        }
        let mid  = (end - start) / 2 + start;
        let left   = majorityElementRec(nums, start, mid)
        let right = majorityElementRec(nums, mid + 1, end)
        if left == right {
           return left
        }
        let leftCount = countInRange(nums, start, end, left)
        let rightCount = countInRange(nums, start, end, right)
        return leftCount  > rightCount ? left : right
    }

    func countInRange(_ nums: [Int],_ start:Int,_ end:Int,_ num:Int) -> Int {
        var count = 0
        for i in start..<end+1 {
            if nums[i] == num {
                count = count + 1
            }
        }
        return count
    }
}

let so = Solution()
so.majorityElement([6,5,5,5])
