//
//  DFS.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-21.
//

import Foundation

func adjacencyListDFS() {
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
  
  func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[start] = true
    print(start)
    
    for v in adjList[start] {
      if !visited[v] {
        dfs(start: v, adjList: &adjList, visited: &visited)
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n+1)
  dfs(start: 1, adjList: &adjList, visited: &visited)
}
