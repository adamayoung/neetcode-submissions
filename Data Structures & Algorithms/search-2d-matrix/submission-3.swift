class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty, !matrix[0].isEmpty else {
            return false
        }

        let maxN = matrix[0].count - 1
        for m in 0..<matrix.count {
            if matrix[m][0] > target || matrix[m][maxN] < target {
                continue
            }

            var left = 0
            var right = maxN
            while left <= right {
                let mid = left + ((right - left) / 2)
                if matrix[m][mid] == target {
                    return true
                } else if matrix[m][mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            return false
        }

        return false
    }
}
