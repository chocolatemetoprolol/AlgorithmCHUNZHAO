import UIKit

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var res = isConnected
        let count = res.count
        var num = 0
        var visited = [Bool](repeating: false, count: count)
        for i in 0..<res.count {
            if !visited[i] {
                dfs(&res, i, &visited)
                num = num + 1
            }
        }
        print(num,res)
        return num
    }

    func dfs(_ isConnected: inout [[Int]],_ i:Int,_ visited: inout [Bool]) -> Void {
        visited[i] = true
        for j in 1..<isConnected.count {
            if isConnected[i][j] == 1 && !visited[j] {
                dfs(&isConnected, j, &visited)
            }
        }
    }
}

let  so = Solution()
so.findCircleNum([[1,1,0],[1,1,0],[0,0,1]])
