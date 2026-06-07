class MinStack {

    private var stack: [Int]
    private var minIndexes: [Int]

    init() {
        self.stack = []
        self.minIndexes = []
    }

    func push(_ val: Int) {
        stack.append(val)
        if minIndexes.isEmpty {
            minIndexes.append(0)
        } else if stack[minIndexes[minIndexes.count - 1]] >= val {
            minIndexes.append(stack.count - 1)
        }
    }

    func pop() {
        guard !stack.isEmpty else {
            return
        }

        stack.removeLast()
        if minIndexes[minIndexes.count - 1] == stack.count {
            minIndexes.removeLast()
        }
    }

    func top() -> Int {
        guard !stack.isEmpty else {
            return -1
        }

        return stack[stack.count - 1]
    }

    func getMin() -> Int {
        guard !minIndexes.isEmpty else {
            return -1
        }

        let minIndex = minIndexes[minIndexes.count - 1]
        return stack[minIndex]
    }
}
