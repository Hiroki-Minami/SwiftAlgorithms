//
//  GasStation.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-13.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  if gas.reduce(0, +) < cost.reduce(0, +) { return -1 }
  
  var total = 0
  var index = 0
  
  for i in 0..<gas.count {
    total += gas[i] - cost[i]
    if total < 0 {
      total = 0
      index = i + 1
    }
  }
  return index
}
