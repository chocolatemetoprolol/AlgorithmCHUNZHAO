import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numberIndexDict = [Int:Int]()
    // 遍历数组
    for (index, num) in nums.enumerated() {
        // 判断字典中是否存在key = target - num
        guard let pairedIndex = numberIndexDict[target - num] else {
            // 把自身放入hash表
            numberIndexDict[num] = index
            continue
        }
        // 配对的数已存在
        return [pairedIndex, index]
    }
    return [-1,-1]
}
var twoSumQ:[Int] = [2,7,2,7]
let num = twoSum(twoSumQ, 9)
print("num--",num)
