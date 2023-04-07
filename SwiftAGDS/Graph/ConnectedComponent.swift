//
//  ConnectedComponent.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-21.
//

import Foundation

func connectedComponents() {
  let firstLine = readLine()!.split(separator: " ")
  let vertices = Int(firstLine[0])!
  let edges = Int(firstLine[1])!
  var adjacentList = [[Int]](repeating: [], count: vertices + 1)
  
  for _ in 0..<edges {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjacentList[u].append(v)
    adjacentList[v].append(u)
  }
  
  func bfs(start: Int, adjList: inout [[Int]], visited: inout[Bool]) {
    let queue = Queue<Int>()
    queue.enqueue(item: start)
    visited[start] = true
    
    while !queue.isEmpty() {
      let vertex = queue.dequeue()!
      for v in adjList[vertex] {
        if !visited[v] {
          queue.enqueue(item: v)
          visited[v] = true
        }
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: vertices + 1)
  visited[0] = true
  var components = 0
  while visited.contains(false) {
    let start = visited.firstIndex(of: false)!
    bfs(start: start, adjList: &adjacentList, visited: &visited)
    components += 1
  }
  print("number of connected components: \(components)")
}

