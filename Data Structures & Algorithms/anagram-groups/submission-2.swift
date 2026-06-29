class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var store: [String: [String]] = [:]

        for str in strs {
            let key = String(str.sorted())
            store[key, default: []].append(str)
        }

        return Array(store.values)
    }
}
