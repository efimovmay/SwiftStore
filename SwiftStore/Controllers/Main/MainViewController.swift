//
//  MainViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

final class MainViewController: UITabBarController {
    
    
    let sellsProducts = Product.getRandomProducts(count: 8)
    let bestProducts = Product.getRandomProducts(count: 6)
    let recomendedProducts = Product.getRandomProducts(count: 8)
    // Empty cart
    var cart = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transfer cart array to other view cintrollers
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
