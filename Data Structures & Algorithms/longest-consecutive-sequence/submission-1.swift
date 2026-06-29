class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet: Set<Int> = []

        for num in nums {
            numSet.insert(num)
        }

        var maxLength = 0
        for num in numSet {
            guard !numSet.contains(num - 1) else {
                continue
            }

            var currentNum = num
            var length = 0
            while numSet.contains(currentNum) {
                length += 1
                currentNum += 1
            }

            maxLength = max(maxLength, length)
        }

        return maxLength
    }
}
