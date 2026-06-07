class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxP = 0
        var minBuyIndex = 0

        for (i, price) in prices.enumerated() {
            if price < prices[minBuyIndex] {
                minBuyIndex = i
            }

            let profit = prices[i] - prices[minBuyIndex]
            maxP = max(maxP, profit)
        }

        return maxP
    }
}
