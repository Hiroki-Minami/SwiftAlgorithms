//
//  NetworkDelayTime.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-18.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    var adjList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)

    for time in times {
        adjList[time[0]].append((time[1], time[2]))
    }

    var distances = [Int](repeating: Int.max, count: n + 1)
    distances[k] = 0
    var visited = Set<Int>()
    visited.insert(0)

    var queue = [Int]()
    queue.append(k)

    while !queue.isEmpty {
        let current = queue.removeFirst()
        visited.insert(current)

        for (v, w) in adjList[current] {
            if distances[v] > (w + distances[current]) {
                distances[v] = w + distances[current]
            }
        }

        var minimumDistance = Int.max
        var nextVertex = 0
        for (v, distance) in distances.enumerated() {
            if !visited.contains(v) && distance < minimumDistance {
                minimumDistance = distance
                nextVertex = v
            }
        }
        if nextVertex > 0 {
            queue.append(nextVertex)
        }
    }
    return visited.count == n + 1 ? distances[1...].max()! : -1
}
