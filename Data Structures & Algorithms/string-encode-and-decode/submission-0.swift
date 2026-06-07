class Solution {

    func encode(_ strs: [String]) -> String {
        var encoded = ""
        for str in strs {
            encoded += "\(str.count)|\(str)"
        }

        return encoded
    }

    func decode(_ str: String) -> [String] {
        var chars = Array(str)
        var results: [String] = []
        var currentCount = 0
        var s = ""
        var i = 0
        while i < chars.count {
            if let num = chars[i].wholeNumberValue {
                currentCount = (currentCount * 10) + num
                i += 1
                continue
            }

            guard chars[i] == "|" else {
                i += 1
                continue
            }

            i += 1
            var str = ""
            for j in 0..<currentCount {
                str += "\(chars[i])"
                i += 1
            }

            results.append(str)
            currentCount = 0
        }

        return results
    }
}
