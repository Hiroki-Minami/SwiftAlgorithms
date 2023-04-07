//
//  SushiReviews.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-03.
//

import Foundation

func sushiReviews() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  var realSushiRestraunts = readLine()!.split(separator: " ").map { Int($0)! }
  var adjList = [[Int]](repeating: [], count: firstLine[0])
  
  for _ in 1..<firstLine[0] {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let from = line[0]
    let to = line[1]
    
    adjList[from].append(to)
    adjList[to].append(from)
  }
  
  // prone the tree
  var pruned = adjList
  for (v, list) in adjList.enumerated() {
    if list.count == 1 && !realSushiRestraunts.contains(v) {
      sushiPrune(v, &pruned, &realSushiRestraunts)
    }
  }
  
  let diameter = sushiDiameter(pruned)
  let edges = pruned.reduce(0) { $0 + $1.count }
  print(edges-diameter)
}

func sushiPrune(_ target: Int, _ adjList: inout [[Int]], _ real: inout [Int]) {
  if adjList[target].count != 1 || real.contains(target) {
    return
  } else {
    let nextTarget = adjList[target].removeFirst() // vertices that can be pruned have only one edge
    adjList[nextTarget].remove(at: adjList[nextTarget].firstIndex(of: target)!)
    sushiPrune(nextTarget, &adjList, &real)
  }
}

func sushiDiameter(_ adjList: [[Int]]) -> Int {
  // distance
  var adjList = adjList
  var distances = [Int](repeating: 0, count: adjList.count)
  // first bfs
  var start = 0
  for (i, list) in adjList.enumerated() {
    if !list.isEmpty {
      start = i
      break
    }
  }
  var visited = Set<Int>()
  visited.insert(start)
  sushiBfs(start, &adjList, &distances, &visited)
  
  // second bfs
  start = distances.firstIndex(of: distances.max()!)!
  visited.removeAll()
  distances = [Int](repeating: 0, count: adjList.count)
  // next bfs
  visited.insert(start)
  sushiBfs(start, &adjList, &distances, &visited)
  return distances.max()!
}

func sushiBfs(_ start: Int, _ adjList: inout [[Int]], _ distances: inout [Int], _ visited: inout Set<Int>) {
  let queue = Queue<Int>()
  queue.enqueue(item: start)
  while !queue.isEmpty() {
    let x = queue.dequeue()!
    for v in adjList[x] {
      if !visited.contains(v) {
        distances[v] = distances[x] + 1
        queue.enqueue(item: v)
        visited.insert(v)
      }
    }
  }
}

func sushiReviewsFile(inFile: String) -> Int {
  let contents = try! String(contentsOfFile: inFile).split(separator: "\n")
  
  let firstLine = contents[0].split(separator: " ").map { Int($0)! }
  var realSushiRestraunts = contents[1].split(separator: " ").map { Int($0)! }
  var adjList = [[Int]](repeating: [], count: firstLine[0])
  
  for i in 1..<firstLine[0] {
    let line = contents[i+1].split(separator: " ").map { Int($0)! }
    let from = line[0]
    let to = line[1]
    
    adjList[from].append(to)
    adjList[to].append(from)
  }
  
  // prone the tree
  var pruned = adjList
  for (v, list) in adjList.enumerated() {
    if list.count == 1 && !realSushiRestraunts.contains(v) {
      sushiPrune(v, &pruned, &realSushiRestraunts)
    }
  }
  
  let diameter = sushiDiameter(pruned)
  let edges = pruned.reduce(0) { $0 + $1.count }
  return edges - diameter
}

func testSushiReviewsInputFile() {
  let fileManager = FileManager.default
  let path = "/Users/minamihiroki/Desktop/WMAD_Program/Swift-AGDS/SwiftAGDSTests/SushiCases/"
  let contents = try! fileManager.contentsOfDirectory(atPath: path)
  var failed = 0
  
  for content in contents {
    if content.contains(".in") {
      let inFile = path + content
      print("start: \(content)")
      let results = sushiReviewsFile(inFile: inFile)
      
      let outFile = path + content.replacing(".in", with: ".out")
      let expect = try! String(contentsOfFile: outFile).split(separator: "\n")
        .map { Int($0)! }
      
      if results != expect[0] {
        failed += 1
        print("Test falied: in file: \(content)")
      } else {
        print("Done: in file: \(content)")
      }
    }
  }
  
  if failed == 0 {
    print("Success")
  } else {
    print("Failed: failed number: \(failed)")
  }
}
