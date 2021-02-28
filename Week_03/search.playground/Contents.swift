import UIKit

class Solution {

    func search(_ nums: [Int], _ target: Int) -> Int {
        let count = nums.count
        if count == 0 {
            return -1
        }
        if count == 1 {
            return nums[0] == target ?0:1
        }
        var start = 0, end = count - 1;
        while start <= end {
            let mid = (start + end) / 2;//中间的索引值
            if (nums[mid] == target) {//取数组的中间值和target比较 如果相等返回索引值
                return mid;
            }
            //按中间分为2个分组 判断是左半段还是右半段
            if (nums[0] <= nums[mid]) {
                //如果target在范围内 则缩小结束位置 反之增加开始位置
                if (nums[0] <= target && target < nums[mid]) {
                    end = mid - 1;
                } else {
                    start = mid + 1;
                }
            } else {
                    if (nums[mid] < target && target <= nums[count - 1]) {
                        start = mid + 1;
                    } else {
                        end = mid - 1;
                    }
            }
        }
        return -1;
    }
}

let so = Solution()
so.search([4,5,6,7,0,1,2], 0)
