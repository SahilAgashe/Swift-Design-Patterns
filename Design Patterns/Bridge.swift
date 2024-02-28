//
//  Bridge.swift
//  Design Patterns
//
//  Created by SAHIL AMRUT AGASHE on 28/02/24.
//

import Foundation

// Bridge: Connecting components together through abstractions
// Decouple abstraction from implementation
// A stronger form of encapsulation
// Bridge prevents '2 raise to n' complexity explosion because of Inheritance (parent class, childs, further childs ...)


protocol Renderer {
    func renderCircle(_ radius: Float)
}

class VectorRenderer: Renderer {
    func renderCircle(_ radius: Float) {
        print("Drawing a circle of radius \(radius)")
    }
}

class RasterRenderer: Renderer {
    func renderCircle(_ radius: Float) {
        print("Drawing pixels for a circle of radius \(radius)")
    }
}

/// Raster Graphics
/// Raster graphics are composed of pixels

/// Vector Graphics
/// Making use of sequential commands or mathematical statements or programs which place lines or shapes in a 2-D or 3-D environment is referred to as Vector Graphics.

protocol Shape {
    func draw()
    func resize(_ factor: Float)
}

class Circle: Shape {
    var radius: Float
    var renderer: Renderer // Bridge: Connecting components together through abstractions
    
    init(_ renderer: Renderer, _ radius: Float) {
        self.renderer = renderer
        self.radius = radius
    }
    
    func draw() {
        renderer.renderCircle(radius)
    }
    
    func resize(_ factor: Float) {
        radius *= 2
    }
}

struct BridgeLearn {
    static func main() {
        let raster = RasterRenderer()
        let vector = VectorRenderer()
        
        let circle = Circle(vector, 5)
        circle.draw()
        circle.resize(2)
        circle.draw()
        
        let circle1 = Circle(raster, 3)
        circle1.draw()
        circle1.resize(2)
        circle1.draw()

    }
}
