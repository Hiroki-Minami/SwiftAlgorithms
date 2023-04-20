//
//  PathFinding.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-20.
//

import Foundation

func pathFinding() {
  let n = Int(readLine()!)!
  var adjMatrix = [[Int]]()
  for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    adjMatrix.append(line)
  }
  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        if adjMatrix[i][k] == 1 && adjMatrix[k][j] == 1 {
          adjMatrix[i][j] = 1
        }
      }
    }
  }
  
  for row in adjMatrix {
    for col in row {
      print("\(col) ", terminator: "")
    }
    print()
  }
}
