//
//  NonDecreasingDigits.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func nonDecreasingDigits(_ n: Int) -> Int {
  var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
  
  for i in 0...9 {
    dp[1][i] = 1
  }
  
  if n >= 2 {
    for i in 2...n {
      for j in 0...9 {
        if j == 0 {
          dp[i][j] = dp[i-1][j]
        } else {
          dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
      }
    }
  }
  var sum = 0
  for num in dp[n] {
    sum += num
  }
  return sum
}
