import UIKit

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n != 0 else { return 0 }
        var a = 0
        var b = 0
        var c = 0
        var items = [1]
        for item in 1..<n {
            let n2 = items[a] * 2, n3 = items[b] * 3, n5 = items[c] * 5;
            items.append(min(n2, n3, n5))
            if items[item] == n2 {
                a = a + 1
            }
            if items[item] == n3 {
                b = b + 1
            }
            if items[item] == n5 {
                c = c + 1
            }
        }
        return items[n - 1];
    }
}

let bin = Solution()
bin.nthUglyNumber(10)
