class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var islandCount = 0

        let directions: [(dm: Int, dn: Int)] = [
            (-1, 0),
            (1, 0),
            (0, -1),
            (0, 1)
        ]

        func dfs(_ m: Int, _ n: Int) {
            guard
                grid.indices.contains(m),
                grid[m].indices.contains(n),
                grid[m][n] == "1"
            else {
                return
            }

            grid[m][n] = "0"
            for direction in directions {
                dfs(m + direction.dm, n + direction.dn)
            }
        }

        for m in 0..<grid.count {
            for n in 0..<grid[m].count {
                if grid[m][n] == "1" {
                    islandCount += 1
                    dfs(m, n)
                }
            }
        }

        return islandCount
    }
}
