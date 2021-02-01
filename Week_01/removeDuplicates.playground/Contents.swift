import UIKit

public func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.isEmpty {
        return 0;
    }
    var p = 0;
    var q = 1
    while q < nums.count {
        if nums[p] != nums[q] {
            nums[p+1]  = nums[q]
            p += 1;
        }
        q += 1
    }
    return p + 1;
}
var someInts:[Int] = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates(&someInts);
