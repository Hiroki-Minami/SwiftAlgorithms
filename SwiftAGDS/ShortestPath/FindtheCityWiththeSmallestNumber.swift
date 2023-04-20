//
//  FindtheCityWiththeSmallestNumber.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-20.
//

import Foundation

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
  var matrix = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
  for edge in edges {
    matrix[edge[0]][edge[1]] = edge[2]
    matrix[edge[1]][edge[0]] = edge[2]
  }
  for (i, row) in matrix.enumerated() {
    matrix[i][i] = 0
  }
  
  // Floyd-Warshall
  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        if i == j { continue }
        if matrix[i][k] != Int.max && matrix[k][j] != Int.max && matrix[i][j] > matrix[i][k] + matrix[k][j] {
          matrix[i][j] = matrix[i][k] + matrix[k][j]
        }
      }
    }
  }
  
  var minimumReachableCities = Int.max
  var minimumCity = 0
  
  for (city, row) in matrix.enumerated() {
    let count = row.filter { $0 <= distanceThreshold }.count
    if minimumReachableCities >= count {
      minimumReachableCities = count
      minimumCity = city
    }
  }
  return minimumCity
}
