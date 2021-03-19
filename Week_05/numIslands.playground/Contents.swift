import UIKit

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else {
           return -1
        }
        var res = grid
        var count = 0
        for i in 0..<res.count  {
            for j in 0..<res[0].count {
                if res[i][j] == "1" {
                    dfs(&res, i, j)
                    count = count + 1
                }
            }
        }
        print(res)
        return count
    }

    func dfs(_ grid: inout [[Character]],_ r:Int,_ c:Int) -> Void {
        if !inArea(grid, r, c) {
            return
        }
        if (grid[r][c] != "1") {
            return;// 如果这个格子不是岛屿，直接返回
       }
        grid[r][c] = "2"; // 将格子标记为「已遍历过」
        // 访问上、下、左、右四个相邻结点
        dfs(&grid, r - 1, c);
        dfs(&grid, r + 1, c)
        dfs(&grid, r, c - 1)
        dfs(&grid, r, c + 1)
    }

    // 判断坐标 (r, c) 是否在网格中
    func inArea(_ grid: [[Character]],_ r:Int,_ c:Int) -> Bool {
        return r >= 0 && r < grid.count
        && c >= 0 && c < grid[0].count;
    }
}

let  so = Solution()
so.numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
