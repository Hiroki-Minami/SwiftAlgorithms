//
//  LongestIncreasingSubsequence.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-24.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
  var dp = [Int](repeating: 1, count: nums.count)
  
  for i in 1..<nums.count {
    for j in 0..<i {
      if nums[i] > nums[j] {
        dp[i] = max(dp[i], dp[j] + 1)
      }
    }
  }
  return dp.max()!
}
