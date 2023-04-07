//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-24.
//

import Foundation

//func diameter() {
//  let vertices = Int(readLine()!)!
//  var adjList = [[(Int, Int)]](repeating: [], count: vertices + 1)
//
//  for _ in 0..<vertices {
//    let line = readLine()!.split(separator: " ")
//    let vertex = Int(line[0])!
//
//    var toIndex = 1
//    var weightIndex = 2
//    while let to = Int(line[toIndex]), to != -1 {
//      let weight = Int(line[weightIndex])!
//
//      adjList[vertex].append((to, weight))
//      adjList[to].append((vertex, weight))
//
//      toIndex += 2
//      weightIndex += 2
//    }
//  }
//
//  var distances = Set<Int>()
//  for start in 1...vertices {
//    var visited = Set<Int>()
//    dfs(start, &adjList, &visited, 0, &distances)
//  }
//  print(distances.max()!)
//
//  func dfs(_ start: Int, _ adjList: inout [[(Int, Int)]], _ visited: inout Set<Int>, _ soFar: Int, _ distances: inout Set<Int>) {
//    visited.insert(start)
//    var reachedEdge = true
//    for v in adjList[start] {
//      if !visited.contains(v.0) {
//        reachedEdge = false
//        dfs(v.0, &adjList, &visited, soFar + v.1, &distances)
//      }
//    }
//    if reachedEdge {
//      distances.insert(soFar)
//    }
//  }
//}

func diameter() {
  struct Edge {
    let to: Int
    let distance: Int
  }
  
  func bfs(node: Int, visited: inout [Bool], distances: inout [Int], adj: inout [[Edge]]) {
    let q = Queue<Int>()
    visited[node] = true
    q.enqueue(item: node)
    while !q.isEmpty() {
      let x = q.dequeue()!
      for i in 0..<adj[x].count {
        let edge = adj[x][i]
        if !visited[edge.to] {
          distances[edge.to] = distances[x] + edge.distance
          q.enqueue(item: edge.to)
          visited[edge.to] = true
        }
      }
    }
  }
  
  func calcDiameter() {
    let n = Int(readLine()!)!
    var adj = [[Edge]](repeating: [], count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    var distances = [Int](repeating: 0, count: n + 1)
    
    for _ in 1...n {
      let line = readLine()!.split(separator: " ").map { Int($0)! }
      let from = line[0]
      var j = 1
      while j < line.count - 2 {
        let to = line[j]
        let dist = line[j + 1]
        adj[from].append(Edge(to: to, distance: dist))
        if line[j + 2] == -1 {
          break
        }
        j += 2
      }
    }
    
    var start = 1
    bfs(node: start, visited: &visited, distances: &distances, adj: &adj)
    for i in 2...n {
      if distances[i] > distances[start] {
        start = i
      }
    }
    
    var visited2 = [Bool](repeating: false, count: n + 1)
    var distances2 = [Int](repeating: 0, count: n + 1)
    bfs(node: start, visited: &visited2, distances: &distances2, adj: &adj)
    print(distances2.max()!)  // O(n)
  }
  
  calcDiameter()
}
