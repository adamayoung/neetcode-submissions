class Solution {
    func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else {
            return -1
        }

    return 0
    }

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else {
            return -1
        }

        let nums = nums.sorted(by: >)
        return nums[k - 1]
    }
}
