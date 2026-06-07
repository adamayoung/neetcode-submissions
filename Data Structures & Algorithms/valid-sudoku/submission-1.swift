class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)

        for m in 0..<board.count {
            for n in 0..<board[m].count where board[m][n].isNumber {
                let char = board[m][n]
                let boxIndex = (m / 3) * 3 + (n / 3)

                guard
                    rows[m].insert(char).inserted,
                    columns[n].insert(char).inserted,
                    boxes[boxIndex].insert(char).inserted
                else {
                    return false
                }            
            }
        }

        return true
    }
}
