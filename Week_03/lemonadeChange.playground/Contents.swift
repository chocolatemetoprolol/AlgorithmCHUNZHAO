import UIKit

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        //找零只有5,15,钞票只有 5 10 20
        var fiveNum = 0
        var tenNum = 0
        for bill in bills {
            switch bill {
            case 10:
                fiveNum -= 1
                tenNum += 1
            case 20:
                if tenNum > 0 {
                    fiveNum -= 1
                    tenNum -= 1
                }else {
                    fiveNum -= 3
                }
            default:
                fiveNum += 1
            }
            if fiveNum < 0 || tenNum < 0 {
                return false
            }
        }
        return true
    }
}

let so = Solution()
so.lemonadeChange([5,5,10])
