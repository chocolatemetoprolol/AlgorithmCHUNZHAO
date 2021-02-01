import UIKit

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
