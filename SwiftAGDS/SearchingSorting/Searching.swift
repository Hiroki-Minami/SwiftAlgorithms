//
//  Searching.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-16.
//

import Foundation

func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
    return index
  }
  return nil
}

// O(lg N)
// 
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
  var lower = 0
  var upper = collection.count - 1
  
  while lower <= upper {
    let mid = (lower + upper) / 2
    if collection[mid] == target {
      return mid
    } else if collection[mid] < target {
      lower = mid + 1
    } else {
      upper = mid - 1
    }
  }
  return nil
}
