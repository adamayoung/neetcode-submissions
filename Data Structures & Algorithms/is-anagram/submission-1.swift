class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }

        var charCounts: [Character: Int] = [:]
        for char in s {
            charCounts[char, default: 0] += 1
        }

        for char in t {
            if charCounts[char] == nil {
                return false
            }

            charCounts[char, default: 1] -= 1
            if charCounts[char] == 0 {
                charCounts.removeValue(forKey: char)
            }
        }

        return true
    }
}
