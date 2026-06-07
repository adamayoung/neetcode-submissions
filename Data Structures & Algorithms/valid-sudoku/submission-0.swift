class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        func isRowValid(_ m: Int) -> Bool {
            var seen: Set<Character> = []
            for n in 0..<board[m].count where board[m][n].isNumber {
                if seen.contains(board[m][n]) {
                    return false
                }

                seen.insert(board[m][n])
            }

            return true
        }

        func isColumnValid(_ n: Int) -> Bool {
            var seen: Set<Character> = []
            for m in 0..<board.count where board[m][n].isNumber {
                if seen.contains(board[m][n]) {
                    return false
                }

                seen.insert(board[m][n])
            }

            return true
        }

        func isSubBoxValid(_ startM: Int, _ startN: Int) -> Bool {
            var seen: Set<Character> = []
            for m in startM...(startM + 2) {
                for n in startN...(startN + 2) where board[m][n].isNumber {
                    if seen.contains(board[m][n]) {
                        return false
                    }

                    seen.insert(board[m][n])
                }
            }

            return true
        }

        for m in 0..<board.count {
            if !isRowValid(m) {
                return false
            }

            for n in 0..<board[m].count {
                if m == 0 {
                    if !isColumnValid(n) {
                        return false
                    }
                }

                if m % 3 == 0, n % 3 == 0, !isSubBoxValid(m, n) {
                    return false
                }
            }
        }

        return true
    }
}
