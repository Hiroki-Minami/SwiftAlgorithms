//
//  ClimbingStairs.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
  var dp: [Int] = [Int](repeating: -1, count: n + 1)
  dp[0] = 1
  dp[1] = 1
  if n <= 1 {
    return dp[n]
  }
  for i in 2...n {
    dp[i] = dp[i-1] + dp[i-2]
  }
  return dp[n]
}
