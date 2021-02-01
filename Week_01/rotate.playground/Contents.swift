import UIKit

func rotate(_ nums: inout [Int], _ k: Int) {
    let len = nums.count;
    let kn = k % len;
    if kn == 0 {
        return
    }
    reverse(&nums, 0, len-1)
    reverse(&nums, 0, kn-1)
    reverse(&nums, kn, len-1)
    print("nums \(nums)")
}

func reverse (_ nums: inout [Int], _ l: Int,_ r: Int) {
    var ll = l
    var rr = r
    while (ll < rr) {
        let temp = nums[ll]
        nums[ll] = nums[rr]
        nums[rr] = temp
        ll += 1
        rr -= 1
    }
}

func rotateQ(_ nums: inout [Int], _ k: Int) {
    let len = nums.count;
    var count = 0;
    var begin = 0;
    while count < len {
        var cur =  begin
        var pre = nums[cur];
        repeat {
            cur =  (cur + k) % len
            count += 1
            let temp = nums[cur]
            nums[cur] = pre
            pre = temp
        } while (cur != begin)
        begin += 1
    }
    print("nums \(nums)")
}
