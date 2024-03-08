//
//  TemplateMethod.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 08/03/24.
//

import Foundation

// Template Method: A high level blueprint for an algorithm to be completed by inheritors.

// Game is Abstract Class. Needs to be subclassed!
class Game {
    
    /// run() :- Template method determining high level game algorithm.
    func run() {
        start()
        while !haveWinner {
            takeTurn()
        }
        print("Player \(winningPlayer) wins!")
    }
    
    var haveWinner: Bool {
        precondition(false, "this method needs to be overridden")
        return false
    }
    
    var winningPlayer: Int {
         precondition(false, "this method needs to be overridden")
        return -1
    }
    
    func start() {
        precondition(false, "this method needs to be overridden")
    }
    
    func takeTurn() {
        precondition(false, "this method needs to be overridden")
    }
    
    var currentPlayer = 0
    var numberOfPlayer = -1
    init() {}
}

class Chess: Game {
    
    private let maxTurns = 10
    private var turn = 1
    
    init(_ numberOfPlayer: Int) {
        super.init()
        self.numberOfPlayer = numberOfPlayer
    }
    
    override var haveWinner: Bool {
        return turn == maxTurns
    }
    
    override var winningPlayer: Int {
        return currentPlayer
    }
    
    override func start() {
        print("Starting a game of chess with \(numberOfPlayer) players.")
    }
    
    override func takeTurn() {
        print("Turn \(turn) taken by player \(currentPlayer).")
        currentPlayer = (currentPlayer + 1) % numberOfPlayer
        turn += 1
    }
}

struct TemplateMethodLearn {
    static func main() {
        let chess = Chess(2)
        chess.run()
    }
}
