import UIKit
/**
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 示例 1：
 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 示例 2：
 输入：head = []
 输出：[]
 示例 3：
 输入：head = [1]
 输出：[1]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/**
 * Definition for singly-linked list.
 */

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
          return iteration(head)
    }

    func iteration(_ head: ListNode?) -> ListNode? {
        let pre = ListNode(0)
        pre.next = head
        var temp = pre
        while temp.next != nil && temp.next?.next != nil {
            var start = temp.next//start前进一位，指向1节点
            var end = temp.next?.next//end前进两位，指向2节点
            //这步很关键，tmp指针用来处理边界条件的
            //假设链表是1->2->3->4，start指向1，end指向2
            //改变start和end的指向，于是就变成2->1
            //循环迭代的时候一次处理2个节点
            temp.next = end//temp指向end
            start?.next = end?.next//start 指向 end
            end?.next = start// end 指向 start
            temp = start as! ListNode// 0 2 1 4 3
        }
        return pre.next// pre = 0 2 1 4 3 pre.next = 2 1 4 3
    }

    func recursion(_ head: ListNode?) -> ListNode? {
        //递归的终止条件
        if head == nil || head?.next == nil {
           return head
        }
        //假设链表是 1->2->3->4
        //这句就先保存节点2
        let newHead = head?.next
        //继续递归，处理节点3->4
        //当递归结束返回后，就变成了4->3
        //于是head节点就指向了4，变成1->4->3
        head?.next = recursion(newHead?.next)
        //将2节点指向1,变成了2->1->4->3
        newHead?.next = head
        return newHead
    }
}

let so = Solution()
let four = ListNode(4)
let three = ListNode(3,four)
let two = ListNode(2,three)
let one = ListNode(1,two)
so.swapPairs(one)
