class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []

        let brackets: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]

        for char in s {
            switch char {
            case "(", "{", "[":
                stack.append(char)
            case ")", "}", "]":
                guard !stack.isEmpty else {
                    return false
                }

                if brackets[char] != stack.removeLast() {
                    return false
                }

            default: continue
            }
        }

        return stack.isEmpty
    }
}
