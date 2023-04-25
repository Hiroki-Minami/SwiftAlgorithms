//
//  MaximumSubarray.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-25.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
  var dp = [Int](repeating: 0, count: nums.count)
  
  // if current + previous >= current -> use
  // otherwise restart it
  dp[0] = nums[0]
  if nums.count < 2 { return dp[0] }
  
  for i in 1..<nums.count {
    if nums[i] + dp[i-1] < nums[i] {
      // restart
      dp[i] = nums[i]
    } else {
      dp[i] = dp[i-1] + nums[i]
    }
  }
  return dp.max()!
}
