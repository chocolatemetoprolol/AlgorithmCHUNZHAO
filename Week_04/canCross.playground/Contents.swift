import UIKit

class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        guard stones.count > 0 else {
            return true
        }
        let size = stones.count
        var array2D = [[Bool]](repeating: [Bool](repeating: false, count: size+1), count: size)
        array2D[0][1] = true
        for i in 1..<size {
            for j in 0..<i {
                let diff = stones[i] - stones[j]// 直接计算可能的diff值
                if(diff < 0 || diff > size || !array2D[j][diff]) {
                    continue;
                }
                array2D[i][diff] = true;
                if(diff - 1 >= 0) {
                    array2D[i][diff - 1] = true;
                }
                if(diff + 1 <= size) {
                    array2D[i][diff + 1] = true;
                }
                if(i == size - 1) {
                    return true;
                }
            }
        }
        return false
    }
}

let so = Solution()
so.canCross([0,1,3,5,6,8,12,17])
