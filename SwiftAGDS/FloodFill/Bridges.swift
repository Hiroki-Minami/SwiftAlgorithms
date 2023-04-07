//
//  Bridges.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-04.
//

import Foundation

func briges() {
  let firstLine = Int(readLine()!)!
  var map = [[Int]](repeating: [], count: firstLine)
  
  for i in 0..<firstLine {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
  }
  
  var color = 2
  var groupMap = [[Int]](repeating: [Int](repeating: 0, count: firstLine), count: firstLine)
  
  for (y, row) in map.enumerated() {
    for (x, cell) in row.enumerated() {
      if cell == 1 && groupMap[y][x] == 0 {
        groupBfs((y,x), color, &groupMap, &map)
        color += 1
      }
    }
  }
  
  if color == 2 {
    print("0. there is only one land")
    return
  } else {
    color -= 1
  }
  // making the array or tapple that have sets of color
  var townConbination = [(Int, Int)]()
  for i in 2...color-1 {
    for j in i+1...color {
      townConbination.append((i, j))
    }
  }
  
  var mininum = Int.max
  for (from, to) in townConbination {
    var distances = [[Int]](repeating: [Int](repeating: 0, count: firstLine), count: firstLine)
    let distance = distanceBfs(from, to, &groupMap, &distances)
    mininum = min(mininum, distance)
  }
  
  print(mininum)
  
  // for bfs from 1 to another
  // make array of distance
  func distanceBfs(_ fromColor: Int, _ toColor: Int, _ groupMap: inout [[Int]], _ distances: inout [[Int]]) -> Int {
    let adjacent = [
      (-1, 0),
      (0, 1),
      (1, 0),
      (0, -1)
    ]
    let height = groupMap.count
    let width = groupMap[0].count
    var vistited = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
    let q = Queue<(Int, Int)>()
    
    for (y, row) in groupMap.enumerated() {
      for (x, cell) in row.enumerated() {
        if cell == fromColor {
          q.enqueue(item: (y, x))
          vistited[y][x] = true
        }
      }
    }
    
    while !q.isEmpty() {
      let current = q.dequeue()!
      let y = current.0
      let x = current.1
      
      for (dy, dx) in adjacent {
        let ny = dy + y
        let nx = dx + x
        if ny >= 0 && ny < height && nx >= 0 && nx < width && !vistited[ny][nx] && groupMap[ny][nx] != fromColor {
          if groupMap[ny][nx] == toColor {
            return distances[y][x]
          }
          vistited[ny][nx] = true
          distances[ny][nx] = distances[y][x] + 1
          q.enqueue(item: (ny, nx))
        }
      }
    }
    return -1
  }
  
  func groupBfs(_ start: (Int, Int), _ color: Int, _ groupMap: inout [[Int]], _ map: inout [[Int]]) {
    let adjacent = [
      (-1, 0),
      (0, 1),
      (1, 0),
      (0, -1)
    ]
    
    let height = groupMap.count
    let width = groupMap[0].count
    let q = Queue<(Int, Int)>()
    q.enqueue(item: start)
    
    while !q.isEmpty() {
      let current = q.dequeue()!
      let y = current.0
      let x = current.1
      groupMap[y][x] = color
      
      for (dy, dx) in adjacent {
        let ny = y + dy
        let nx = x + dx
        if ny >= 0 && ny < height && nx >= 0 && nx < width && groupMap[ny][nx] == 0 && map[ny][nx] == 1 {
          q.enqueue(item: (ny, nx))
        }
      }
    }
  }
}
