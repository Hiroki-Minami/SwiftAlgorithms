//
//  MakeOne.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func makeOne(n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1 )
  d[1] = 0
  for i in 2...n {
    d[i] = d[i - 1] + 1
    if i % 2 == 0 && d[i] > d[i / 2] + 1 {
      d[i] = d[i / 2] + 1
    }
    if i % 3 == 0 && d[i] > d[i / 3] + 1 {
      d[i] = d[i / 3] + 1
    }
  }
  return d[n]
}
