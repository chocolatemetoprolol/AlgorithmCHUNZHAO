import UIKit

class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        guard start.count > 0 && end.count>0 && bank.count > 0 else {
            return -1//排除为空
        }
        guard bank.contains(end) else {
             return -1//排除极端情况，end不在基因库中
        }
        return bfsD(start, end, bank)
    }

    func dfs(_ start: String, _ end: String, _ bank: [String]) -> Int {
            var bankSet = Set(bank)
            var minStep = Int.max
            func backtrack(_ step: Int, _ current: String) {
                if step >= minStep {
                    return
                }
                if current == end {
                    minStep = step
                }
                for gene in bankSet {
                    var diffCount = 0
                    for index in 0..<gene.count {
                        if [Character](gene)[index] != [Character](current)[index] { diffCount += 1 }
                        if diffCount > 1 { break }
                    }
                    if diffCount == 1 {
                        bankSet.remove(gene)
                        backtrack(step + 1, gene)
                        bankSet.insert(gene)
                    }
                }
            }
            backtrack(0, start)
            return minStep == Int.max ? -1 : minStep
    }

    func bfsD(_ start: String, _ end: String, _ bank: [String]) -> Int {
        let set = Set<String>(bank)
        var mp = [String]()
        var step = 0
        let alphabet = "ACGT"//字母表
        var front = [start] //前向队列
        var back = [end]  //后向队列
        while front.count > 0 && back.count > 0 {
             step = step + 1
            // 每次判断正向是否比负向的元素更多。我们选择元素更小的那个继续更新。
            if front.count > bank.count {
                swap(&front, &back)
            }
            for item in front {
                var tempWord = Array(item)
                for i in (0..<tempWord.count) {
                    let oldChar = tempWord[i]
                    for j in alphabet {
                        if j == oldChar {
                           continue
                        }
                        tempWord[i] = j
                        let newS = String(tempWord)
                        if back.contains(newS) {
                           return step//匹配就返回
                        } else if(set.contains(newS) && !mp.contains(newS)){
                            mp.append(newS)//匹配到字母表且没有添加过
                        }
                    }
                    tempWord[i] = oldChar
                }
            }
            front = mp
            mp.removeAll()
        }
        return -1
    }
}

let so = Solution()
so.minMutation("AAAAACCC", "AACCCCCC", ["AAAACCCC","AAACCCCC","AACCCCCC"])
