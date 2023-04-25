//
//  PrettyNumber.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func prettyNumber(n: Int) -> Int {
  var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
  for i in 1...9 {
    // N = 1
    d[1][i] = 1
  }
  
  for i in 2...n {
    for j in 0...9 {
      d[i][j] = 0
      if j >= 1 {
        d[i][j] += d[i - 1][j - 1]
      }
      if j <= 8 {
        d[i][j] += d[i - 1][j + 1]
      }
    }
  }
  var ans = 0
  for i in 0...9 {
    ans += d[n][i]
  }
  return ans
}
