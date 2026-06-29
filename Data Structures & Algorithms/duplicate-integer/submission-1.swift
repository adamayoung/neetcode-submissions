class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var numCounts: [Int: Int] = [:]
        for num in nums {
            if numCounts[num] != nil {
                return true
            }

            numCounts[num] = 1
        }

        return false
    }
}
