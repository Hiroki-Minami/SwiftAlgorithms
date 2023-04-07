//
//  DesigningAlgorithms.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-17.
//

import Foundation

var count = 0

func smallestElementsFromStreamSlow(_ inputs: [Int], _ n: Int, _ m : Int) -> [Int] {
  var times = 0
  var results: [Int] = Array(repeating: Int.max, count: m)
  while times < n {
    let next = inputs[times]
    for i in 0..<results.count {
      count += 1
      if i == results.count-1 {
        if next < results[i] {
          results.removeLast()
          results.insert(next, at: i)
          break
        }
      } else if i == 0 && next <= results[i] {
        results.removeLast()
        results.insert(next, at: i)
        break
      } else if next >= results[i] && next <= results[i+1] {
        results.removeLast()
        results.insert(next, at: i + 1)
        break
      }
    }
    times += 1
  }
  return results
}

func smallestElementsFromStream(_ inputs: [Int], _ n: Int, _ m : Int) -> [Int] {
  var times = 0
  var results: [Int] = Array(repeating: Int.max, count: m)
  while times < n {
    let next = inputs[times]
    if next < results[m-1] { // compare to max
      results.removeLast()
      results.insert(next, at: insertIndexWithBinarySearch(results, next))
    } else {
      count += 1
    }
    times += 1
  }
  return results
}

func insertIndexWithBinarySearch(_ arr: [Int], _ target: Int) -> Int {
  if arr.count == 0 {
    return 0
  }
  var lower = 0
  var upper = arr.count - 1
  
  while lower <= upper && (upper - lower) > 1 {
    count += 1
    let mid = (lower + upper) / 2
    if arr[mid] >= target && arr[mid-1] <= target {
      return mid
    } else if arr[mid] < target {
      lower = mid + 1
    } else {
      upper = mid - 1
    }
  }
  count += 1
  if target <= arr[lower] {
    return lower
  } else if target <= arr[upper] {
    return upper
  } else {
    return upper + 1
  }
}


func bruteForceSubstringSearch(_ s: String, _ target: String) -> Int? {
  if s.count < target.count {
    return nil
  }
  var index = 0
  while index <= s.count - target.count {
    count += 1
    if s[index, index+target.count] == target {
      return index
    }
    index += 1
  }
  return nil
}

func KMPAlgorithm(_ s: String, _ target: String) -> Int? {
  if s.count < target.count {
    return nil
  }
  
  var sIndex = 0
  var targetIndex = 0
  let table = makePrefixTable(target)
  
  while sIndex < s.count - 1 {
    count += 1
    if s[sIndex] == target[targetIndex] {
      if targetIndex == target.count - 1 {
        return sIndex - targetIndex
      }
      sIndex += 1
      targetIndex += 1
    } else {
      if targetIndex == 0 {
        sIndex += 1
      } else {
        targetIndex = table[targetIndex-1]
        if targetIndex == 0 {
          sIndex += 1
        }
      }
    }
  }
  return nil
}

// ABC ABCDAB ABCDABCDABDE
// ABCDABD
// 0000120
func makePrefixTable(_ target: String) -> [Int] {
  var table = Array<Int>(repeating: 0, count: target.count)
  var i = 0
  var j = 1
  while j < target.count {
    if target[i] != target[j] {
      if i == 0 {
        j += 1
      }
      i = 0
    } else {
      table[j] = i + 1
      j += 1
      i += 1
    }
  }
  return table
}
