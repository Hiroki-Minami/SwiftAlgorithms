//
//  Sorting.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-16.
//

import Foundation

// bubble sort
// 1. swap
// O = (N^2)
func bubbleSort<T: Comparable> (_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
    for j in 0..<elements.count - i {
      if comparator(elements[j], elements[j-1]) {
        let temp = elements[j-1]
        elements[j-1] = elements[j]
        elements[j] = temp
      }
    }
  }
  return elements
}

// O = (N^2)
func selectionSort<T: Comparable> (_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
    var indexMin = i
    for j in i+1..<elements.count {
      if comparator(elements[j], elements[indexMin]) {
        indexMin = j
      }
    }
    if i != indexMin {
      elements.swapAt(indexMin, i)
    }
  }
  return elements
}

// sorted portion and unsorted portion
// O = (N^2)
func insertionSort<T: Comparable> (_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 1..<elements.count {
    var j = i
    let toInsert = elements[j]
    while j > 0 && comparator(toInsert, elements[j - 1]) {
      elements[j] = elements[j-1]
      j -= 1
    }
    elements[j] = toInsert
  }
  return elements
}

// O = (NlgN) recursive
// [4,3,1,5,2]
// divide into 2 different sub array
// [4,3], [5,1,2]
// [4], [3], [5], [1,2]
// [4], [3] [5], [1], [2]
// [3,4], [5], [1,2]
// [3,4], [1,2,5]
// [1,2,3,4,5]

func mergeSort<T: Comparable> (_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  // divide
  guard arr.count > 1 else { return arr }
  
  let mid = arr.count / 2
  let left = mergeSort(Array(arr[0..<mid]), comparator)
  let right = mergeSort(Array(arr[mid...]), comparator)
  
  // conquer (merge)
  return merge(left, right, comparator)
}

func merge<T: Comparable> (_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  
  while true {
    guard i < left.count else {
      merged.append(contentsOf: right[j...])
      break
    }
    
    guard j < right.count else {
      merged.append(contentsOf: left[j...])
      break
    }
    if comparator(left[i], right[j]) {
      merged.append(left[i])
      i += 1
    } else {
      merged.append(right[j])
      j += 1
    }
  }
  return merged
}

// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
  if arr.count <= 1 { return arr }
  var elements = arr
  let pivot = elements.removeLast()
  let lessOrEqual = elements.filter { $0 <= pivot }
  let greater = elements.filter { $0 > pivot }
  return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
  // TODO
  if start < end {
    let pivotIndex = partition(&arr, start, end)
    quickSort(&arr, start, pivotIndex - 1)
    quickSort(&arr, pivotIndex + 1, end)
  }
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
  var pivotIndex = start
  let pivot = arr.remove(at: end)
  arr.insert(pivot, at: start)
  for i in start+1...end {
    if arr[i] < pivot {
      let temp = arr.remove(at: i)
      arr.insert(temp, at: start)
      pivotIndex += 1
    }
  }
  return pivotIndex
}
