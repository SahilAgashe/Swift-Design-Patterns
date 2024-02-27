//
//  Null_Object.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 23/02/24.
//

import Foundation

protocol Log {
    func info(_ msg: String)
    func warn(_ msg: String)
}

class ConsoleLog: Log {
    func info(_ msg: String) {
        print(msg)
    }
    
    func warn(_ msg: String) {
        print("WARNING: \(msg)")
    }
}

class NullLog: Log {
    func info(_ msg: String) {}
    func warn(_ msg: String) {}
    
    // if a function returns value, you can return default value that doesn't make logical error!
    // like func success() -> Bool { return true }
}

class BankAccount {
    
    var log: Log
    var balance = 0
    
    init(_ log: Log) {
        self.log = log
    }
    
    func deposit(_ amount: Int) {
        balance += amount
        log.info("LOG: Deposited \(amount), balance is now \(balance)")
    }
}

struct NullObjectLearn {
    static func main() {
        let log = ConsoleLog()
        let ba = BankAccount(log)
        ba.deposit(100)
        
        // Now I don't want logging!, so need to pass nil, like this let ba = ConsoleLog(nil)
        // so need to make log propery of BankAccount as Optional, like var log: Log?
        // But We can use Null Object Pattern here, No need to use Optional there.
        
        let log2 = NullLog()
        let ba2 = BankAccount(log2)
        ba2.deposit(100)
    }
}




