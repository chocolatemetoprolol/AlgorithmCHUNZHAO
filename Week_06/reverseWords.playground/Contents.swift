import UIKit
//https://leetcode-cn.com/problems/reverse-words-in-a-string/

class Solution {
    func reverseWords(_ s: String) -> String {
        var s = s.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        return s
    }


    //翻转指定范围的字符
    func _reverseStr( _ chars:inout [Character], _ startIndex:Int, _ endIndex:Int){

     var startIndex = startIndex
     var endIndex = endIndex

     if startIndex <= endIndex {

      let tempChar = chars[endIndex]
      chars[endIndex] = chars[startIndex]
      chars[startIndex] = tempChar

      startIndex += 1
      endIndex -= 1

      _reverseStr(&chars,startIndex,endIndex)

     }

    }

    //逐字翻转字符串
    func reverseWordss(_ str:String) -> String{
     var str = str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
     var chars = Array(str)

     //首先翻转整个字符串所有字符,"the sky is blue" -> "eulb si yks eht"
     _reverseStr(&chars,0,chars.count-1)

     //然后翻转每个单词中的字符，"eulb si yks eht" -> "blue is sky the"
     var startIndex = 0
     for endIndex in 0 ..< chars.count {
      if endIndex == chars.count - 1 || chars[endIndex + 1] == " " {
       _reverseStr(&chars, startIndex, endIndex)
       startIndex = endIndex + 2
      }
     }
     print("String(chars)",String(chars))
     return String(chars)
    }

//    reverseWordss("the sky is blue") //return "blue is sky the"
}

let so = Solution()
so.reverseWordss("  hello world!   ")

