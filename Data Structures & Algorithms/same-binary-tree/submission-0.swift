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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        func dfs(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
            if a == nil, b == nil {
                return true
            }

            guard let a, let b, a.val == b.val else {
                return false
            }

            return dfs(a.left, b.left) && dfs(a.right, b.right)
        }

        return dfs(p, q)
    }
}
