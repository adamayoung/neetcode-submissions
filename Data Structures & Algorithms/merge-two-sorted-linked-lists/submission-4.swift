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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var node: ListNode? = dummy
        var node1 = list1
        var node2 = list2

        while node1 != nil, node2 != nil {
            guard let val1 = node1?.val, let val2 = node2?.val else {
                break
            }

            if val1 <= val2 {
                node?.next = node1
                node1 = node1?.next
            } else {
                node?.next = node2
                node2 = node2?.next
            }

            node = node?.next
        }

        node?.next = node1 == nil ? node2 : node1

        return dummy.next
    }
}
