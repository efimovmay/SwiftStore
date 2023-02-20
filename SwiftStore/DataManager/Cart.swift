//
//  Cart.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 16.02.23.
//

class Cart {
    
    static var shared = Cart()
    
    static var isEmpty: Bool {
        Cart.shared.cart.isEmpty
    }
    
    var cart = [Product]()
    
    init() {}
    
    static func contains(_ product: Product) -> Bool {
        Cart.shared.cart.contains(product)
    }

    // For testing
    #warning("Delete this method on closing the project")
    static func printOut(from viewController: String) {
        var output = ""
        Cart.shared.cart.forEach { output.append($0.model + " | ") }
        print(viewController + ": " + (Cart.shared.cart.isEmpty ? "EMPTY" : output))
    }
}
