//
//  MainViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

final class MainViewController: UITabBarController {
    
    private enum ProductGroup {
        case onSale
        case bestseller
        case recommended
    }
    
    // Empty cart
    var cart = [Product]()
    // All products at store
    let allProducts = Product.getRandomProducts(count: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get random data for categories: Products for Sale, Bestsellers and Recomended to Buy
        let sellsProducts = getProductsForGroup(.onSale, count: 8)
        let bestProducts = getProductsForGroup(.bestseller, count: 6)
        let recomendedProducts = getProductsForGroup(.recommended, count: 8)
        
        // Transfer data to other view controllers
        viewControllers?.forEach { vc in
            switch vc {
            case let vc as HomeViewController:
                vc.cart = cart
                vc.sellsProducts = sellsProducts
                vc.bestProducts = bestProducts
                vc.recommendedProducts = recomendedProducts
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
   
    private func getProductsForGroup(_ group: ProductGroup, count: Int) -> [Product] {
        var productsFiltered = [Product]()
        var productsInGroup = [Product]()
            switch group {
            case .onSale: productsFiltered = allProducts.filter { $0.onSale }
            case .bestseller: productsFiltered = allProducts.filter { $0.isBestseller && !$0.onSale }
            default: productsFiltered = allProducts.filter { $0.isRecommended && !$0.onSale}
            }
      
        for _ in 1...count {
            productsInGroup.append(productsFiltered.removeFirst())
        }
        
        return productsInGroup
    }
}
