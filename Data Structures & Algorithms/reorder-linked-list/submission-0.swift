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
    func reorderList(_ head: ListNode?) {
        // find middle
        var slow = head
        var fast = head
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var list2 = slow?.next
        slow?.next = nil

        // reverse second list
        var node = list2
        var prev: ListNode?
        while node != nil {
            let next = node?.next
            node?.next = prev
            prev = node
            node = next
        }

        let head2 = prev

        // merge
        var node1 = head
        var node2 = head2
        while node1 != nil, node2 != nil {
            let next1 = node1?.next
            let next2 = node2?.next
            node1?.next = node2
            node2?.next = next1
            node1 = next1
            node2 = next2
        }
    }
}
