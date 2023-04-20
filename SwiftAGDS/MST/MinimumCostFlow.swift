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
  print(MCFKruskalMST(adjList, d))
//  let (mstEdges, newEdges, replacedEdges) = MCFKruskalMST(adjList, d)
//  print(MCFCalculation(mstEdges, newEdges, replacedEdges, adjList, d))
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

//func MCFKruskalMST(_ graph: [[(v: Int, w: Int, valid: Bool)]], _ d: Int) -> (mstEdges: [(u: Int, v: Int, w: Int, valid: Bool)], newEdges: [(u: Int, v: Int, w: Int)], replacedEdges: [(u: Int, v: Int, w: Int)]) {
func MCFKruskalMST(_ graph: [[(v: Int, w: Int, valid: Bool)]], _ d: Int) -> Int {
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
//  var replacedEdges = [(u: Int, v: Int, w: Int)]()
  var newEdges = [(u: Int, v: Int, w: Int)]()
//  var newEdgesEnhanced = [(u: Int, v: Int, w: Int)]()
  
  var uf = UF(graph.count + 1)
//  var ufEnhanced = UF(graph.count + 1)
  var maximum = 0
  var days = 0
  
  for edge in allEdges {
    if uf.union(edge.u, edge.v) {
      maximum = edge.w
      if !edge.valid { days += 1 }
    }
//
//    if uf.connected(edge.u, edge.v) {
//      if !edge.valid {
//        replacedEdges.append((edge.u, edge.v, edge.w))
//      }
//      continue
//    }
//    if !edge.valid {
//      newEdges.append((edge.u, edge.v, edge.w))
//    }
//    mstEdges.append(edge)
//    uf.union(edge.u, edge.v)
  }
  
  var uf2 = UF(graph.count + 1)
  for edge in allEdges {
    if !uf.connected(edge.u, edge.v) {
      if edge.w < maximum || (edge.w == maximum && edge.valid) {
        uf2.union(edge.u, edge.v)
      } else if edge.valid && edge.w <= d {
        days -= 1
        break
      }
    }
  }
  
  return days
  
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
  
//  return (mstEdges, newEdges, replacedEdges)
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
  return MCFKruskalMST(adjList, d)
//  let (mstEdges, newEdges, replacedEdges) = MCFKruskalMST(adjList, d)
//  return MCFCalculation(mstEdges, newEdges, replacedEdges, adjList, d)
}

func testMinimumCostFlowInputFile() {
  let fileManager = FileManager.default
  let path = "/Users/minamihiroki/Desktop/WMAD_Program/Swift-AGDS/SwiftAGDSTests/mcf/"
  let contents = try! fileManager.contentsOfDirectory(atPath: path)
  var failed = 0
  
  for content in contents {
    if content.contains(".in") {
      let inFile = path + content
      let mcf = MCF()
      print("start: \(content)")
      let results = mcf.solve(inFile: inFile)
      
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


// 1. Kruskal's algorithm -> MST -> the cost
public struct MCF {
  public struct UF {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
      self.count = n
      self.size = [Int](repeating: 1, count: n)
      self.parent = [Int](repeating: 0, count: n)
      for i in 0..<n {
        self.parent[i] = i
      }
    }
    
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
      var root = p
      while root != parent[root] { // find the root
        root = parent[root]
      }
      var p = p
      while p != root {
        let newp = parent[p]
        parent[p] = root  // path compression
        p = newp
      }
      return root
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
      return find(p) == find(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    @discardableResult
    public mutating func union(_ p: Int, _ q: Int) -> Bool {
      let rootP = find(p)
      let rootQ = find(q)
      guard rootP != rootQ else { return false } // already connected
      
      // make smaller root point to larger one
      if size[rootP] < size[rootQ] {
        parent[rootP] = rootQ
        size[rootQ] += size[rootP]
      } else {
        parent[rootQ] = rootP
        size[rootP] += size[rootQ]
      }
      count -= 1
      return true
    }
  }
  public struct Edge: Comparable {
    private(set) var u: Int
    private(set) var v: Int
    private(set) var weight: Int
    private(set) var active: Int
    
    init(_ u: Int, _ v: Int, _ weight: Int, _ active: Int) {
      self.u = u
      self.v = v
      self.weight = weight
      self.active = active
    }
    
    public static func < (lhs: MCF.Edge, rhs: MCF.Edge) -> Bool {
      if lhs.weight != rhs.weight { return lhs.weight < rhs.weight }
      return  lhs.active > rhs.active
    }
  }
  
  func solve(inFile: String) -> Int {
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
    }
    
//    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    let line = contents[0].split(separator: " ").map { Int($0)! }
    let (N, M, D) = (line[0], line[1], line[2])
    var edges = [Edge](unsafeUninitializedCapacity: M) { (buffer, count) in
      for i in 0..<M {
//        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        let edge = contents[i+1].split(separator: " ").map { Int($0)! }
        if i < N - 1 {
          buffer[i] = Edge(edge[0], edge[1], edge[2], 1)
        } else {
          buffer[i] = Edge(edge[0], edge[1], edge[2], 0)
        }
      }
      count = M
    }
    
    // sort edges (M log M)
    edges.sort()
    
    var uf = UF(N + 1)
    var (days, count, max, i) = (0, 0, 0, 0)
    
    // get MST -> optimized plan
    while i < M {
      if count == N - 1 { break }
      let e = edges[i]
      if uf.union(e.u, e.v) {
        count += 1
        max = e.weight // the max cost pipe in the optimized plan
        if e.active == 0 { days += 1 }
      }
      i += 1
    }
    
    // either days or days - 1 is the answer.
    // check if we can use enhancer to reduce one day.
    // want to replace the inactive pipe (heaviest) with an active pipe with same or less MST cost.
    if edges[i - 1].active == 0 {
      var uf2 = UF(N + 1) // another Kruskal's algorithm since the replaced active pipe should form a MST.
      for e in edges {
        if !uf2.connected(e.u, e.v) {
          if e.weight < max || (e.weight == max && e.active == 1) {
            // all pipes that were part of the optimized plan should be included.
            uf2.union(e.u, e.v)
          } else if e.active == 1 && e.weight <= D {
            // active pipe that has the cost less than or equal to the enhancer.
            // because the MST cost has to be less than or equal to the previous optimized plan.
            // (otherwise, there's no reason to replace.)
            days -= 1
            break
          }
        }
      }
    }
    return days
  }
}
