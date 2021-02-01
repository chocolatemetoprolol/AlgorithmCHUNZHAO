import UIKit

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;}
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2  == nil {
        return l1
    }
    if l1!.val < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    }
    l2?.next = mergeTwoLists(l1, l2?.next)
    return l2
}
var result111 = ListNode.init(4)
var result11 = ListNode.init(2,result111)
var result1 = ListNode.init(1,result11)

var result222 = ListNode.init(4)
var result22 = ListNode.init(3,result222)
var result2 = ListNode.init(1,result22)

var result3 = mergeTwoLists(result1, result2)
print("3~",result3?.val as Any,result3?.next?.val as Any,result3?.next?.next?.val as Any)
