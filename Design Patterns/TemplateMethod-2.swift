//
//  TemplateMethod-2.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 08/03/24.
//

import Foundation

// Abstract class can't used for object creation. Needs to be subclassed!
class Khela {
    
    // template method runnig high level algorithm
    func play() {
        initialize()
        startPlay()
        endPlay()
    }
    
    // needs to be override by subclasses!
    func initialize() {
        precondition(false, " \(#function) needs to be override by subclass!")
    }
    
    func startPlay() {
        precondition(false, " \(#function) needs to be override by subclass!")
    }
    
    func endPlay() {
        precondition(false, " \(#function) needs to be override by subclass!")
    }
}

class Cricket: Khela {
    override func initialize() {
        print("Cricket Khela Initalized! Start Playing.")
    }
    
    override func startPlay() {
        print("Cricket Khela Started! Enjoy the Khela.")
    }
    
    override func endPlay() {
        print("Cricket Khela Finished!")
    }
}

class Football: Khela {
    override func initialize() {
        print("Football Khela Initalized! Start Playing.")
    }
    
    override func startPlay() {
        print("Football Khela Started! Enjoy the Khela.")
    }
    
    override func endPlay() {
        print("Football Khela Finished!")
    }
}

struct TemplateMethodLearnPart2 {
    static func main() {
        let cricket = Cricket()
        cricket.play() // calling template method
        
        let football = Football()
        football.play() // calling template method
    }
}

/// Reference:-
/// Tutorialspoint you tube video where it is explained in Java programming language.
