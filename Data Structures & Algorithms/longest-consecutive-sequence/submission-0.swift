class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var seen: Set<Int> = []
        for num in nums {
            seen.insert(num)
        }

        var maxLength = 0
        for num in seen {
            guard !seen.contains(num - 1) else {
                continue
            }

            var length = 0
            var n = num
            while seen.contains(n) {
                length += 1
                n += 1
            }

            maxLength = max(maxLength, length)
        }

        return maxLength
    }
}
