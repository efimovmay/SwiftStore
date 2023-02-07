//
//  MainViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

class MainViewController: UITabBarController {
    
    // Empty cart
    var cart = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transfer cart array to other view cintrollers
        viewControllers?.forEach { vc in
            switch vc {
            case let vc as HomeViewController:
                vc.cart = cart
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
