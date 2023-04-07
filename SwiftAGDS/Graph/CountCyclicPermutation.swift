//
//  CountCyclicPermutation.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-22.
//

import Foundation

func countCyclicPermutation() {
  let testCase = Int(readLine()!)!
  
  for _ in 0..<testCase {
    let size = Int(readLine()!)!
    let permutation = readLine()!.split(separator: " ").map { str in
      return Int(String(str))!
    }
    let base = Array(1...size)
    var adjList = makeAdjList(base: base, permutation: permutation)
    var count = 0
    var visited = [Bool](repeating: false, count: base.count + 1)
    
    for start in base {
      if !visited[start] {
        dfs(start: start, currentStart: start, adjList: &adjList, visited: &visited, count: &count)
      }
    }
    print(count)
  }
  
  func makeAdjList(base: [Int], permutation: [Int]) -> [[Int]] {
    var adjList = [[Int]](repeating: [], count: base.count + 1)
    for i in 0..<base.count {
      adjList[i+1].append(permutation[i])
    }
    return adjList
  }
  
  func dfs(start: Int, currentStart: Int, adjList: inout [[Int]], visited: inout [Bool], count: inout Int) {
    visited[currentStart] = true
    
    for v in adjList[currentStart] {
      if !visited[v] {
        dfs(start: start, currentStart: v, adjList: &adjList, visited: &visited, count: &count)
      } else if v == start {
        count += 1
      }
    }
  }
}
