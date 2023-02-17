//
//  Cart.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 16.02.23.
//

class Cart {
    
    static var shared = Cart()
    
    var cart = [Product]()
    
    init() {}
    
    // For testing
    static func printOut(from viewController: String) {
        var output = ""
        Cart.shared.cart.forEach { output.append($0.model + " | ") }
        print(viewController + ": " + (Cart.shared.cart.isEmpty ? "EMPTY" : output))
    }

}
