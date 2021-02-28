import UIKit

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var gSort = g
        gSort.sort()
        var sSort = s
        sSort.sort()
        var res = 0
        var index = 0
        for i in sSort {
            if index < gSort.count && gSort[index] <= i {
               index += 1
               res += 1
            }
        }
        return res
    }
}

let so = Solution()
so.findContentChildren([1,3,2], [1,1])
