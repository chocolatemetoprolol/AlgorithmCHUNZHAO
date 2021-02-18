import UIKit

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var list: [Int] = []
        list.append(root.val)
        list += preorderTraversal(root.left)
        list += preorderTraversal(root.right)
        return list
    }
}

let binary = Solution()
let b = TreeNode(3, nil, nil)
let a = TreeNode(2, b, nil)
let root = TreeNode(1, b, a)
binary.preorderTraversal(root)
