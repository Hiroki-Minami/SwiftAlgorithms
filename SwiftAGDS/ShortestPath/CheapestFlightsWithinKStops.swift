//
//  CheapestFlightsWithinKStops.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-18.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var adjList = [[(v: Int, w: Int)]](repeating: [], count: n)
    for flight in flights {
        adjList[flight[0]].append((flight[1], flight[2]))
    }

    var distances = [Int](repeating: Int.max, count: n)
    var queue = [(v: Int, soFar: Int)]()
    var stops = 0
    queue.append((src, 0))

    while !queue.isEmpty && stops <= k {
        for _ in queue {
            let current = queue.removeFirst()
            for (v, w) in adjList[current.v] {
                if distances[v] <= current.soFar + w { continue }
                distances[v] = current.soFar + w
                queue.append((v, current.soFar + w))
            }
        }
        stops += 1
    }
    return distances[dst] == Int.max ? -1 : distances[dst]
}
