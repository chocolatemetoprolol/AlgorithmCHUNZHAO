import UIKit

/**
 *反转一个单链表。
 *示例:
 *输入: 1->2->3->4->5->NULL
 *输出: 5->4->3->2->1->NULL
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        return recursion(head)
    }

    func iteration(_ head: ListNode?) -> ListNode? {
         var pre:ListNode?
         var cur = head
         while cur != nil {
             var temp = cur?.next
             cur?.next = pre
             pre = cur
             cur = temp
        }
        return pre
    }

    func recursion(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
           return head
        }
        let newHead = recursion(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
}

let so = Solution()
let five = ListNode(5)
let four = ListNode(4,five)
let three = ListNode(3,four)
let two = ListNode(2,three)
let one = ListNode(1,two)
so.reverseList(one)
