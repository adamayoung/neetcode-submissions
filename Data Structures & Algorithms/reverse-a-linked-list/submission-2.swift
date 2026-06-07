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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var prev: ListNode?

        while node != nil {
            let next = node?.next
            node?.next = prev
            prev = node
            node = next
        }
        
        return prev
    }
}
