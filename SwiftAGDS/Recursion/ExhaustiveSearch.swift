//
//  ExhaustiveSearch.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-10.
//

import Foundation

func printBinaryExhaustiveSearch(_ digits: Int) {
  printBinaryExhaustiveSearchHelper(digits)
}

func printBinaryExhaustiveSearchHelper(_ digits: Int, _ soFar: String = "") {
  if digits == 0 {
    print(soFar)
  } else {
    printBinaryExhaustiveSearchHelper(digits - 1, soFar + "0")
    printBinaryExhaustiveSearchHelper(digits - 1, soFar + "1")
  }
}

func printDecimalExhaustiveSearch(_ n: Int) {
  printBinaryExhaustiveSearchHelper(2)
}

func printDecimalExhaustiveSearchHelper(_ digits: Int, _ soFar: String = "") {
  if digits == 0 {
    print(soFar)
  } else {
    for i in 0...9 {
      printDecimalExhaustiveSearchHelper(digits - 1, soFar + "\(i)")
    }
  }
}

func permutation(_ word: String, _ soFar: String = "") {
  if word.count == 0 {
    print(soFar)
  } else {
    // recursive
    for i in 0..<word.count {
      let choosen = word[i]
      permutation(word[0, i] + word[i+1, word.count], soFar + choosen)
    }
  }
}

func permutationUniq(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    // recursive
    for i in 0..<word.count {
      let choosen = word[i]
      permutationUniq(word[0, i] + word[i+1, word.count], soFar + choosen, &set)
    }
  }
}


func combinations(_ word: String, _ number: Int, _ set: inout Set<String>) {
  combinationsHelper(word, number, "", &set)
}

func combinationsHelper(_ word: String, _ selected: Int, _ soFar: String = "", _ set:inout Set<String>) {
  if selected == 0 {
    permutationUniq(soFar, "", &set)
  } else {
    for i in 0..<word.count {
      let choosen = word[i]
      if soFar.contains(choosen) {
        continue
      }
      let leftLetters = word[0, i] + word[i+1, word.count]
      combinationsHelper(leftLetters, selected - 1, soFar + choosen, &set)
    }
  }
}
