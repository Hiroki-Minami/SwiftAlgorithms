//
//  SearchParent.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-24.
//

import Foundation

func searchParentDfs(_ start: Int, _ adjList: inout [[Int]], _ visited: inout Set<Int>, _ results: inout [String]) {
  visited.insert(start)
  for v in adjList[start] {
    if !visited.contains(v) {
      results[v] = String(start)
      searchParentDfs(v, &adjList, &visited, &results)
    }
  }
}

func whosMyParentInput() {
  let nodes = Int(readLine()!)!
  var adjList = [[Int]](repeating: [], count: nodes + 1)
  
  for _ in 1..<nodes {
    let line = readLine()!.split(separator: " ")
    let from = Int(line[0])!
    let to = Int(line[1])!
    adjList[from].append(to)
    adjList[to].append(from)
  }
  
  var results = [String](repeating: "", count: nodes + 1)
  var visited = Set<Int>()
    
  searchParentDfs(1, &adjList, &visited, &results)
  
  for node in 2...nodes {
    print(results[node])
  }
}

func whosMyParentInputFile(inFile: String) -> [String] {
  let contents = try! String(contentsOfFile: inFile).split(separator: "\n")
  let nodes = Int(contents[0])!
  var adjList = [[Int]](repeating: [], count: nodes + 1)
  
  for lineNum in 1..<nodes {
    let line = contents[lineNum].split(separator: " ")
    let from = Int(line[0])!
    let to = Int(line[1])!
    adjList[from].append(to)
    adjList[to].append(from)
  }
  
  var results = [String](repeating: "", count: nodes + 1)
  var visited = Set<Int>()
    
  searchParentDfs(1, &adjList, &visited, &results)
  return Array(results[2...])
}

func testWhosMyParentInputFile() {
  let fileManager = FileManager.default
  let path = "/Users/minamihiroki/Desktop/WMAD_Program/Swift-AGDS/SwiftAGDSTests/parent/"
  let contents = try! fileManager.contentsOfDirectory(atPath: path)
  var failed = 0
  
  for content in contents {
    if content.contains(".in") {
      let inFile = path + content
      let results = whosMyParentInputFile(inFile: inFile)
      
      let outFile = path + content.replacing(".in", with: ".out")
      let expect = try! String(contentsOfFile: outFile).split(separator: "\n")
        .map { String($0) }
      
      if results != expect {
        failed += 1
        print("Test falied: in file: \(content)")
      } else {
        print("Done: in file: \(content)")
      }
    }
  }
  
  if failed == 0 {
    print("Success")
  } else {
    print("Failed: failed number: \(failed)")
  }
}

