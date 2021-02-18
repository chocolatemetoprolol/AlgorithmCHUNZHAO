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

    func levelBFS(_ root: Node?) -> [[Int]] {
        var list  = [[Int]]()
        guard let root = root else { return list }
        var currentLevelNodes = [Node]()
        currentLevelNodes.append(root)
        while currentLevelNodes.count > 0 {
            var level = [Int]()
            for _ in currentLevelNodes {
                let node = currentLevelNodes[0]
                level.append(node.val)
                currentLevelNodes.removeFirst()
                currentLevelNodes.append(contentsOf: node.children)
            }
            list.append(level)
        }
        print("list",list)
        return list
    }

    func levelOrder(_ root: Node?) -> [[Int]] {
        var list  = [[Int]]()
        guard let root = root else { return list }
        traverseNode(root, 0, &list)
        print("list-->",list)
        return list
    }

    func traverseNode(_ root:Node?,_ level:Int,_ list:inout [[Int]]) -> [[Int]] {
        guard let root = root else { return list }
        if list.count == level {
           list.append([])
        }
        list[level].append(root.val)
        for child in root.children {
             traverseNode(child, level + 1,&list)
        }
        return list
    }
}

let node = Solution()
let nodeo = Node.init(14)
let nodep = Node.init(13)
let nodel = Node.init(12)
let nodem = Node.init(11)
let nodej = Node.init(10)
let nodek = Node.init(9)
let nodeh = Node.init(8)
let nodeg = Node.init(7)
let nodef = Node.init(6)
let nodee = Node.init(5)
let noded = Node.init(4)
let nodec = Node.init(2)
let nodeb = Node.init(3)
let nodea = Node.init(1)
nodea.children = [nodec,nodeb,noded,nodee]//2345
nodeb.children = [nodef,nodeg]//3->6 7
noded.children = [nodeh]//4->8
nodee.children = [nodek,nodej]//5->9 10
nodej.children = [nodem]//10->11
nodem.children = [nodel,nodep]//11->12 13
nodep.children = [nodeo]//13->14
node.levelOrder(nodea)
//node.levelBFS(nodea)
