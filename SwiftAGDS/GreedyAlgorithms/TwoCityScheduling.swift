//
//  TwoCityScheduling.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-13.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
  let half = costs.count % 2 == 0 ? costs.count / 2 : costs.count / 2 + 1
  let sorted = costs.sorted { abs($0[0] - $0[1]) > abs($1[0] - $1[1]) }
  
  var sum = 0
  var a = 0
  var b = 0
  for cost in sorted {
    if a == half || b == half {break}
    if cost[0] < cost[1] {
      sum += cost[0]
      a += 1
    } else {
      sum += cost[1]
      b += 1
    }
  }
  
  if a == half && b == half { return sum }
  
  let index = a + b
  if a == half {
    sum += sorted[index...].reduce(0) { $0 + $1[1] }
  } else {
    sum += sorted[index...].reduce(0) { $0 + $1[0] }
  }
  return sum
}
