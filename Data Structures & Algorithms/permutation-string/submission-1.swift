class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var s1CharCount: [Character: Int] = [:]
        for char in s1 {
            s1CharCount[char, default: 0] += 1
        }

        var s2CharCount: [Character: Int] = [:]
        var chars = Array(s2)
        for i in 0..<chars.count {
            let char = chars[i]
            s2CharCount[char, default: 0] += 1
            if i >= s1.count {
                let removeChar = chars[i - s1.count]
                s2CharCount[removeChar, default: 1] -= 1
                if s2CharCount[removeChar] == 0 {
                    s2CharCount.removeValue(forKey: removeChar)
                }
            }

            if s1CharCount == s2CharCount {
                return true
            }
        }

        return false
    }
}
