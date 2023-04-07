//
//  BackTracking.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-13.
//

import Foundation

func rollDice(_ n: Int) {
  var choices = [Int]()
  // select 1 to 6
  // select 1 to 6
  rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  if n == 0 {
    print(choices)
  } else {
    for i in 1...6 {
      choices.append(i)
      rollDiceHelper(n - 1, choices: &choices)
      choices.removeLast()
    }
  }
}

func rollDiceSum(_ n: Int, _ sum: Int) {
  var choices = [Int]()
//  rollDiceSumHelper(n, sum, choices: &choices)
  rollDiceSumBetter(n, sum, 0, &choices)
}

var recCalls = 0
func rollDiceSumHelper(_ n: Int, _ sum: Int, choices: inout [Int]) {
  recCalls += 1
  if n == 0 {
    if sum == 0 {
      print(choices)
    }
  } else {
    for i in 1...6 {
      choices.append(i)
      if sum > 0 {
        rollDiceSumHelper(n - 1, sum - i, choices: &choices)
      }
      choices.removeLast()
    }
  }
}

func rollDiceSumBetter(_ n: Int, _ sum: Int, _ soFar: Int, _ choices: inout [Int]) {
  if n == 0 {
    if soFar == 0 {
      print(choices)
    }
  } else {
    for i in 1...6 {
      if (soFar + i + 1 * (n-1) <= sum && (soFar + i + 6 * (n-1) >= sum)) {
        choices.append(i)
        rollDiceSumBetter(n - 1, sum, soFar + i, &choices)
        choices.removeLast()
      }
    }
  }
}
