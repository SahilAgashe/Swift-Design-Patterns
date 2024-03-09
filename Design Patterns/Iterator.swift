//
//  Iterator.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 09/03/24.
//

import Foundation

// Iteration(traversal) is a core functionality of various data structures.
// Iterator: An object (or a method) that facilitates the traversal of a data structure.

class Node<T> {
    var value: T
    var left: Node<T>? = nil
    var right: Node<T>? = nil
    var parent: Node<T>? = nil
    
    init(value: T) {
        self.value = value
    }
    
    init(value: T, left: Node<T>, right: Node<T>) {
        self.value = value
        self.left = left
        self.right = right
        
        left.parent = self
        right.parent = self
    }
}

class InOrderIterator<T>: IteratorProtocol {
    var current: Node<T>?
    var root: Node<T>
    var yieldedStart = false
    
    init(root: Node<T>) {
        self.root = root
        current = root
        
        while current?.left != nil {
            current = current?.left
        }
    }
    
    func reset() {
        current = root
        yieldedStart = false
    }
    
    func next() -> Node<T>? {
        
        if !yieldedStart {
            yieldedStart = true
            return current
        }
        
        if current?.right != nil {
            current = current?.right
            while current?.left != nil {
                current = current?.left
            }
            return current
        } else {
            var p = current?.parent
            while p != nil && current === p?.right {
                current = p
                p = p?.parent
            }
            current = p
            return current
        }
    }
}

class BinaryTree<T>: Sequence {
    private let root: Node<T>
    
    init(root: Node<T>) {
        self.root = root
    }
    
    func makeIterator() -> InOrderIterator<T> {
        InOrderIterator<T>(root: root)
    }
}

struct IteratorLearn {
    static func main() {
        
        //         Binary Tree
        //           1
        //          / \
        //         2    3
        //
        //         Inorder traversal => 2 1 3
        
        let root = Node(
            value: 1,
            left: Node(value: 2),
            right: Node(value: 3)
        )
        
        let it = InOrderIterator(root: root)
        while let element = it.next() {
            print(element.value, terminator: " ")
        }
        print("\n---")
        
        
        //       Binary Tree
        //           0
        //          / \
        //        45   5
        //        / \
        //      123  456
        //           / \
        //        78    4578
        //    Inorder traversal => 123 45 78 456 4578 0 5
        let anotherRoot = Node(
        value: 0,
        left: Node(value: 45,
                   left: Node(value: 123),
                   right: Node(value: 456, left: Node(value: 78), right: Node(value: 4578))),
        right: Node(value: 5))
        
        let it1 = InOrderIterator(root: anotherRoot)
        while let element = it1.next() {
            print(element.value, terminator: " ")
        }
        print("\n---")
        
        let myBinaryTree = BinaryTree(root: anotherRoot)
        let nodes = AnySequence(myBinaryTree)
        print(nodes.map { $0.value })
    }
}
