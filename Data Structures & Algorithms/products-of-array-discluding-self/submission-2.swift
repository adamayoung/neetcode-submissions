class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var left = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            left[i] = nums[i - 1] * left[i - 1]
        }

        var right = Array(repeating: 1, count: nums.count)
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            right[i] = nums[i + 1] * right[i + 1]
        }

        var result = Array(repeating: 1, count: nums.count)
        for i in 0..<nums.count {
            result[i] = left[i] * right[i]
        }

        return result
    }
}
