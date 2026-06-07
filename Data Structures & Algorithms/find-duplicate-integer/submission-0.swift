class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        var slow = 0
        var fast = 0

        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast

        fast = 0
        while fast != slow {
            slow = nums[slow]
            fast = nums[fast]
        }

        return slow
    }
}
