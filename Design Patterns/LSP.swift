//
//  LSP.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 16/04/24.
//

import Foundation


class Rectangle: CustomStringConvertible {
    var width = 0
    var height = 0
    
    init() {}
    init(_ width: Int, _ height: Int) {
        self.width = width
        self.height = height
    }
    
    var area: Int {
        width * height
    }
    
    var description: String {
        "width: \(width), height: \(height), area: \(area)"
    }
}

class Square: Rectangle {
    var side: Int = 0
    
    override var width: Int {
        get { return side }
        set { side = newValue }
    }
    
    override var height: Int {
        get { return side }
        set { side = newValue }
    }
    
    override var area: Int {
        side * side
    }
    
    override var description: String {
        "side: \(side), area: \(area)"
    }
}

struct LSPLearn {
    static func main() {
        let rc = Rectangle()
        setAndMeasure(rc)
        
        let sq = Square()
        setAndMeasure(sq)
        
        
        let theory = """
        Liskov Substitution Principle =>
        Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.
        In other words, if you replace one object with another that’s a subclass and this replacement could break the affected part, then you’re not following this principle.
        """
        
        print(theory)
    }
}

fileprivate func setAndMeasure(_ rc: Rectangle) {
    // setting height and width
    rc.width = 3
    rc.height = 4
    
    print("Expected area to be 12 but got \(rc.area)")
}

