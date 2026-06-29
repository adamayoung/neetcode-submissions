class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seenNums: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            let diff = target - num
            if let j = seenNums[diff] {
                return [j, i]
            }

            seenNums[num] = i
        }

        return []
    }
}
