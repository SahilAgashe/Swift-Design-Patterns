//
//  Iterator-UseCase.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 12/03/24.
//

import Foundation

class Creature: Sequence {
    
    private var stats = [Int](repeating: 0, count: 3)
    // stats indexing
    private let _strength = 0
    private let _agility = 1
    private let _intelligence = 2
    
    var strength: Int {
        get { return stats[_strength] }
        set(value) { stats[_strength] = value }
    }
    
    var agility: Int {
        get { return stats[_agility] }
        set(value) { stats[_agility] = value }
    }
    
    var intelligence: Int {
        get { return stats[_intelligence] }
        set(value) { stats[_intelligence] = value }
    }
    
    var averageStat: Int {
        return stats.reduce(0, +) / stats.count
    }
    
    func makeIterator() -> IndexingIterator<Array<Int>> {
        return IndexingIterator(_elements: stats)
    }
    
    subscript(index: Int) -> Int {
        get { return stats[index] }
        set { stats[index] = newValue }
    }
}

private let kDebugIteratorLearnUseCase = "DEBUG IteratorLearnUseCase"
struct IteratorLearnUseCase {
    
    static func main() {
        let c = Creature()
        c.strength = 10
        c.agility = 15
        c.intelligence = 11
        
        // We can use for loop here, because of Iterator
        for s in c {
            print(s, terminator:" ")
        }
        print("\n \(kDebugIteratorLearnUseCase) Average Stat => \(c.averageStat)")
        
        // Using subscript
        c[0] = 20
        
        for s in c {
            print(s, terminator: " ")
        }
    }
    
}
