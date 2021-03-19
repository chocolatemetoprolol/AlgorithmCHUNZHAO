import UIKit

public class TreeNode {
    public var  val:String//当前得到的字符串
    public var left: Int//剩余左括号数量
    public var right: Int//剩余右括号数量
    public init() { self.val = ""; self.left = 0; self.right = 0; }
    public init(_ val: String) { self.val = val; self.left = 0; self.right = 0; }
    public init(_ val: String, _ left: Int, _ right: Int) {
         self.val = val
         self.left = left
         self.right = right
    }
}

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n != 0 else {
             return [""]
        }
        guard n != 1 else {
             return ["()"]
        }
        var res = [String]()
//        dy(n, &res)
        dfs("", n, n, &res)
//        let node = TreeNode("",n,n)
//        bfs(&res,node)
//        bfsD(node, node, &res)
        print("res-->",res)
        return res
    }
    /**
         * @param curStr 当前递归得到的结果
         * @param left   左括号还有几个可以使用
         * @param right  右括号还有几个可以使用
         * @param res    结果集
    */
    func dfs(_ curStr:String,_ left:Int,_ right:Int,_ res: inout [String]) -> Void {
        if left == 0 && right == 0{
            res.append(curStr)
            return
        }
        if left > right {
            return
        }
        if left > 0 {
            dfs(curStr+"(", left-1, right, &res)
        }
        if right > 0 {
            dfs(curStr+")", left, right-1, &res)
        }
    }
   /**
        * @param start 开始节点
        * @param res    结果集
   */
    func bfs(_ res: inout [String],_ start: TreeNode) -> Void {
        var queue = [start]
        while !queue.isEmpty {
            let node = queue.popLast()
            if node?.left == 0  && node?.right == 0{
                res.append(node!.val)
            }
            if node!.left > 0 {
                queue.append(TreeNode(node!.val+"(",node!.left-1,node!.right))
            }
            if node!.right > 0 && node!.left < node!.right{
               queue.append(TreeNode(node!.val+")",node!.left,node!.right-1))
            }
        }
    }

    func bfsD(_ start: TreeNode, _ end: TreeNode, _ res: inout [String]) -> [String] {
        var front = [start] //前向队列
        var back = [end]  //后向队列
        while front.count > 0 && back.count > 0 {
            // 每次判断正向是否比负向的元素更多。我们选择元素更小的那个继续更新。
            if front.count > back.count {
                swap(&front, &back)
            }
            let node = front.popLast()
            if node?.left == 0  && node?.right == 0{
                res.append(node!.val)
            }
            if node!.left > 0 {
                front.append(TreeNode(node!.val+"(",node!.left-1,node!.right))
            }
            if node!.right > 0 && node!.left < node!.right{
               front.append(TreeNode(node!.val+")",node!.left,node!.right-1))
            }
        }
        return res
    }

    func dy(_ n: Int,_ res: inout [String]) -> Void {
        var  result = [[String]]()
        result.append([""])
        result.append(["()"])
        var dp = [String](repeating: "", count: n+1)
        dp[0] = ""
        dp[1] = "()"
        for i in 2..<n+1 {
            var temp = [String]()
            for j in 0..<i {
                let s1 = result[j]
                let s2 = result[i-1-j]
                for item1 in s1 {
                    for item2 in s2 {
                        let e = "(" + item1 + ")" + item2
                        temp.append(e)
                    }
                }
            }
            result.append(temp)
        }
        res = result[n]
    }
}

let so = Solution()
so.generateParenthesis(3)
