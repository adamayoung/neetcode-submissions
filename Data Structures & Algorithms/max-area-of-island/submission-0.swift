class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var maxArea = 0

        let directions: [(dm: Int, dn: Int)] = [
            (-1, 0),
            (1, 0),
            (0, -1),
            (0, 1)
        ]

        func dfs(_ m: Int, _ n: Int) -> Int {
            guard
                grid.indices.contains(m),
                grid[m].indices.contains(n),
                grid[m][n] == 1
            else {
                return 0
            }

            grid[m][n] = 0
            var count = 0
            for direction in directions {
                count += dfs(m + direction.dm, n + direction.dn)
            }

            return 1 + count
        }

        for m in 0..<grid.count {
            for n in 0..<grid[m].count {
                if grid[m][n] == 1 {
                    let area = dfs(m, n)
                    maxArea = max(maxArea, area)
                }
            }
        }

        return maxArea
    }
}
