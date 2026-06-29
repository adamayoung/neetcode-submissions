class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        guard heights.count >= 2 else {
            return 0
        }

        var left = 0
        var right = heights.count - 1

        var maxWater = 0
        while left < right {
            let water = min(heights[left], heights[right]) * (right - left)
            maxWater = max(maxWater, water)
            
            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return maxWater
    }
}
