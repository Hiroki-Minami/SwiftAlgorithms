//
//  PathwithMaximumProbability.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-19.
//

import Foundation

func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
  var adjList = [[(v: Int, w: Double)]](repeating: [], count: n)
  
  for (i, edge) in edges.enumerated() {
    adjList[edge[0]].append((edge[1], log(succProb[i])))
    adjList[edge[1]].append((edge[0], log(succProb[i])))
  }
  
  var visited = [Bool](repeating: false, count: n)
  var distances = [Double](repeating: -Double.infinity, count: n)
  
  distances[start] = 0
  
  for _ in 0..<n-1 {
    var maxProbability = -Double.infinity
    var maxVertex = 1
    for v in 0..<n {
      if !visited[v] && distances[v] > maxProbability {
        maxProbability = distances[v]
        maxVertex = v
      }
    }
    visited[maxVertex] = true
    for edge in adjList[maxVertex] {
      if distances[edge.v] < distances[maxVertex] + edge.w {
        distances[edge.v] = distances[maxVertex] + edge.w
      }
    }
  }
  
  return exp(distances[end])
}
