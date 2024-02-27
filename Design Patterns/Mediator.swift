//
//  Mediator.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 27/02/24.
//

import Foundation

//MARK: -  Chat Room Using Mediator

class Person {
    var name: String
    var room: ChatRoom?
    private var chatLog = [String]()
    
    init(_ name: String) {
        self.name = name
    }
    
    func receive(sender: String, message: String) {
        let s = "\(sender): \(message)"
        print("[\(name)'s chat session] \(s)")
    }
    
    func say(_ message: String) {
        room?.broadcast(sender: name, message: message)
    }
    
    // personal direct message to target using room itself.
    func pm(to target: String, message: String) {
        room?.message(sender: name, destination: target, message: message)
    }
}

class ChatRoom {
    private var  people = [Person]()
    
    func broadcast(sender: String, message: String) {
        people.forEach { p in
            if p.name != sender {
                p.receive(sender: sender, message: message)
            }
        }
    }
    
    func join(_ p: Person) {
        let joinMessage = "\(p.name) joins the chat!"
        broadcast(sender: "room", message: joinMessage)
        p.room = self
        people.append(p)
    }
    
    func message(sender: String, destination: String, message: String) {
        people.first { $0.name == destination }?.receive(sender: sender, message: message)
    }
}

struct MediatorLearn {
    static func main() {
        let room = ChatRoom()
        
        let sahil = Person("sahil")
        let sagar = Person("sagar")
        
        room.join(sahil)
        room.join(sagar)
        
        sahil.say("hi room")
        sagar.say("oh, hey sahil")
        
        let abhijeet = Person("abhijeet")
        room.join(abhijeet)
        abhijeet.say("hi everyone!")
        
        sagar.pm(to: "abhijeet", message: "glad you could join us!")
    }
}
