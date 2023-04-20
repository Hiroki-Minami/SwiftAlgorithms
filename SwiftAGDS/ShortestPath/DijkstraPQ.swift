//
//  DijkstraPQ.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-18.
//

import Foundation

func DijkstraIPQ() {
  
  /// All vertices starting from 1 to n
  func dijkstra(_ edges: inout [[CompEdge]], _ src: Int) -> [Int] {
    let n = edges.count
    var dist = [Int](repeating: Int.max, count: n)
    dist[src] = 0
    var pq = IndexPriorityQueue<CompEdge>(<)
    for edge in edges[src] {
      pq.enqueue(CompEdge(u: src, v: edge.v, w: edge.w))
    }
    
    while let edge = pq.dequeue() {
      if edge.w < dist[edge.v] {
        dist[edge.v] = edge.w
        for e in edges[edge.v] {
          pq.enqueue(CompEdge(u: edge.v, v: e.v, w: e.w + edge.w))
        }
      }
    }
    return dist
  }
}
