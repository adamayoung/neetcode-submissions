class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        guard !temperatures.isEmpty else {
            return []
        }

        guard temperatures.count >= 2 else {
            return [0]
        }

        var deque: [Int] = []
        var result = Array(repeating: 0, count: temperatures.count)
        for i in stride(from: temperatures.count - 1, through: 0, by: -1) {
            while !deque.isEmpty, temperatures[deque.last!] <= temperatures[i] {
                deque.removeLast()
            }

            if !deque.isEmpty {
                result[i] = deque.last! - i
            }

            deque.append(i)
        }

        return result
    }
}
