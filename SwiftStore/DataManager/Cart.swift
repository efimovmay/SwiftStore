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

    static func append(_ product: Product) {
        Cart.shared.cart.append(product)
    }
    
    static func remove(_ product: Product) {
        if let index = Cart.shared.cart.firstIndex(of: product) {
            Cart.shared.cart.remove(at: index)
        }
    }
    
    // For testing
    #warning("Delete this method on closing the project")
    static func printOut(from viewController: String) {
        var output = ""
        Cart.shared.cart.forEach { output.append($0.model + " | ") }
        print(viewController + ": " + (Cart.shared.cart.isEmpty ? "EMPTY" : output))
    }
}
