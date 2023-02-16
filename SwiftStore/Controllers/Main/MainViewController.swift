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
            if let homeVC = vc as? HomeViewController {
                homeVC.sellsProducts = sellsProducts
                homeVC.bestProducts = bestProducts
                homeVC.recommendedProducts = recomendedProducts
            }
                
            if let catalogNaviVC = vc as? UINavigationController {
                if let catalogVC = catalogNaviVC.topViewController as? CatalogueViewController {
                    catalogVC.allProducts = allProducts
                }
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
