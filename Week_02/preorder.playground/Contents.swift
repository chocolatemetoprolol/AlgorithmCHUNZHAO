import UIKit

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func postorderDfs(_ root: Node?) -> [Int] {
        if root == nil { return [] }
        var ans: [Int] = []
        func dfs(_ root: Node?) {
            if root == nil { return }
            ans.append(root!.val)
            for c in root!.children {
                dfs(c)
            }
        }
        dfs(root)
        print("list-",ans)
        return ans
    }
}

//[1,null,3,2,4,null,5,6]
let node = Solution()
let nodeg = Node.init(7)
let nodef = Node.init(6)
let nodee = Node.init(5)
let noded = Node.init(4)
let nodec = Node.init(2)
let nodeb = Node.init(3)
let nodea = Node.init(1)
nodea.children = [nodeb,nodec,noded]
nodeb.children = [nodee,nodef]
nodef.children = [nodeg]
node.postorderDfs(nodea)
