//
//  Floyd.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-20.
//

import Foundation

func floyd() {
  let n = Int(readLine()!)!
  let m = Int(readLine()!)!
  
  var adjMatrix = [[Int]](repeating: [Int](repeating: Int.max, count: n + 1), count: n + 1)
  for i in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
//    print(i)
    adjMatrix[line[0]][line[1]] = min(adjMatrix[line[0]][line[1]], line[2])
  }
  for i in 0...n {
    adjMatrix[i][i] = 0
  }
  
  for k in 1...n {
    for i in 1...n {
      for j in 1...n {
        if adjMatrix[i][k] != Int.max && adjMatrix[k][j] != Int.max && adjMatrix[i][j] > adjMatrix[i][k] + adjMatrix[k][j] {
          adjMatrix[i][j] = adjMatrix[i][k] + adjMatrix[k][j]
        }
      }
    }
  }
  
  for (i, row) in adjMatrix.enumerated() {
    if i == 0 { continue }
    for (j, col) in row.enumerated() {
      if j == 0 { continue }
      print("\(col) ", terminator: "")
    }
    print()
  }
}
