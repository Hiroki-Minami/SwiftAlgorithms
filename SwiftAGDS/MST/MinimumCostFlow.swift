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
  
  for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, true))
  }
  
  for _ in 0..<(m-(n-1)) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, false))
  }
  
  // minimum spanning tree
//  print(MCFKruskalMST(adjList, d))
  let (mstEdges, newEdges, replacedEdges) = MCFKruskalMST(adjList, d)
  print(MCFCalculation(mstEdges, newEdges, replacedEdges, adjList, d))
}

func MCFCalculation(_ mstEdges: [(u: Int, v: Int, w: Int, valid: Bool)], _ newEdges: [(u: Int, v: Int, w: Int)], _ replacedEdges: [(u: Int, v: Int, w: Int)], _ adjList: [[(v: Int, w: Int, valid: Bool)]], _ d: Int) -> Int {
  if replacedEdges.isEmpty {
    return 0
  }
  var newEdges = newEdges
//  let newEdges = mstEdges.filter({ !$0.valid })
//  print("newEdges: \(newEdges.count), replaced: \(replacedEdges.count)")
  var uf = UF(adjList.count + 1)
  
  for edge in mstEdges.filter({ $0.valid }) {
    uf.union(edge.u, edge.v)
  }
  
  var distances = [Int]()
  for (_, replaced) in replacedEdges.enumerated() {
    var checkUf = uf
    checkUf.union(replaced.u, replaced.v)
    for (j, newEdge) in newEdges.enumerated() {
      if uf.connected(newEdge.u, newEdge.v) {
        distances.append(replaced.w - newEdge.w)
        newEdges.remove(at: j)
        break
      }
    }
  }
  
  var days = 0
  for distance in distances {
    if distance <= d {
      days -= 1
      break
    }
  }
  days += newEdges.count
  return days
}

func MCFKruskalMST(_ graph: [[(v: Int, w: Int, valid: Bool)]], _ d: Int) -> (mstEdges: [(u: Int, v: Int, w: Int, valid: Bool)], newEdges: [(u: Int, v: Int, w: Int)], replacedEdges: [(u: Int, v: Int, w: Int)]) {
//func MCFKruskalMST(_ graph: [[(v: Int, w: Int, valid: Bool)]], _ d: Int) -> Int {
  var allEdges = [(u: Int, v: Int, w: Int, valid: Bool)]()
//  var allEdgesEnhanced = [(u: Int, v: Int, w: Int, valid: Bool)]()
  
  for (u, edges) in graph.enumerated() {
    for edge in edges {
      allEdges.append((u, edge.v, edge.w, edge.valid))
//      if edge.valid {
//        let weight = (edge.w - d) >= 0 ? (edge.w - d) : 0
//        allEdgesEnhanced.append((u, edge.v, weight, edge.valid))
//      } else {
//        allEdgesEnhanced.append((u, edge.v, edge.w, edge.valid))
//      }
    }
  }
  
  allEdges.sort { (edgeOne, edgeTwo) -> Bool in
    if edgeOne.w == edgeTwo.w {
      return edgeOne.valid && !edgeTwo.valid
    } else {
      return edgeOne.w < edgeTwo.w
    }
  }
  
//  allEdgesEnhanced.sort { (edgeOne, edgeTwo) -> Bool in
//    if edgeOne.w == edgeTwo.w {
//      return edgeOne.valid && !edgeTwo.valid
//    } else {
//      return edgeOne.w < edgeTwo.w
//    }
//  }
//  for edge in allEdges {
//    print(edge)
//  }
  
//  print(allEdges)
//  allEdgesEnhanced.sort { $0.w < $1.w }
  
  var mstEdges = [(u: Int, v: Int, w: Int, valid: Bool)]()
  var replacedEdges = [(u: Int, v: Int, w: Int)]()
  var newEdges = [(u: Int, v: Int, w: Int)]()
  var newEdgesEnhanced = [(u: Int, v: Int, w: Int)]()
  
  var uf = UF(graph.count + 1)
//  var ufEnhanced = UF(graph.count + 1)
  
  for edge in allEdges {
    if uf.connected(edge.u, edge.v) {
      if !edge.valid {
        replacedEdges.append((edge.u, edge.v, edge.w))
      }
      continue
    }
    if !edge.valid {
      newEdges.append((edge.u, edge.v, edge.w))
    }
    mstEdges.append(edge)
    uf.union(edge.u, edge.v)
  }
  
//  for edge in allEdgesEnhanced {
//    if ufEnhanced.connected(edge.u, edge.v) {
//      continue
//    }
//    if !edge.valid {
//      newEdgesEnhanced.append((edge.u, edge.v, edge.w))
//    }
//    ufEnhanced.union(edge.u, edge.v)
//  }
  
//  print("newEdges: \(newEdges.count)")
//  print("newEdgesEnhanced: \(newEdgesEnhanced.count)")
//  let days = newEdges.count > newEdgesEnhanced.count ? newEdges.count - 1: newEdges.count
//  print("days: \(days)")
//  return days
//  var allEdgesEnhanced = [(u: Int, v: Int, w: Int, valid: Bool)]()
//  
//  for mstEdge in mstEdges {
//      if mstEdge.valid {
//        let weight = (mstEdge.w - d) >= 0 ? (mstEdge.w - d) : 0
//        allEdgesEnhanced.append((mstEdge.u, mstEdge.v, weight, mstEdge.valid))
//      } else {
//        allEdgesEnhanced.append((mstEdge.u, mstEdge.v, mstEdge.w, mstEdge.valid))
//      }
//  }
  
  return (mstEdges, newEdges, replacedEdges)
}

func minimumCostFlowFile(inFile: String) -> Int {
  let contents = try! String(contentsOfFile: inFile).split(separator: "\n")
  
  let firstLine = contents[0].split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let d = firstLine[2]
  
  var adjList = [[(v: Int, w: Int, valid: Bool)]](repeating: [], count: n + 1)
  
  for i in 1..<n {
    let input = contents[i].split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, true))
//    adjList[v].append((u, c, true))
  }

  if n == contents.count { return 0 }
  for i in n..<contents.count-1 {
    let input = contents[i].split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let c = input[2]
    
    adjList[u].append((v, c, false))
//    adjList[v].append((u, c, false))
  }
//  print(adjList)
  
  // minimum spanning tree
//  return MCFKruskalMST(adjList, d)
  let (mstEdges, newEdges, replacedEdges) = MCFKruskalMST(adjList, d)
  return MCFCalculation(mstEdges, newEdges, replacedEdges, adjList, d)
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
        print("Test falied: in file: \(content). result: \(results), expect: \(expect[0])")
      } else {
        print("Done: in file: \(content). result: \(results)")
      }
    }
  }
  
  if failed == 0 {
    print("Success")
  } else {
    print("Failed: failed number: \(failed)")
  }
}
