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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ node: TreeNode?) {
            guard let node else {
                return
            }

            let left = node.left
            node.left = node.right
            node.right = left

            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)
        return root
    }
}
