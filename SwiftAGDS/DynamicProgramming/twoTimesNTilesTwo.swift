//
//  twoTimesNTilesTwo.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func twoTimesNTilesTwo(_ n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  d[2] = 3
  if n <= 2 {
    return d[n]
  }
  for i in 3...n {
    d[i] = d[i - 1] + 2 * d[i - 2]
  }
  return d[n]
}
