//
//  maze.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-05.
//

import Foundation

func maze() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let height = firstLine[0]
  let width = firstLine[1]
  
  var check = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
  var grid = [[Int]]()
  for _ in 0..<height {
    grid.append(readLine()!.map { Int(String($0))! })
  }
  
  let q = Queue<Square>()
  check[0][0] = true
  q.enqueue(item: Square(x: 0, y: 0))
  
  while !q.isEmpty() {
    let square = q.dequeue()!
    let x = square.x
    let y = square.y
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      if nx >= 0 && nx < width && ny >= 0 && ny < height { // check the border
        if !check[ny][nx] && grid[ny][nx] >= 1 {
          q.enqueue(item: Square(x: nx, y: ny))
          grid[ny][nx] = grid[y][x] + 1
          check[ny][nx] = true
        }
      }
    }
  }
  print(grid[height - 1][width - 1])
}
