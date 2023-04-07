//
//  FindCycle.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-22.
//

import Foundation

func findCycle() {
  let firstLine = readLine()!.split(separator: " ")
  let verticies = Int(firstLine[0])!
  let edges = Int(firstLine[1])!
  var adjList = [[Int]](repeating: [], count: verticies + 1)
  
  for _ in 0..<edges {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  func dfs(start: Int, currentStart: Int, depth: Int, adjList: inout [[Int]], visited: inout [Bool]) -> Bool {
    visited[currentStart] = true
    
    for v in adjList[currentStart] {
      if !visited[v] {
        if dfs(start: start, currentStart: v, depth: depth + 1, adjList: &adjList, visited: &visited) { return true }
      } else {
        if v == start && depth != 1 {
          return true
        }
      }
    }
    return false
  }
  
  for start in 1...verticies {
    var visited = [Bool](repeating: false, count: verticies + 1)
    if dfs(start: start, currentStart: start, depth: 0, adjList: &adjList, visited: &visited) {
      print("This graph has at least one cycle")
      break
    } else if start == verticies {
      print("This graph doesn't have cycles")
    }
  }
}
