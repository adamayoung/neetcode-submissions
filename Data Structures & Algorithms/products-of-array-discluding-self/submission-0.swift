class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return [0]
        }

        var left = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            left[i] = left[i - 1] * nums[i - 1]
        }

        var right = Array(repeating: 1, count: nums.count)
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            right[i] = right[i + 1] * nums[i + 1]
        }

        var results = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            results[i] = left[i] * right[i]
        }

        return results
    }
}
