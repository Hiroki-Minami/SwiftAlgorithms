//
//  Pokemon.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-24.
//

import Foundation

func pokemon() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]
  
  var grid = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
  
  for i in 0..<n {
    grid[i] = readLine()!.split(separator: " ").map { Int($0)! }
  }
  
  var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
  dp[0][0] = grid[0][0]
  
  let adj = [
  (0,1),
  (1,0)
  ]
  
  var queue = [(r: 0, c: 0)]
  
  while !queue.isEmpty {
    for (y, x) in queue {
      for (dy, dx) in adj {
        let ny = y + dy
        let nx = x + dx
        if ny < n && nx < m {
          dp[ny][nx] = max(dp[ny][nx], dp[y][x] + grid[ny][nx])
          queue.append((ny, nx))
        }
      }
      queue.removeFirst()
    }
  }
  print(dp[n-1][m-1])
}
