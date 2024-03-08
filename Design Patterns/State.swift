//
//  State.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 29/02/24.
//

import Foundation

protocol VendingMachineState {
    func handleRequest()
}

class NotReadyState: VendingMachineState {
    func handleRequest() {
    }
}

class ReadyState: VendingMachineState {
    func handleRequest() {
        
    }
}

class ProductSelectedState: VendingMachineState {
    func handleRequest() {
        
    }
}

class PaymentPendingState: VendingMachineState {
    func handleRequest() {
        
    }
}

class OutOfStockState: VendingMachineState {
    func handleRequest() {
        
    }
}


class VendingMachineContext {
    var state: VendingMachineState = NotReadyState()
    
    func setState(_ state: VendingMachineState) {
        self.state = state
    }
    
    func request() {
        state.handleRequest()
    }
}


struct StateLearn {
    static func main() {
        let vendingMachine = VendingMachineContext()
        
        vendingMachine.setState(ReadyState())
        vendingMachine.request()
        
        vendingMachine.setState(ProductSelectedState())
        vendingMachine.request()
        
        vendingMachine.setState(PaymentPendingState())
        vendingMachine.request()
        
        vendingMachine.setState(OutOfStockState())
        vendingMachine.request()
    }
}

/// Reference:- 
/// https://www.geeksforgeeks.org/state-design-pattern/
/// Vending Machine
///A vending machine is a mechanical device that dispenses items such as snacks, beverages, cigarettes, lottery tickets, or even electronics to customers automatically, after the customer inserts money or credit into the machine. These machines are commonly found in public places like airports, train stations, shopping malls, and workplaces, providing convenience for people to purchase items without the need for human assistance.
