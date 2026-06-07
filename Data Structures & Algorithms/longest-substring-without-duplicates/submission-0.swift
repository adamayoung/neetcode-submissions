class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastSeen: [Character: Int] = [:]
        var maxLength = 0
        var start = 0

        for (i, char) in s.enumerated() {
            if let lastSeenIndex = lastSeen[char], lastSeenIndex >= start {
                start = lastSeenIndex + 1
            }

            lastSeen[char] = i
            maxLength = max(maxLength, i - start + 1)
        }

        return maxLength
    }
}
