//
//  Stack.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-20.
//

import Foundation

public final class Stack<E>: Sequence {
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
  
  public func push(item: E) {
    let oldLast = self.last
    last = Node<E>(item: item, next: oldLast)
    count += 1
  }
  
  public func pop() -> E? {
    if let item = self.last {
      self.last = item.next
      count -= 1
      return item.item
    }
    return nil
  }
  
  public func peek() -> E? {
    if let last = self.last {
      return last.item
    }
    return nil
  }
  
  public func isEmpty() -> Bool {
    return last == nil
  }
  
  public func makeIterator() -> StackIterator<E> {
    return StackIterator(last)
  }
  
  public struct StackIterator<E>: IteratorProtocol {
    public typealias Element = E
    
    private var current: Node<E>?
   
    fileprivate init(_ last: Node<E>?) {
      self.current = last
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
