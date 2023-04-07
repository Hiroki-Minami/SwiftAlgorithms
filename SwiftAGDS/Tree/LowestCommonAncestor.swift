//
//  LowestCommonAncestor.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-03.
//

import Foundation

func lowestCommonAncestor() {
  let n = Int(readLine()!)!
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<n-1 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let from = line[0]
    let to = line[1]
    adjList[from].append(to)
    adjList[to].append(from)
  }
  
  let m = Int(readLine()!)!
  var children = [(Int, Int)]()
  for _ in 1...m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    children.append((line[0], line[1]))
  }
  
  for child in children {
    var visited = Set<Int>()
    var ancestorsOne: [Int] = []
    dfs(1, &adjList, child.0, &ancestorsOne, &visited)
    
    visited.removeAll()
    var ancestorsTwo: [Int] = []
    dfs(1, &adjList, child.1, &ancestorsTwo, &visited)
    
    var flg = false
    for i in 1...ancestorsOne.count {
      guard !flg else { break }
      for j in 1...ancestorsTwo.count {
        if ancestorsOne[ancestorsOne.count-i] == ancestorsTwo[ancestorsTwo.count-j] {
          flg = true
          print(ancestorsOne[ancestorsOne.count-i])
          break
        }
      }
    }
  }
  
  func dfs(_ start: Int, _ adjList: inout [[Int]], _ target: Int, _ ancestors: inout [Int], _ visited: inout Set<Int>) {
    visited.insert(start)
    for v in adjList[start] {
      if visited.contains(target) { return }
      if !visited.contains(v) {
        if v == target {
          visited.insert(v)
          ancestors.append(start)
          ancestors.append(v)
          return
        } else {
          ancestors.append(start)
          dfs(v, &adjList, target, &ancestors, &visited)
          if visited.contains(target) { return }
          ancestors.removeLast()
        }
      }
    }
  }
}

func lcaN() {
  let n = Int(readLine()!)!
  var adj = [[Int]](repeating: [], count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  
  var depth = [Int](repeating: 0, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  
  depth[1] = 0
  check[1] = true
  let q = Queue<Int>()
  q.enqueue(item: 1)
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      if !check[v] {
        depth[v] = depth[u] + 1
        parent[v] = u
        check[v] = true
        q.enqueue(item: v)
      }
    }
  }
  
  var m = Int(readLine()!)!
  
  while m > 0 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    var u = edge[0]
    var v = edge[1]
    
    if depth[u] < depth[v] {
      swap(&u, &v)
    }
    while depth[u] != depth[v] {
      u = parent[u]
    }
    while u != v {
      u = parent[u]
      v = parent[v]
    }
    print(u)
    m -= 1
  }
}
