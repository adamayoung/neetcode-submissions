class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }

        var maxLeft = Array(repeating: 0, count: height.count)
        for i in 1..<height.count {
            maxLeft[i] = max(maxLeft[i - 1], height[i - 1])
        }

        var maxRight = Array(repeating: 0, count: height.count)
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            maxRight[i] = max(maxRight[i + 1], height[i + 1])
        }

        var maxArea = 0
        for i in 0..<height.count {
            let height = min(maxLeft[i], maxRight[i]) - height[i]
            if height > 0 {
                maxArea += height
            }
        }

        return maxArea
    }
}
