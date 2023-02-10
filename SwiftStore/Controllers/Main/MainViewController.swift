//
//  MainViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

final class MainViewController: UITabBarController {
    
    // Empty cart
    var cart = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get random data for categories: Products for Sale, Bestsellers and Recomended to Buy
        let sellsProducts = getProductsForSale(count: 8)
        let bestProducts = Product.getRandomProducts(count: 6)
        let recomendedProducts = Product.getRandomProducts(count: 8)
        
        // Transfer data to other view cintrollers
        viewControllers?.forEach { vc in
            switch vc {
            case let vc as HomeViewController:
                vc.cart = cart
                vc.sellsProducts = sellsProducts
                vc.bestProducts = bestProducts
                vc.recomendedProducts = recomendedProducts
            case let vc as CatalogueViewController:
                vc.cart = cart
            case let vc as CartViewController:
                vc.cart = cart
            case let vc as ProductInfoViewController:
                vc.cart = cart
            default: break
            }
        }
    }
}

extension MainViewController {
    // Get random products with discount
    func getProductsForSale(count: Int) -> [Product] {
        var products = [Product]()
        var backCounter = count
        
        while backCounter > 0 {
            guard let product = Product.getRandomProducts(count: 1).first else { continue }
            if product.onSale {
                products.append(product)
                backCounter -= 1
            }
        }
        return products
    }
}
