//
//  Queue.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-20.
//

import Foundation

public final class Queue<E>: Sequence {
  private var first: Node<E>? = nil
  private var last: Node<E>? = nil
  private(set) var count: Int = 0
  
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  public init() {}
  
  public func enqueue(item: E) {
    let newNode = Node(item: item)
    guard let oldLast = self.last else {
      self.first = newNode
      self.last = newNode
      count += 1
      return
    }
    oldLast.next = newNode
    self.last = newNode
    count += 1
  }
  
  public func dequeue() -> E? {
    if let item = self.first {
      self.first = item.next
      count -= 1
      
      if isEmpty() { last = nil }
      return item.item
    }
    return nil
  }
  
  public func peek() -> E? {
    if let item = self.first {
      return item.item
    }
    return nil
  }
  
  public func isEmpty() -> Bool {
    return first == nil
  }
  
  public func makeIterator() -> QueueIterator<E> {
    return QueueIterator(first)
  }
  
  public struct QueueIterator<E>: IteratorProtocol {
    public typealias Element = E
    private var current: Node<E>?
    
    fileprivate init (_ first: Node<E>?) {
      self.current = first
    }
    public mutating func next() -> E? {
      if let item = current?.item {
        current = current?.next
        return item
      }
      return nil
    }
  }
}
