class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var chars = Array(s)
        var left = 0
        var right = s.count - 1

        while left < right {
            while !(chars[left].isLetter || chars[left].isNumber), left < right {
                left += 1
            }

            while !(chars[right].isLetter || chars[right].isNumber), right > left {
                right -= 1
            }

            print("\(chars[left]) : \(chars[right])")
            guard chars[left].lowercased() == chars[right].lowercased() else {
                return false
            }

            left += 1
            right -= 1
        }

        return true
    }
}
