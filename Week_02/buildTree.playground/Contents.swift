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
    var indexMap = [Int:Int]();

    func myBuildTree(_ preorder: [Int], _ inorder: [Int],_ preorder_left:Int,_ preorder_right:Int,_ inorder_left:Int,_ inorder_right:Int) -> TreeNode? {
        if preorder_left > preorder_right {
            return nil
        }
        // 前序遍历中的第一个节点就是根节点
        // 在中序遍历中定位根节点
        guard let inorder_root = indexMap[preorder[preorder_left]] else { return nil }
        // 先把根节点建立出来
        let root = TreeNode(preorder[preorder_left],nil,nil)
        // 得到左子树中的节点数目
        let size_left_subtree = inorder_root - inorder_left
        // 递归地构造左子树，并连接到根节点
        // 先序遍历中「从 左边界+1 开始的 size_left_subtree」个元素就对应了中序遍历中「从 左边界 开始到 根节点定位-1」的元素
        root.left = myBuildTree(preorder, inorder, preorder_left + 1, preorder_left + size_left_subtree, inorder_left, inorder_root - 1)
        // 递归地构造右子树，并连接到根节点
        // 先序遍历中「从 左边界+1+左子树节点数目 开始到 右边界」的元素就对应了中序遍历中「从 根节点定位+1 到 右边界」的元素
        root.right = myBuildTree(preorder, inorder, preorder_left + size_left_subtree + 1, preorder_right, inorder_root + 1, inorder_right)
        return root
    }

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
           return nil
        }
        let n = preorder.count
        for index in 0..<n {
            indexMap[inorder[index]] = index
        }
        return myBuildTree(preorder, inorder, 0, n-1, 0, n-1)
    }
}

let binary = Solution()
binary.buildTree([3,9,20,15,7], [9,3,15,20,7])
