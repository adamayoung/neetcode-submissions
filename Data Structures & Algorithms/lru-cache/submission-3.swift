class LRUCache {

    class Node {
        let key: Int
        var value: Int
        var prev: Node?
        var next: Node?

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var nodes: [Int: Node] = [:]
    private var head: Node
    private var tail: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        self.head = Node(key: 0, value: 0)
        self.tail = Node(key: 0, value: 0)
        self.head.next = tail
        self.tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let node = nodes[key] else {
            return -1
        }

        remove(node)
        add(node)

        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = nodes[key] {
            node.value = value
            remove(node)
            add(node)
            return
        }

        let node = Node(key: key, value: value)
        add(node)
    }

    private func add(_ node: Node) {
        node.prev = tail.prev
        node.next = tail

        tail.prev?.next = node
        tail.prev = node

        nodes[node.key] = node
        if nodes.count > capacity, let oldNode = head.next, oldNode !== tail {
            remove(oldNode)
        }
    }

    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.next = nil
        node.prev = nil

        nodes.removeValue(forKey: node.key)
    }
}
