//
//  Bag.swift
//  Swift-AGDS
//
//  Created by Hiroki Minami on 2023-03-20.
//

import Foundation

// Sigly-LinkedList
public final class Bag<E>: Sequence {
  private var first: Node<E>? = nil
  private(set) var count: Int = 0
  
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  public init() { }
  
  public func isEmpty() -> Bool {
    return first == nil
  }
  
  public func add(item: E) {
    let oldFirst = first
    first = Node<E>(item: item, next: oldFirst)
    count += 1
  }
  
  public func makeIterator() -> BagIterator<E> {
    return BagIterator(first)
  }
  
  public struct BagIterator<E>: IteratorProtocol {
    private var current: Node<E>?
    
    fileprivate init(_ first: Node<E>?) {
      self.current = first
    }
    
    public mutating func next() -> E? {
      if let item = current?.item {
        current = current?.next
        return item
      }
      return nil
    }
    
    public typealias Element = E
  }
}
