//
//  Tree.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-23.
//

import Foundation

func treeInput() -> [String: [String?]] {
  let nodes = Int(readLine()!)!
  var adjList: [String: [String?]] = [:]
  
  for _ in 0..<nodes {
    let strAry = readLine()!.split(separator: " ")
    let node = String(strAry[0])
    let leftChild = strAry[1] != "." ? String(strAry[1]) : nil
    let rightChild = strAry[2] != "." ? String(strAry[2]) : nil
    
    adjList[node] = []
    adjList[node]?.append(leftChild)
    adjList[node]?.append(rightChild)
  }
  return adjList
}

func preOrder() {
  func dfs(start: String, adjList: inout [String:[String?]]) {
    print(start, terminator: " ")
    for child in adjList[start]! {
      if let child {
        dfs(start: child, adjList: &adjList)
      }
    }
  }
  var adjList = treeInput()
  dfs(start: "A", adjList: &adjList)
  print()
}

func inOrder() {
  func dfs(start: String, adjList: inout [String:[String?]]) {
    if let left = adjList[start]![0] {
      dfs(start: left, adjList: &adjList)
    }
    print(start, terminator: " ")
    if let right = adjList[start]![1] {
      dfs(start: right, adjList: &adjList)
    }
  }
  var adjList = treeInput()
  dfs(start: "A", adjList: &adjList)
  print()
}

func postOrder() {
  func dfs(start: String, adjList: inout [String: [String?]]) {
    if let left = adjList[start]![0] {
      dfs(start: left, adjList: &adjList)
    }
    if let right = adjList[start]![1] {
      dfs(start: right, adjList: &adjList)
    }
    print(start, terminator: " ")
  }
  var adjList = treeInput()
  dfs(start: "A", adjList: &adjList)
  print()
}
