//
//  NumDecode.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-25.
//

import Foundation

func numDecodings(_ s: String) -> Int {
  var dp = [Int](repeating: 0, count: s.count)
  let chars = Array(s)
  
  guard chars[0] != "0" else { return 0 }
  guard chars.count != 1 else { return 1 }
  dp[0] = 1
  
  if Int(String(chars[0...1]))! <= 26 && Int(String(chars[1]))! != 0 {
    dp[1] = 2
  } else if Int(String(chars[0...1]))! > 26 && Int(String(chars[1]))! == 0 {
    return 0
  } else {
    dp[1] = 1
  }
  guard chars.count >= 2 else { return dp[1] }
  
  for i in 2..<chars.count {
    if chars[i] != "0" {
      dp[i] += dp[i-1]
    }
    
    let twoDigits = Int(String(chars[i-1...i]))!
    if twoDigits >= 10 && twoDigits <= 26 {
      dp[i] += dp[i-2]
    }
  }
  return dp[s.count-1]
}
