class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard stones.count >= 2 else {
            return stones[0]
        }

        var stones = stones
        while stones.count > 1 {
            stones = stones.sorted()
            let stone1 = stones.removeLast()
            let stone2 = stones.removeLast()
            let newStone = abs(stone1 - stone2)
            if newStone > 0 {
                stones.append(newStone)
            }
        }
        
        return stones.isEmpty ? 0 : stones[0]
    }
}
