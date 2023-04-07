//
//  repeatSequence.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-22.
//

import Foundation

func repeatingSequence() {
  let firstLine = readLine()!.split(separator: " ")
  var initial = Int(firstLine[0])!
  let power = Int(firstLine[1])!
  
  var sequence: [Int] = []
  sequence.append(initial)
  
  while checkRepeatingSequence(sequence: sequence) == nil {
    let next = getDigitArray(input: initial)
      .reduce(0, { $0 + pow(Decimal($1), power) })
    initial = NSDecimalNumber(decimal: next).intValue
    sequence.append(initial)
  }
  print(checkRepeatingSequence(sequence: sequence)!)
  
  func getDigitArray(input: Int) -> [Int] {
    var digitArray: [Int] = []
    var input = input
    
    while input != 0 {
      digitArray.append(input % 10)
      input = input / 10
    }
    return digitArray
  }
  
  func checkRepeatingSequence(sequence: [Int]) -> Int? {
    
    guard sequence.count > 1 else { return nil }
    
    // compare repeat start
    guard let start = sequence.firstIndex(of: sequence[sequence.count-1]), start != sequence.count-1 else {
      return nil
    }
    
    guard let nextStart = Array(sequence[start+1..<sequence.count-1]).firstIndex(of: sequence[sequence.count-1]) else {
      return nil
    }
    
    let secondRepeatArray = Array(sequence[start+nextStart+1..<sequence.count-1])
    let firstRepeat = Array(sequence[start..<nextStart+start+1])
    
    if firstRepeat == secondRepeatArray {
      return start
    }
    return nil
  }
}
