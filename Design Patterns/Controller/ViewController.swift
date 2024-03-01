//
//  ViewController.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 23/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Thank you God for this learning opportunity!")
        //NullObjectLearn.main()
        //MediatorLearn.main()
        BridgeLearn.main()
    }


}

// MARK: - Design Patterns
struct ThePatterns {
    
    enum Creational: String {
        case Builder
        case AbstractFactory
        case FactoryMethod
        case Prototype
        case Singleton
    }
    
    enum Structural: String {
        case Adapter
        case Bridge // done
        case Composite
        case Decorator
        case Facade
        case Flyweight
        case Proxy
    }
    
    enum Behavioral: String {
        case ChainOfResponsibility
        case Command
        case Interpreter
        case Iterator
        case Mediator // done
        case Memento
        case NullObject // done
        case Observer
        case State // done
        case Strategy
        case TemplateMethod
        case Visitor
    }
}
