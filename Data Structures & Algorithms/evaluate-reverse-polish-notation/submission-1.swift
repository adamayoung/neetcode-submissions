class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
                continue
            }

            guard stack.count >= 2 else {
                return 0
            }

            let rhs = stack.removeLast()
            let lhs = stack.removeLast()
            switch token {
            case "+": stack.append(lhs + rhs)
            case "-": stack.append(lhs - rhs)
            case "*": stack.append(lhs * rhs)
            case "/": stack.append(lhs / rhs)
            default: return 0
            }
        }

        return stack.isEmpty ? 0 : stack.removeLast()
    }
}
