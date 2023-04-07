//
//  AdjacencyMetrix.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-21.
//

import Foundation

func adjacencyMetrix() {
  let firstList = readLine()!.split(separator: " ")
  let n = Int(firstList[0])!
  let m = Int(firstList[1])!
  var adjMatrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(firstList[0])!
    let v = Int(firstList[1])!
    adjMatrix[u-1][v-1] = 1
    adjMatrix[v-1][u-1] = 1
  }
  
}
