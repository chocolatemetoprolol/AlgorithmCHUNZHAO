import UIKit
/**
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 示例 1：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 示例 2：
 输入：height = [1,1]
 输出：1
 示例 3：
 输入：height = [4,3,2,1,4]
 输出：16
 示例 4：
 输入：height = [1,2,1]
 输出：2
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/container-with-most-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var maxWater = 0
        while left < right {
            maxWater = max(maxWater, (right - left) * min(height[left], height[right]))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxWater
    }
}

let so = Solution()
so.maxArea([1,8,6,2,5,4,8,3,7])
