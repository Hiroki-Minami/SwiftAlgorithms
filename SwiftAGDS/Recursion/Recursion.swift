//
//  Recursion.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-09.
//

import Foundation

func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0)
  if exponent == 0 { return 1 }
  return base * power(base: base, exponent: exponent - 1)
}

func isPalindrome(word: String) -> Bool {
  if word.count <= 1 { return true }
  
  if let firstChar = word.first, let lastChar = word.last, firstChar == lastChar {
    let s = word.index(after: word.startIndex)
    let l = word.index(before: word.endIndex)
    return isPalindrome(word: String(word[s..<l]))
  }
  return false
}

func printBinary(_ n: Int) {
  if n / 2 <= 1 {
      print("\(n / 2)", terminator: "")
      print("\(n % 2)", terminator: "")
  } else {
    printBinary(n / 2)
    print("\(n % 2)", terminator: "")
  }
}

//func readFile() {
//  let contents = try! String(String(contentsOfFile: "/Users/minamihiroki/Desktop/WMAD_Program/Swift-AGDS/Swift-AGDS/Recursion/story.txt"))
//  print(contents)
//}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int = 0) {
  let contents = try! String(String(contentsOfFile: "/Users/minamihiroki/Desktop/WMAD_Program/Swift-AGDS/Swift-AGDS/Recursion/story.txt")).split(separator: "\n")
  
  if contents.count > line + 1 {
    reverseLines(line + 1)
  }
  print(contents[line])
}

// 5. evaluate
// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
// - You can use a helper function. (Do not change the original function header)
// - Use Recursion
//
// Examples)
// evaluate("7")                 -> 7
// evaluate("(2+2)")             -> 4
// evaluate("(1+(2*4))")         -> 9
// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
  var i = 0
  return evaluateHelper(expr, &i)
}

func evaluateHelper(_ expr: String, _ i:inout Int) -> Int {
  if Character(expr[i]).isNumber {
    return Int(expr[i])!
  } else {
    i += 1
    let left = evaluateHelper(expr, &i)
    i += 1
    let op = expr[i]
    i += 1
    let right = evaluateHelper(expr, &i)
    i += 1
    if op == "+" {
      return left + right
    } else {
      return left * right
    }
  }
}
