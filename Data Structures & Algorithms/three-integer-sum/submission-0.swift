class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }

        let nums = nums.sorted()
        var results: [[Int]] = []
        for i in 0..<nums.count {
            if i > 0, nums[i] == nums[i - 1] {
                continue
            }

            var j = i + 1
            var k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum == 0 {
                    results.append([nums[i], nums[j], nums[k]])
                    j += 1
                    while j > k, nums[j] == nums[j - 1] {
                        j += 1
                    }
                    k -= 1
                    while k > j, nums[k] == nums[k + 1] {
                        k -= 1
                    }
                } else if sum < 0 {
                    j += 1
                    while j > k, nums[j] == nums[j - 1] {
                        j += 1
                    }
                } else {
                    k -= 1
                    while k > j, nums[k] == nums[k + 1] {
                        k -= 1
                    }
                }
            }
        }

        return results
    }
}
