//
//  PartitionLabels.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-13.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
    var sIndex = s.startIndex
    var groupIndex = 0

    var group: [String] = []

    while sIndex < s.endIndex {
        let ch = s[sIndex]
        var lastIndex = s.lastIndex(of: ch)!

        if sIndex == lastIndex {
            // it can be only one group
            group.append(String(ch))
            sIndex = s.index(sIndex, offsetBy: 1)
            continue
        }

        var gString = String(s[sIndex...lastIndex])
        var gStringLen = 0
        var nextLast = s.index(after: lastIndex)
        var gLetterSet = Set<Character>()
        gLetterSet.insert(ch)
        while gStringLen != gString.count {
            gStringLen = gString.count
            for gch in gString {
                nextLast = s.lastIndex(of: gch)!
                if !gLetterSet.contains(gch) {
                    if nextLast > lastIndex {
                        gString = String(s[sIndex...nextLast])
                        lastIndex = nextLast
                    }
                    gLetterSet.insert(gch)
                }
            }
        }
        group.append(gString)

        sIndex = s.index(lastIndex, offsetBy: 1)
    }
    let counts = group.map({ $0.count })
    return counts
}
