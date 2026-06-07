class KthLargest {

    private let k: Int
    private var nums: [Int]

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = Array(nums.sorted(by: >).prefix(k))
    }

    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort(by: >)
        while nums.count > k {
            nums.removeLast()
        }
        return nums[nums.count - 1]
    }
}
