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
    func maxDepth(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else {
                return 0
            }

            return 1 + max(maxDepth(node.left), maxDepth(node.right))
        }

        return dfs(root)
    }

    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        var maxDepth = 0
        var queue = [root]
        while !queue.isEmpty {
            maxDepth += 1
            let queueCount = queue.count
            for _ in 0..<queueCount {
                let node = queue.removeFirst()
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }

        return maxDepth
    }
}
