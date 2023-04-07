//
//  BipartiteGraph.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-21.
//

import Foundation

func bipartiteGraph() {
  let testCases = Int(readLine()!)!
  var result = [String](repeating: "", count: testCases)
  
  for _ in 0..<testCases {
    let firstLine = readLine()!.split(separator: " ")
    let vertices = Int(firstLine[0])!
    let edges = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: vertices + 1)
    
    for _ in 0..<edges {
      let edge = readLine()!.split(separator: " ")
      let u = Int(edge[0])!
      let v = Int(edge[1])!
      
      adjList[u].append(v)
      adjList[v].append(u)
    }
    var visited = [Bool](repeating: false, count: vertices + 1)
    var group = [Bipartite](repeating: .none, count: vertices + 1)
    result.append(bfs(start: 1, adjList: &adjList, visited: &visited, group: &group))
  }
  result.forEach { result in
    print(result)
  }
  
  func bfs(start: Int, adjList: inout [[Int]], visited: inout[Bool], group: inout [Bipartite]) -> String {
    let queue = Queue<Int>()
    queue.enqueue(item: start)
    visited[start] = true
    group[start] = .U
    
    var nextGroup = Bipartite.V
    while !queue.isEmpty() {
      let vertex = queue.dequeue()!
      for v in adjList[vertex] {
        if !visited[v] {
          queue.enqueue(item: v)
          visited[v] = true
          group[v] = nextGroup
        } else {
          if group[v] != .none && group[v] != nextGroup {
            return "NO"
          }
        }
      }
      nextGroup.toggle()
    }
    return "YES"
  }
  
  enum Bipartite {
    case none
    case U
    case V
    
    mutating func toggle() {
      switch self {
      case .U:
        self = .V
      case .V:
        self = .U
      default:
        self = .none
      }
    }
  }
}
