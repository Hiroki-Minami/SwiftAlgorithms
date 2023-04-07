//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

//var count = 0
@discardableResult
func solveQueens(board: inout Board, col: Int = 0) -> Bool {
//	count += 1
  if col >= board.size {
    print(board)
    return true
  } else {
    for row in 0..<board.size {
      if board.isSafe(row: row, col: col) {
        board.place(row: row, col: col)
        if solveQueens(board: &board, col: col + 1) {
          return true
        }
        board.remove(row: row, col: col)
      }
    }
  }
  return false
}

func solveQueensAllPatterns() {
  var patternNumber = 0
  var board = Board(size: 8)
  solveQueensAllPatternsHelper(0, 0, &board, &patternNumber)
  print("possible ways: \(patternNumber)")
}

func solveQueensAllPatternsHelper(_ placedTimes: Int, _ currentRow: Int, _ board: inout Board, _ patternNumber: inout Int) {
  if placedTimes == board.size {
    print(board)
    patternNumber += 1
  } else {
    for row in currentRow..<board.size {
      for column in 0..<board.size {
        if board.isSafe(row: row, col: column) {
          board.place(row: row, col: column)
          solveQueensAllPatternsHelper(placedTimes + 1, row + 1, &board, &patternNumber)
          board.remove(row: row, col: column)
        }
      }
    }
  }
}

