class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var numCounts: [Int: Int] = [:]
        for num in nums {
            numCounts[num, default: 0] += 1
        }

        var bucket = Array(repeating: [Int](), count: nums.count + 1)
        for (num, count) in numCounts {
            bucket[count].append(num)
        }

        var results: [Int] = []
        for i in stride(from: bucket.count - 1, through: 0, by: -1) {
            for value in bucket[i] where results.count < k {
                results.append(value)
            }
        }

        return results
    }
}
