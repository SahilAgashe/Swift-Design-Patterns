//
//  SRP.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 15/04/24.
//

import Foundation

class Journal: CustomStringConvertible {
    var entries = [String]()
    var count = 0
    
    // returns index
    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
    
    /// Journal is responsible for adding, removing entries. Not for saving.
    /// So for saving Journal, you can make another class Persistence.
    /// don't add save functionality here! as per SRP.
    // func saveTo(_ filename: String, _ overwrite: Bool = false) { // save to a file }
}

class Persistence {
    func save(_ journal: Journal, filename: String, _ overwrite: Bool = false) { }
}

struct SRPLearn {
    static func main() {
        // Journal
        let j = Journal()
        let _ = j.addEntry("I cried today")
        let bug = j.addEntry("I ate a bug")
        print(j)
        
        print("<=======>")
        j.removeEntry(bug)
        print(j)
        
        // Saving journal in a file
        let p = Persistence()
        let filename = "abcd/sahil/amrut/agashe/believe/that"
        p.save(j, filename: filename, false)
    }
}
