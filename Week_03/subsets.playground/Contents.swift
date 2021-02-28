import UIKit

class Solution {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        backtrack(nums: nums, i: 0, res: &res, temp: &temp)
        return res
    }

    func backtrack(nums: [Int],i:Int,res:inout [[Int]],temp:inout [Int]) -> Void {
        res.append(temp)
        for j in i..<nums.count {
            temp.append(nums[j])
            backtrack(nums: nums, i: j+1, res: &res,temp: &temp)
            temp.removeLast()
        }
    }
}

let so = Solution()
so.subsets([1,2,3])
