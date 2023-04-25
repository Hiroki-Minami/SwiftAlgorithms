//
//  2TimesNtiles.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-21.
//

import Foundation

func twoByNTiles(n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  for i in 2...n {
    d[i] = d[i - 1] + d[i - 2]
  }
  return d[n]
}
