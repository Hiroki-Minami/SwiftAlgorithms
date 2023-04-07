//
//  AdjacencyList.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-21.
//

import Foundation

func adjacencyListWithWeight() {
  let firstList = readLine()!.split(separator: " ")
  let n = Int(firstList[0])!
  let m = Int(firstList[1])!
  var adjMatrix = [[(Int, Int)]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(firstList[0])!
    let v = Int(firstList[1])!
    let w = Int(firstList[2])!
    
    adjMatrix[u].append((v, w))
    adjMatrix[v].append((u, w))
  }
}
