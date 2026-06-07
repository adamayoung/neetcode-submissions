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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var node: ListNode? = dummy

        var node1 = l1
        var node2 = l2

        var carryOver = 0
        while node1 != nil || node2 != nil {
            let val1 = node1?.val ?? 0
            let val2 = node2?.val ?? 0

            var sum = val1 + val2 + carryOver
            if sum >= 10 {
                carryOver = sum / 10
                sum = sum % 10
            } else {
                carryOver = 0
            }

            let newNode = ListNode(sum)
            node?.next = newNode
            node = newNode
            node1 = node1?.next
            node2 = node2?.next
        }

        if carryOver > 0 {
            let newNode = ListNode(carryOver)
            node?.next = newNode
        }

        return dummy.next
    }
}
