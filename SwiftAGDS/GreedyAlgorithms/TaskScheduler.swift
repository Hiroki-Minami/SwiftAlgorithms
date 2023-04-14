//
//  TaskScheduler.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-14.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    if n == 0 { return tasks.count }
    
    var charMap: [Character: Int] = [:]
    for task in tasks {
        charMap[task, default: 0] += 1
    }
    var maximum = charMap.values.max()!

    var chars: [[Character]] = [[Character]](repeating: [], count: maximum + 1)
    for (ch, value) in charMap {
        chars[value].append(ch)
    }

    var current = 0
    var count = 0
    var appeared = Set<Character>()
    let goal = charMap.keys.count

    while chars[0].count != goal {
        var choseChar: Character? = nil
        if current == 0 {
            appeared.removeAll()

            choseChar = chars[maximum].remove(at: 0)
            chars[maximum-1].append(choseChar!)
        } else {
            var tempMax = maximum

            while choseChar == nil {
                for (i, ch) in chars[tempMax].enumerated() {
                    if !appeared.contains(ch) {
                        choseChar = chars[tempMax].remove(at: i)
                        chars[tempMax-1].append(choseChar!)
                        break
                    }
                }
                tempMax -= 1
                if tempMax == 0 { break }
            }
        }
        if choseChar != nil {
            appeared.insert(choseChar!)
        }
        if chars[maximum].isEmpty { maximum -= 1}
        count += 1
        current += 1
        current = current % (n + 1)
    }
    return count
}
