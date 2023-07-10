//
//  main.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-09.
//

import Foundation

//print("\(9 / 2)")

//printBinary(8)
//reverseLines()

//readFile()

// evaluate("7")                 -> 7
// evaluate("(2+2)")             -> 4
// evaluate("(1+(2*4))")         -> 9
// evaluate("((1+3)+((1+2)*5))") -> 19

//print(evaluate("7"))
//print(evaluate("(2+2)"))
//print(evaluate("(1+(2*4))"))
//print(evaluate("((1+3)+((1+2)*5))"))
//print(evaluate2("(((1+2)*5)+(1+3))"))

//printBinaryExhaustiveSearch(2)

//var comb = Set<String>()
//combinations("GOOGLE", 3, &comb)
////print(comb)
//for str in comb {
//  print(str)
//}

//rollDice(2)
//rollDiceSum(2, 5)

//solveQueensAllPatterns()
//var board = Board(size: 8)
//solveQueens(board: &board)
//print(count)

//var unsorted = [4,2,3,1,5,7,6]
////print(unsorted.count-1)
//quickSort(&unsorted, 0, unsorted.count-1)
//print(unsorted)

//var list = [6,4,2,3,6,5,7,1,8,4,5,3,2,7,1,1]
var list = [9, 14]
list.max()
list.reduce(0, +)
var set = Set<Int>(list)

var list2: [Character] = ["1", "2"]
//var list3 = [[3,2],[2,3]]
//list3.sort(by: {$0.0[0] < $0.1[0]})

var list3 = [[3,2],[2,3]]
//list3.contains(where: { $0[1] })
list3.sort(by: { $0[0] < $1[0] })
//print(list3[0].remove(at: 0))

//print(list3.contains([2,2]))

//for a in list[2...] {
//  print(a)
//}

//list.contains { $0 < 0 }
//print(sorted.filter { $0 > 5 }
//  .reduce(0) { $0 + $1 })

//for (index, element) in sorted.enumerated() {
//  print(index)
//  print(element)
//}
//print(abs(-1))
//print(smallestElementsFromStreamSlow(list, list.count, 6))
//print(count)

//print(smallestElementsFromStream(list, list.count, 6))
//print(count)



//let str = "ABC ABCDAB ABCDABCDABDE"
//let target = "ABCDABD"
//print(bruteForceSubstringSearch(str, target))
//print(count * target.count)
//print(KMPAlgorithm(str, target))
//print(count)





//let bag = Bag<String>()
//bag.add(item: "Hello")
//bag.add(item: "Bye")
//
//for e in bag {
//  print(e)
//}

//let stack = Stack<Int>()
//print(stack.peek())
//print(stack.pop())
//stack.push(item: 1)
//stack.push(item: 2)
//print(stack.peek())
//print(stack.peek())
//print(stack.pop())
//print(stack.peek())
//stack.push(item: 3)
//stack.push(item: 4)
//
//for e in stack {
//  print(e)
//}

//let queue = Queue<Int>()
//print(queue.peek())
//print(queue.dequeue())
//queue.enqueue(item: 1)
//queue.enqueue(item: 2)
//print(queue.peek())
//print(queue.dequeue())
//print(queue.peek())
//print(queue.peek())
//queue.enqueue(item: 3)
//queue.enqueue(item: 4)
//
//for e in queue {
//  print(e)
//}



//connectedComponents()
//bipartiteGraph()
//findCycle()
//countCyclicPermutation()
//repeatingSequence()

//preOrder()
//inOrder()
//postOrder()
//diameter()
//whosMyParentInput()

//whosMyParentInput()
//testWhosMyParentInputFile()

//lowestCommonAncestor()
//sushiReviews()
//testSushiReviewsInputFile()
//town()
//tomatoFarm()
//briges()

//var intervals = [[0, 30], [5,10], [15,20]]
//var intervals = [[7,10], [2,4]]
//print(canAttendMeetings(intervals))

//var str = "dknaodn"
//var nadnian: [Set<String>] = [Set<String>()]
//let haiudnf = str.lastIndex(of: "d")!
//let irutogjroj = str.startIndex
//print(str[irutogjroj...haiudnf])
//print(str[...])
//print(str.firstIndex(of: "a"))
//print(str.lastIndex(of: "a"))
//let ajdnojao = str[str.startIndex]
//str.contains(ajdnojao)
//str += String(ajdnojao)
//print(str.lastIndex(of: ajdnojao)!)
//print(haiudnf)
//print(haiudnf == str.lastIndex(of: ajdnojao)!)
//print(str.index(after: str.startIndex))
//print(str[str.startIndex])
//print(str[str.index(str.startIndex, offsetBy: 2)])
//print(str.index(str.startIndex, offsetBy: 2))
//print(str.endIndex)
////print(str[str.endIndex])
//
//let listidi: [String] = ["sjh", "usnd"]
//let baydbabdh = listidi.map({ $0.count })
//let andojnaindfanf = ""
//print(andojnaindfanf.count)
//
//var auindiufaMap: [Character: Int] = [:]
//for ch in str {
//  auindiufaMap[ch, default: 0] += 1
//}
//
//print(auindiufaMap.values.max()!)
//print(auindiufaMap.keys.count)
//
//print(auindiufaMap)
//
//var nauidnfoaundofba = Set<Int>()
//nauidnfoaundofba.removeAll()
//
//var anidubai: Character? = nil

//print(leastInterval(["A","A","A","B","B","B"], 0))
//minimumCostFlow()
//testMinimumCostFlowInputFile()
//let times = [[3,5,78],[2,1,1],[1,3,0],[4,3,59],[5,3,85],[5,2,22],[2,4,23],[1,4,43],[4,5,75],[5,1,15],[1,5,91],[4,1,16],[3,2,98],[3,4,22],[5,4,31],[1,2,0],[2,5,4],[4,2,51],[3,1,36],[2,3,59]]
//print(networkDelayTime(times, 5, 5))
//let flights = [[0,1,1],[0,2,5],[1,2,1],[2,3,1]]
//print(findCheapestPrice(4, flights, 0, 3, 1))
//print(findCheapestPrice(100, flights, 1, 99, 99))
//let flights = [[0,1,100],[1,2,100],[0,2,500]]
//print(findCheapestPrice(3, flights, 0, 2, 1))
//let flights = [[4,1,1],[1,2,3],[0,3,2],[0,4,10],[3,1,1],[1,4,3]]
//print(findCheapestPrice(5, flights, 2, 1, 1))
//let flights = [[2,0,1],[2,1,10],[0,3,5],[1,2,1],[3,2,6],[2,3,3]]
//print(findCheapestPrice(4, flights, 3, 2, 3))
//print(log(0.5))
//print(log(0.2))
//var ajodjfoa = log(0.5) + log(0.5)
//print(exp(ajodjfoa))
let edges = [[0,1],[1,2],[0,2]]
let jandojnfa = edges.map({$0[0]})
//print(edges.flatMap({ $0 }).count)
//print(maxProbability(3, edges, [0.5, 0.5, 0.2], 0, 2))

//print(minimumEffortPath([[1,10,6,7,9,10,4,9]]))
//print(minimumEffortPath([[1,2,2],[4,8,2],[5,3,5]]))

//var andiufnbai = [Int: [Bool]]()
//andiufnbai[0] = [false]
//andiufnbai[1] = [true]
//let akjdnfja = andiufnbai.keys.sorted(by: >)
//for i in akjdnfja {
//  print(i)
//}
//let naundnajdn = andiufnbai[1]!.reversed()
//var ndjandj = 3

//floyd()
//print(prettyNumber(n: 3))
//print(twoByNTiles(n: 2))
//print(twoTimesNTilesTwo(12))
//oneTwoThree()
//print(nonDecreasingDigits(3))
//print(sumOfSquareNumbers(2624))
//pokemon()

//print(1<<62)
// 272187084
// 2199023255552
// 1073741824 : 30
// 268435456 :28
// 536870912 :29

var aoindmap = [1: 2, 2: 3]
let ndinaijd = aoindmap.filter({ $0.value == 2 }).map({ $0.key })
//testnajdn.sorted(by: <)
for (depth, sum) in aoindmap {
  
}
aoindmap.values.max()

func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
    var aArr = convertToArrayOfReversedBits(a)
    var bArr = convertToArrayOfReversedBits(b)
    var cArr = convertToArrayOfReversedBits(c)
  
  

    var count = 0
    for i in 0..<cArr.count {
        let aBit = i < aArr.count ? aArr[i]: 0
        let bBit = i < bArr.count ? bArr[i]: 0

        if cArr[i] == 0 {
            count += aBit + bBit
        } else {
            count += aBit == 1 || bBit == 1 ? 0: 1
        }
    }
    return count
}

func convertToArrayOfReversedBits(_ num: Int) -> [Int] {
    var bits = [Int]()
    var num = num

    while num > 0 {
        let bit = num & 1
        bits.append(bit)
        num >>= 1
    }
    return bits
}

//print(minFlips(8, 3, 5))


func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    let n = prices.count
    var dp = [[Int]](repeating: [Int](repeating: Int.min, count: n), count: n)

    func maxProfitRecursive(_ index: Int, _ boughtIndex: Int) -> Int {
        guard index < n else { return 0 }
        guard dp[index][boughtIndex] == Int.min else { return dp[index][boughtIndex] }

        var boughtIndex = boughtIndex
        boughtIndex = prices[boughtIndex] > prices[index] ? index: boughtIndex

        if index == boughtIndex || prices[index] - prices[boughtIndex] - fee <= 0 {
            dp[index][boughtIndex] = maxProfitRecursive(index + 1, boughtIndex)
        } else {
            let sold = prices[index] - prices[boughtIndex] - fee + maxProfitRecursive(index + 1, index + 1)
            let keep = maxProfitRecursive(index + 1, boughtIndex)
            dp[index][boughtIndex] = max(sold, keep)
        }
        return dp[index][boughtIndex]
    }
    return maxProfitRecursive(0, 0)
}

print(maxProfit([1,3,7,5,10,3], 3))
