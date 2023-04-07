//
//  TomatoFarm.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-04.
//

import Foundation

func tomatoFarm() {
  let adjacent = [
    (-1, 0),
    (0, 1),
    (1, 0),
    (0, -1)
  ]
  
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let width = firstLine[0]
  let height = firstLine[1]
  var farm = [[Int]](repeating: [], count: height)
  var distances = [[Int]](repeating: [Int](repeating: 0, count: width), count: height)
  
  for i in 0..<height {
    farm[i] = readLine()!.split(separator: " ").map { Int($0)! }
  }
  
  bfs(&farm, &distances)
  if farm.flatMap({ $0 }).contains(0) {
    print(-1)
  } else {
    print(distances.flatMap({ $0 }).max()!)
  }
  // if farm has 0 return - 1
  // else return days
  
  func bfs(_ farm: inout [[Int]], _ distances: inout [[Int]]) {
    let queue = Queue<(Int, Int)>()
    
    for (i, row) in farm.enumerated() {
      for (j, cell) in row.enumerated() {
        if cell == 1 {
          distances[i][j] = 0
          queue.enqueue(item: (j, i))
        }
      }
    }
    
    while !queue.isEmpty() {
      let place = queue.dequeue()!
      
      // adding conditions
      for go in adjacent {
        let nx = place.0 + go.0
        let ny = place.1 + go.1
        if nx >= 0 && nx < width &&
            ny >= 0 && ny < height && farm[ny][nx] == 0 {
          farm[ny][nx] = 1
          distances[ny][nx] = distances[place.1][place.0] + 1
          queue.enqueue(item: (nx, ny))
        }
      }
    }
  }
}
