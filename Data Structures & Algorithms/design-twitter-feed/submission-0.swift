class Twitter {

    class Tweet {
        let userId: Int
        let tweetId: Int
        var prev: Tweet?
        var next: Tweet?

        init(_ userId: Int, _ tweetId: Int) {
            self.userId = userId
            self.tweetId = tweetId
        }
    }

    private let head: Tweet
    private var following: [Int: Set<Int>] = [:]

    init() {
        self.head = Tweet(0, 0)
    }

    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = Tweet(userId, tweetId)
        tweet.prev = head
        tweet.next = head.next
        head.next?.prev = tweet
        head.next = tweet
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        let followUserIds = following[userId] ?? []
        var tweetIds: [Int] = []
        var tweet = head.next
        while tweetIds.count < 10, let thisTweet = tweet {
            if thisTweet.userId == userId || followUserIds.contains(thisTweet.userId) {
                tweetIds.append(thisTweet.tweetId)
            }
            tweet = thisTweet.next
        }
        return tweetIds
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].remove(followeeId)
    }
}
