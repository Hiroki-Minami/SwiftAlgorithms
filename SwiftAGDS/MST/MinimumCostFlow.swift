//
//  MinimumCostFlow.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-14.
//

import Foundation

func minimumCostFlow() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]
  let d = firstLine[2]
  
  var adjList = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  var validPlan = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  var inactives = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  
  for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, true))
    adjList[v].append((u, c, true))
    
    validPlan[u].append((v, c, true))
    validPlan[v].append((u, c, true))
  }
  
  for _ in 0..<(m-(n-1)) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, false))
    adjList[v].append((u, c, false))
    
    inactives[u].append((v, c, false))
    inactives[v].append((u, c, false))
  }
  
  // minimum spanning tree
  let (mstEdges, replacedEdges) = MCFKruskalMST(adjList)
  print(MCFCalculation(mstEdges, replacedEdges, adjList, d))
}

func MCFCalculation(_ mstEdges: [(u: Int, v: Int, w: Int, valid: Bool)], _ replacedEdges: [(u: Int, v: Int, w: Int)], _ adjList: [[(v: Int, w: Int, valid: Bool)]], _ d: Int) -> Int {
  if replacedEdges.isEmpty {
    return 0
  }
  let newEdges = mstEdges.filter({ !$0.valid })
  var uf = UF(adjList.count + 1)
  
  for edge in mstEdges.filter({ $0.valid }) {
    uf.union(edge.u, edge.v)
  }
  
  var pairs = [(old: Int, new: Int)]()
  for (i, replaced) in replacedEdges.enumerated() {
    var checkUf = uf
    checkUf.union(replaced.u, replaced.v)
    for (j, newEdge) in newEdges.enumerated() {
      if uf.connected(newEdge.u, newEdge.v) {
        pairs.append((i, j))
      }
    }
  }
  
  var days = 0
  for (old, new) in pairs {
    if (replacedEdges[old].w - newEdges[new].w) <= d {
      days -= 1
      break
    }
  }
  days += newEdges.count
  return days
}

func MCFKruskalMST(_ graph: [[(v: Int, w: Int, valid: Bool)]]) -> (mstEdges: [(u: Int, v: Int, w: Int, valid: Bool)], replacedEdges: [(u: Int, v: Int, w: Int)]) {
  var allEdges = [(u: Int, v: Int, w: Int, valid: Bool)]()
  
  for (u, edges) in graph.enumerated() {
    for edge in edges {
      allEdges.append((u, edge.v, edge.w, edge.valid))
    }
  }
  allEdges.sort { $0.w < $1.w }
  var mstEdges = [(u: Int, v: Int, w: Int, valid: Bool)]()
  var replacedEdges = [(u: Int, v: Int, w: Int)]()
  
  var uf = UF(graph.count + 1)
  
  for edge in allEdges {
    if uf.connected(edge.u, edge.v) {
      if !edge.valid { continue }
      replacedEdges.append((edge.u, edge.v, edge.w))
      continue
    }
    mstEdges.append(edge)
    uf.union(edge.u, edge.v)
  }
  return (mstEdges, replacedEdges)
}

func minimumCostFlowFile(inFile: String) -> Int {
  let contents = try! String(contentsOfFile: inFile).split(separator: "\n")
  
  let firstLine = contents[0].split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let d = firstLine[2]
  
  var adjList = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  var validPlan = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  var inactives = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  
  for i in 1..<n {
    let input = contents[i].split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, true))
    adjList[v].append((u, c, true))
    
    validPlan[u].append((v, c, true))
    validPlan[v].append((u, c, true))
  }
  
//  print(n)
//  print(contents.count)
  if n == contents.count { return 0 }
  for i in n..<contents.count-1 {
    let input = contents[i].split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, false))
    adjList[v].append((u, c, false))
    
    inactives[u].append((v, c, false))
    inactives[v].append((u, c, false))
  }
  
  // minimum spanning tree
  let (mstEdges, replacedEdges) = MCFKruskalMST(adjList)
  return MCFCalculation(mstEdges, replacedEdges, adjList, d)
}

func testMinimumCostFlowInputFile() {
  let fileManager = FileManager.default
  let path = "/Users/minamihiroki/Desktop/WMAD_Program/Swift-AGDS/SwiftAGDSTests/mcf/"
  let contents = try! fileManager.contentsOfDirectory(atPath: path)
  var failed = 0
  
  for content in contents {
    if content.contains(".in") {
      let inFile = path + content
      print("start: \(content)")
      let results = minimumCostFlowFile(inFile: inFile)
      
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
