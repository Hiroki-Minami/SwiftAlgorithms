//
//  SumOfSquareNumbers.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-24.
//

import Foundation

func sumOfSquareNumbers(_ n: Int) -> Int {
  var dp = [Int](repeating: Int.max, count: n + 1)
  dp[0] = 0
  dp[1] = 1
  dp[2] = 2
  
  if n <= 2 {
    return dp[n]
  }
  
  for i in 3...n {
    let maximum = Int(sqrt(Double(i)))
    for j in 1...maximum {
      let previous = i - j * j
      if previous < 0 { break }
      dp[i] = min(dp[i], dp[previous] + 1)
    }
  }
  return dp[n]
}
