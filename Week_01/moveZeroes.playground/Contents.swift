import UIKit
/**
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 示例:
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/move-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    var j = 0
    for i  in 0..<count {
        if nums[i] != 0 {
            if i > j {//避免i=j 的情况
               nums.swapAt(i, j)
            }
            j += 1
        }
    }
}

var zeroes:[Int] = [5,1,0,3,12]
moveZeroes(&zeroes)
