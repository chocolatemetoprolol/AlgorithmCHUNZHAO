import UIKit
//https://leetcode-cn.com/problems/reverse-words-in-a-string/

class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 || s == " " else {
            return ""
        }
        return s.split { $0.isWhitespace }.reversed().joined(separator: " ")
    }
}
//"  Bob    Loves  Alice   "
let so = Solution()
let word = so.reverseWords("  Bob    Loves  Alice   ")
print(word)
