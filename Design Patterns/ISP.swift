//
//  ISP.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 16/04/24.
//

import Foundation

// MARK: - Without ISP

class Document {}

protocol Machine {
    func print(d: Document)
    func scan(d: Document)
    func fax(d: Document)
}

// MFP => Multifunction Printer
class MFP: Machine {
    func print(d: Document) {}
    func scan(d: Document) {}
    func fax(d: Document) {}
}

enum NoRequiredFunctionality: Error {
    case doesNotFax
    case doesNotScan
}

class OldFashionedPrinter: Machine {
    func print(d: Document) {}
    
    func scan(d: Document) {
        Swift.print("This Old Fashioned Printer doesn't support Scannig", NoRequiredFunctionality.doesNotScan)
    }
    
    func fax(d: Document) {
        Swift.print("This Old Fashioned Printer doesn't support Fax", NoRequiredFunctionality.doesNotFax)
    }
}


// MARK: - Using Interface Segregation Principle

protocol Printer {
    func print(d: Document)
}

protocol Scanner {
    func scan(d: Document)
}

protocol Fax {
    func fax(d: Document)
}

class OrdinaryPrinter: Printer {
    func print(d: Document) {}
}

class Photocopier: Printer, Scanner {
    func print(d: Document) {}
    func scan(d: Document) {}
}

protocol MultiFunctionDevice: Printer, Scanner, Fax {}

class MultiFunctionMachine: MultiFunctionDevice {
    let printer: Printer
    let scanner: Scanner
    
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    
    func print(d: Document) {}
    func scan(d: Document) {}
    func fax(d: Document) {}
}
