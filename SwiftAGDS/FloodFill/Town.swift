//
//  Town.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-05.
//

import Foundation

func town() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  var answer = [Int](repeating: 0, count: 25 * 25)
  
  func bfs(x: Int, y: Int, color: Int, n: Int) {
    let q = Queue<Square>()
    q.enqueue(item: Square(x: x, y: y))
    groupMap[x][y] = color
    answer[color] += 1
    
    while !q.isEmpty() {
      let square = q.dequeue()!
      let x = square.x
      let y = square.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < n { // check the border
          // check if visited, check if there's a house
          if townMap[nx][ny] == 1 && groupMap[nx][ny] == 0 {
            q.enqueue(item: Square(x: nx, y: ny))
            groupMap[nx][ny] = color
            answer[color] += 1
          }
        }
      }
    }
  }
  
  var townMap = [[Int]]()
  var groupMap = [[Int]](repeating: [Int](repeating: 0, count: 25), count: 25)
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    townMap.append(row)
  }

  var color = 0
  for x in 0..<n {
    for y in 0..<n {
      if townMap[x][y] == 1 && groupMap[x][y] == 0 {
        color += 1
        bfs(x: x, y: y, color: color, n: n)
      }
    }
  }
  
  print(color)
  
  answer = Array(answer[1...color])
  answer.sort()
  for i in 0..<color {
    print(answer[i])
  }
}
