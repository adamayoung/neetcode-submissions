class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }

        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + ((right - left) / 2)
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return -1
    }
}
