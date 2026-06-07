/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else {
            return []
        }

        var queue = [root]
        var head = 0
        var results: [[Int]] = []
        while head < queue.count {
            let queueEnd = queue.count
            var result: [Int] = []
            while head < queueEnd {
                let node = queue[head]
                head += 1
                result.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }

            results.append(result)
        }

        return results
    }
}
