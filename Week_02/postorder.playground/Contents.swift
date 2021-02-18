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
    // 递归
    func postorder(_ root: Node?) -> [Int] {
        guard let  root = root else {
            return []
        }
        var array = [Int]()
        traversal(root, &array)
        return array
    }

    func traversal(_ root: Node, _ array: inout [Int]) {
           for node in root.children {
              traversal(node, &array)
           }
           array.append(root.val)
    }

    func postorderDfs(_ root: Node?) -> [Int] {
        if root == nil { return [] }
        var ans: [Int] = []
        func dfs(_ root: Node?) {
            if root == nil { return }
            for c in root!.children {
                dfs(c)
            }
            ans.append(root!.val)
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

class TreeNode: NSObject {
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    override init() {}

    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BinaryTree {
    ///二叉树的前序遍历  根结点-->左子树-->右子树
    ///给定二叉树的根节点 root ，返回它节点值的 前序 遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var list: [Int] = []
        list.append(root.val)
        list += preorderTraversal(root.left)
        list += preorderTraversal(root.right)
        return list
    }
    ///二叉树的中序遍历 左子树-->根结点-->右子树
    ///给定一个二叉树的根节点 root ，返回它的 中序 遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var list: [Int] = []
        list += inorderTraversal(root.left)
        list.append(root.val)
        list += inorderTraversal(root.right)
        return list
    }
    ///二叉树的后序遍历 左子树-->右子树-->根结点
    ///给定一个二叉树的根节点 root，返回它的 后序 遍历
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var list: [Int] = []
        list += postorderTraversal(root.left)
        list += postorderTraversal(root.right)
        list.append(root.val)
        return list
    }

}
//已知前序遍历序列和中序遍历序列，可以唯一确定一棵二叉树
//已知后序遍历序列和中序遍历序列，可以唯一确定一棵二叉树
let binary = BinaryTree()
let b = TreeNode(val: 3, left: nil, right: nil)
let a = TreeNode(val: 2, left: b, right: nil)
let root = TreeNode(val: 1, left: b, right: a)
binary.preorderTraversal(root)
binary.inorderTraversal(root)
binary.postorderTraversal(root)

