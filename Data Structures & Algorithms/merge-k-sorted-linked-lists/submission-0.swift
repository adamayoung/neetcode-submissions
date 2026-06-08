/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var dummy = ListNode(0)
        var currentNode = dummy

        var heads: [ListNode] = []
        for head in lists {
            if let head {
                heads.append(head)
            }
        }

        heads.sort { $0.val > $1.val }

        while !heads.isEmpty {
            let node = heads[heads.count - 1]
            currentNode.next = node
            currentNode = node
            if let nextNode = node.next {
                heads[heads.count - 1] = nextNode
                heads.sort { $0.val > $1.val }
            } else {
                heads.removeLast()
            }
        }

        return dummy.next
    }
}
