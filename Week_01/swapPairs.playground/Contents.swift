import UIKit
/**
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 注意：给定 n 是一个正整数。
 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
           return n
        }
        var dp = [Int](repeating: 0, count: 3)
        dp[1] = 1
        dp[2] = 2
        for _ in 3..<n+1 {
            let sum = dp[1] + dp[2]
            dp[1] = dp[2]
            dp[2] = sum
        }
        return dp[2];
    }
}
/**
 The problem seems to be a dynamic programming one. Hint: the tag also suggests that!
 Here are the steps to get the solution incrementally.
 Base cases:
 if n <= 0, then the number of ways should be zero.
 if n == 1, then there is only way to climb the stair.
 if n == 2, then there are two ways to climb the stairs.
 One solution is one step by another; the other one is two steps at one time.
 The key intuition to solve the problem is that given a number of stairs n, if we know the number ways to get to the points [n-1] and [n-2] respectively, denoted as n1 and n2 , then the total ways to get to the point [n] is n1 + n2. Because from the [n-1] point, we can take one single step to reach [n]. And from the [n-2] point, we could take two steps to get there.
 The solutions calculated by the above approach are complete and non-redundant. The two solution sets (n1 and n2) cover all the possible cases on how the final step is taken. And there would be NO overlapping among the final solutions constructed from these two solution sets, because they differ in the final step.
 Now given the above intuition, one can construct an array where each node stores the solution for each number n. Or if we look at it closer, it is clear that this is basically a fibonacci number, with the starting numbers as 1 and 2, instead of 1 and 1.
 The implementation in Swift as follows:
 */
func climbStairs(_ n: Int) -> Int {
    guard n > 2 else {
        return n
    }
    var one_step_before = 2
    var two_steps_before = 1
    var all_ways = 0
    for i in 2..<n {
        all_ways = one_step_before + two_steps_before;
        two_steps_before = one_step_before;
        one_step_before = all_ways;
    }
    return all_ways
}
climbStairs(3)
