//
//  OneTwoThree.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func oneTwoThree() {
  let testCase = Int(readLine()!)!
  for _ in 0..<testCase {
    let n = Int(readLine()!)!
    
    var dp = [Int](repeating: 0, count: n + 1)
    if n == 1 { print(1); return }
    if n == 2 { print(2); return }
    if n == 3 { print(4); return }
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    for i in 4...n {
      dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
    }
    print(dp[n])
  }
}
