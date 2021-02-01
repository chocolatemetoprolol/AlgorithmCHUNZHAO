import UIKit

func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
  var start = m
  if start > nums1.count {
     start = nums1.count - 1
  }
  nums1 = (nums1[0..<start] + nums2).sorted()
  print(nums1)
}

func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // 初始化三个指针
    var index1 = m - 1 // 表示第一个数组最后元素的下标
    var index2 = n - 1 // 表示第二个数组最后元素的下标
    var currentIndex = nums1.count - 1 // 表示当前放置元素的下标
    // 当 index2 < 0 时，就说明第二个数组中的元素全部合并到了第一个数组
    while index2 >= 0 {
        if (index1 >= 0 && (nums2[index2] < nums1[index1])) {
            nums1[currentIndex] = nums1[index1]
            index1 = index1 - 1
            currentIndex = currentIndex - 1
        }else { // index1 < 0 || nums2[index2] >= nums1[index1]
            nums1[currentIndex] = nums2[index2]
            index2 = index2 - 1
            currentIndex = currentIndex - 1
        }
    }
}

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    //双指针
    var mm = m
    var nn = n
    if mm >= nums1.count {
        mm = nums1.count - 1
    }
    if nn >= nums2.count {
        nn = nums2.count - 1
    }
    var c1 = mm - 1
    var c2 = nn - 1
    var index = mm + nn - 1
    while c1 >= 0 && c2 >= 0 {
        let numA = nums1[c1]
        let numB = nums2[c2]
        if numA > numB {
             nums1[index] = numA
            c1 -= 1
        } else {
            nums1[index] = numB
            c2 -= 1
        }
        index -= 1
    }
    if c2 >= 0 {
        nums1.replaceSubrange(0..<c2 + 1, with: nums2[0..<c2 + 1])
    }
}

var oneQ:[Int] = [1,2,3,0,0,0]
var oneQQ:[Int] = [2,5,6]
merge(&oneQ, 8, oneQQ, 3)
