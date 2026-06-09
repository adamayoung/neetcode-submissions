class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph: [Int: [Int]] = [:]
        for prerequisite in prerequisites {
            graph[prerequisite[0], default: []].append(prerequisite[1])
        }

        var state = Array(repeating: 0, count: numCourses)
        func dfs(_ course: Int) -> Bool {
            if state[course] == 1 { return false }
            if state[course] == 2 { return true }

            state[course] = 1
            for prerequisite in graph[course, default: []] {
                if !dfs(prerequisite) {
                    return false
                }
            }

            state[course] = 2

            return true
        }

        for course in 0..<numCourses {
            if !dfs(course) {
                return false
            }
        }

        return true
    }
}
