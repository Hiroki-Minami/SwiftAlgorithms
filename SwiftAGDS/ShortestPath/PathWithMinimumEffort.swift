//
//  PathWithMinimumEffort.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-19.
//

import Foundation

func minimumEffortPath(_ heights: [[Int]]) -> Int {
  let adjcent = [(0, 1), (1, 0), (-1, 0), (0, -1)]
  let rows = heights.count
  let columns = heights[0].count
  
  var efforts = [[Int]](repeating: [Int](repeating: Int.max, count: columns), count: rows)
  efforts[0][0] = 0
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)
  let edgeNum = 2 * rows * columns - rows - columns
  
  if edgeNum == 0 { return 0 }
  
  for _ in 0..<edgeNum {
    var minEffort = Int.max
    var minVertex = (r: 0, c: 0)
    for (i, row) in heights.enumerated() {
      for (j, _) in row.enumerated() {
        if !visited[i][j] && minEffort > efforts[i][j] {
          minEffort = efforts[i][j]
          minVertex = (i, j)
        }
      }
    }
    visited[minVertex.r][minVertex.c] = true
    
    for adj in adjcent {
      let nr = minVertex.r + adj.0
      let nc = minVertex.c + adj.1
      if nr >= 0 && nr < rows && nc >= 0 && nc < columns && !visited[nr][nc] {
        let dif = abs(heights[nr][nc] - heights[minVertex.r][minVertex.c])
        efforts[nr][nc] = min(efforts[nr][nc], max(efforts[minVertex.r][minVertex.c], dif))
      }
    }
  }
  return efforts[rows-1][columns-1]
}
