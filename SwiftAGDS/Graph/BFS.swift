//
//  BFS.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-21.
//

import Foundation

func adjacentListBFS() {
  let firstList = readLine()!.split(separator: " ")
  let n = Int(firstList[0])!
  let m = Int(firstList[1])!
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  func bfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    let queue = Queue<Int>()
    queue.enqueue(item: start)
    visited[start] = true
    
    while !queue.isEmpty() {
      let vertex = queue.dequeue()!
      print(vertex)
      for v in adjList[vertex] {
        if !visited[v] {
          queue.enqueue(item: v)
          visited[v] = true
        }
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  bfs(start: 1, adjList: &adjList, visited: &visited)
}
